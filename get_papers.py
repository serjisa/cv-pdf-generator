import argparse
from scholarly import scholarly, ProxyGenerator
import numpy as np
import yaml
import requests

def match_name(name, record):
    """
    We have to identify author's name in complicated cases,
    e.g. Sergey Isaev <-> Sergey V. Isaev*
    """
    name_elements = name.split(" ")
    records = [i.strip("*") for i in record.split(" ")]
    return not bool(sum([
        not(name_element in records) for name_element in name_elements
    ]))

parser = argparse.ArgumentParser(prog="Script that modifies rendercv .yaml schema via adding publications there")

parser.add_argument("-f", "--file", help="Path to .yaml-file",
                    default="Sergey_Isaev_CV.yaml")
parser.add_argument("-n", "--name", help="Author's name",
                    default="Sergey Isaev")
parser.add_argument("-id", "--google_scholar", help="Google Scholar ID",
                    default="fZlONS4AAAAJ")
parser.add_argument("-na", "--n_authors", help="Number of leading authors",
                    default=3)
parser.add_argument("-p", "--use_proxy", help="Use proxy to avoid bans",
                    action="store_true")


args = parser.parse_args()

filename = args.file
with open(filename) as f:
    yaml_file = yaml.safe_load(f)

author_name = args.name
n_authors = args.n_authors
author_id = args.google_scholar

if args.use_proxy:
    pg = ProxyGenerator()
    pg.FreeProxies()
    scholarly.use_proxy(pg)

author = scholarly.search_author_id(author_id, sortby="year")
author = scholarly.fill(author, sections=["publications"], sortby="year")

publications = []
for pub in author["publications"]:
    pub_filled = scholarly.fill(pub)
    
    authors = pub_filled["bib"]["author"].split(" and ")
    title = pub_filled["bib"]["title"]
    journal = pub_filled["bib"]["citation"]
    date = pub_filled["bib"]["pub_year"]
    pub_id = pub_filled["author_pub_id"]
    url = f"https://scholar.google.com/citations?view_op=view_citation&hl=en&user={author_id}&citation_for_view={pub_id}"
    
    position = np.argwhere([match_name(author_name, s) for s in authors])[0][0] + 1
    name = authors[position - 1]
    if position > (n_authors + 1):
        authors_list = authors[:n_authors] + ["...", name]
    elif position == (n_authors + 1):
        authors_list = authors[:(n_authors + 1)]
    else:
        authors_list = authors[:n_authors]
    if (position < len(authors)):
        authors_list += ["et al."]
    authors_list = [i if i != name else f"***{i}***" for i in authors_list]
    if sum([(i.count("*") % 2 > 0) for i in authors_list]) > 0:
        authors_list[-1] += " *(\\*equal contribution)*"

    publications.append({
        "title": title,
        "authors": authors_list,
        "journal": f"*[{journal}]({url})*"
    })

yaml_file["cv"]["sections"]["publications"] = publications
with open(filename, "w") as f:
    yaml.dump(yaml_file, f, sort_keys=False)

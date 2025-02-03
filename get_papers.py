import argparse
from scholarly import scholarly
import numpy as np

parser = argparse.ArgumentParser(prog="Script that modifies rendercv .yaml schema via adding publications there")

parser.add_argument("-f", "--file", help="Path to .yaml-file",
                    default="Sergey_Isaev_CV.yaml")
parser.add_argument("-n", "--name", help="Author's name",
                    default="Sergey Isaev")
parser.add_argument("-id", "--google_scholar", help="Google Scholar ID",
                    default="fZlONS4AAAAJ")

args = parser.parse_args()

filename = args.file
author_name = args.name.split(" ")
author_id = args.google_scholar
author = scholarly.search_author_id(author_id, sortby="year")
author = scholarly.fill(author, sections=["publications"], sortby="year")

s = " " * 4 + "publications:\n"
for pub in author["publications"]:
    pub_filled = scholarly.fill(pub)
    
    authors = pub_filled["bib"]["author"].split(" and ")
    title = pub_filled["bib"]["title"]
    journal = pub_filled["bib"]["citation"]
    date = pub_filled["bib"]["pub_year"]
    url = pub_filled["pub_url"]
    url = url.replace("(", "%28").replace(")", "%29")
    
    position = np.argwhere([((author_name[0] in s) and (author_name[1] in s)) for s in authors])[0][0] + 1
    name = authors[position - 1]
    if position > 4:
        authors_list = authors[:3] + ["...", name]
    elif position == 4:
        authors_list = authors[:4]
    else:
        authors_list = authors[:3]
    if (position < len(authors)):
        authors_list += ["et al."]
    authors_list = [i if i != name else f"***{i}***" for i in authors_list]

    s += " " * 6 + f"- title: '{title}'\n"
    s += " " * 8 + f"authors:\n"
    for a in authors_list:
        s += " " * 10 + f"- '{a}'\n"
    s += " " * 8 + f"journal: '*[{journal}]({url})*'\n"

with open(filename) as f:
    file = f.read().split("\n")
    modified_file = ""
    publine = False

    for line in file:
        if publine and (line[:6] != "      "):
            publine = False
        if (line != "    publications:") and not publine:
            modified_file += line + "\n"
        elif line == "    publications:":
            modified_file += s
            publine = True
        
with open(filename, "w") as f:
    f.write(modified_file)
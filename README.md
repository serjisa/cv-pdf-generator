# cv-pdf-generator
CV generator using scholarly and rendercv

## Usage

To generate the CV with updated publications from Google Scholar:

```bash
python3 get_papers.py --use_proxy
```

### Arguments
- `-f`, `--file`: Path to .yaml-file (default: `Sergey_Isaev_CV.yaml`)
- `-n`, `--name`: Author's name (default: `Sergey Isaev`)
- `-id`, `--google_scholar`: Google Scholar ID (default: `fZlONS4AAAAJ`)
- `-na`, `--n_authors`: Number of leading authors (default: `3`)
- `-p`, `--use_proxy`: Use proxy to avoid bans (optional)

This is a hack-once-and-forget makefile and scripts to build a shell script that greps http status codes gotten from IANA.

The code is horrible and to be honest, this was written for fun only.

# What it does
1. curl the http status code registry csv from the IANA
2. preprocess it to be a csv with one entry per line (no ranges)
3. Build a stand-alone shell script from this

# How to use it
Run `make` to get the script that then gets generated as `http-status-codes.sh`

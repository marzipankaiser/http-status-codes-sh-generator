.PHONY: clean all
all-clean: clean all

all: ./http-status-codes.sh

clean:
	rm ./http-status-codes.csv || :
	rm ./http-status-code-preprocessed.csv || :
	rm ./http-status-codes.sh || :

http-status-codes.csv:
	curl 'https://www.iana.org/assignments/http-status-codes/http-status-codes-1.csv' > $@

http-status-codes-preprocessed.csv: http-status-codes.csv preprocess.sh
	./preprocess.sh
http-status-codes-preprocessed.tsv: http-status-codes-preprocessed.csv
	cat $< | sed -E 's/^(("[^"]*")|([^",]*)),/\1\t/g' | sed -E 's/\t(("[^"]*")|([^",]*)),/\t\1\t/g' > $@

http-status-codes.sh: http-status-codes-preprocessed.tsv gensh.sh
	./gensh.sh

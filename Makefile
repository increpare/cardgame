FILES = data/text/kreaturen.csv data/text/orte.csv data/text/ruestung.csv

all: $(FILES)

$(FILES): test/databank.numbers
	./SpreadsheetExportToCSV test/databank.numbers ~/Documents/cardgame/data/text/datenbank
	mv data/text/datenbank/Kreaturen-Tabelle\ 1.csv data/text/kreaturen.csv
	mv data/text/datenbank/Orte-Tabelle\ 1.csv data/text/orte.csv
	mv data/text/datenbank/Rüstung-Tabelle\ 1.csv data/text/ruestung.csv
	rm -rf data/text/datenbank

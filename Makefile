FILES1 = data/text/kreaturen.csv data/text/orte.csv data/text/ruestung.csv

FILES2 = $(shell find unoptimized/sprites -maxdepth 1 -type f -iname "*.png" | sed 's/unoptimized/\data\/graphics/g')

FILES3 = $(shell find unoptimized/bilder -maxdepth 1 -type f -iname "*.png" | sed 's/unoptimized/\data\/graphics/g')

all: $(FILES1) $(FILES2) $(FILES3)

$(FILES1): test/databank.numbers
	./SpreadsheetExportToCSV test/databank.numbers ~/Documents/cardgame/data/text/datenbank
	mv data/text/datenbank/Kreaturen-Tabelle\ 1.csv data/text/kreaturen.csv
	mv data/text/datenbank/Orte-Tabelle\ 1.csv data/text/orte.csv
	mv data/text/datenbank/Rüstung-Tabelle\ 1.csv data/text/ruestung.csv
	rm -rf data/text/datenbank

data/graphics/sprites/%: unoptimized/sprites/%
	pngcrush  $< $@


data/graphics/bilder/%: unoptimized/bilder/%
	pngcrush  $< $@

run:
	coffee app.coffee

DBNAME = $(shell ./getcfg database dbname)
DBUSER = $(shell ./getcfg database username)
DBPASS = $(shell ./getcfg database password)
MYSQL = mysql -u $(DBUSER) --password='$(DBPASS)'

load:
	$(MYSQL) -e "CREATE MY DATABASE IF NOT EXISTS $(DBNAME)"
	$(MYSQL) $(DBNAME) < database.sql


FROM kartoza/postgis

# Custom initialization scripts
#COPY ./init.sh /docker-entrypoint-initdb.d/init.sh

COPY dbCreateCovidDB.sql /docker-entrypoint-initdb.d/dbCreateCovidDB.sql
#COPY agregations_by_country.sql /docker-entrypoint-initdb.d/agregations_by_country.sql
#COPY credentials.sql /docker-entrypoint-initdb.d/credentials.sql
#COPY countries-bin.sql /docker-entrypoint-initdb.d/countries-bin.sql
#COPY countries-bin.backup /docker-entrypoint-initdb.d/countries-bin.backup
#COPY states-bin.sql /docker-entrypoint-initdb.d/states-bin.sql
#COPY states-bin.backup /docker-entrypoint-initdb.d/states-bin.backup

# Custom initialization scripts
#COPY agregations_by_country.sql /agregations_by_country.sql
#COPY credentials.sql /credentials.sql
#COPY countries-bin.sql /countries-bin.sql
#COPY states-bin.sql /states-bin.sql

#RUN chmod +x /docker-entrypoint-initdb.d/init.sh
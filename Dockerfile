FROM mariadb:10.0

ENV HUGE_VERSION 3.1

RUN apt-get update && apt-get install -y git \
	&& git clone git@github.com:panique/huge.git \
	&& git checkout tags/$HUGE_VERSION \
	&& cd huge/application/_installation \
	&& mysql -h localhost -u root -p 12345678 < 01-create-datebase.sql \
	&& mysql -h localhost -u root -p 12345678 < 02-create-table-users.sql \
	&& mysql -h localhost -u root -p 12345678 < 03-create-table-notes.sql \
	&& rm -rf huge \
	&& rm -rf /var/lib/apt/lists/* \
	&& apt-get purge git

CMD ["mysqld"]

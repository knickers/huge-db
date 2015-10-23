FROM mariadb:10.0

ENV HUGE_VERSION v3.1

RUN apt-get update && apt-get install -y \
		git openssl ca-certificates \
		--no-install-recommends \
	&& git clone https://github.com/panique/huge.git \
	&& git checkout tags/$HUGE_VERSION \
	&& cd huge/application/_installation \
	&& mysql -h localhost -u root -p 12345678 < 01-create-datebase.sql \
	&& mysql -h localhost -u root -p 12345678 < 02-create-table-users.sql \
	&& mysql -h localhost -u root -p 12345678 < 03-create-table-notes.sql \
	&& rm -rf huge \
	&& rm -rf /var/lib/apt/lists/* \
	&& apt-get purge --auto-remove -y git openssl ca-certificates

CMD ["mysqld"]

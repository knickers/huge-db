FROM mariadb:10.0

ENV MYSQL_ROOT_PASSWORD example
ENV HUGE_VERSION v3.1

RUN set -x \
	&& apt-get update && apt-get install -y \
		git openssl ca-certificates \
		--no-install-recommends \
	&& git clone https://github.com/panique/huge \
	&& cd huge \
	&& git checkout tags/$HUGE_VERSION \
	&& cd application/_installation \
	&& mysql -h localhost -u root -p example < 01-create-database.sql \
	&& mysql -h localhost -u root -p example < 02-create-table-users.sql \
	&& mysql -h localhost -u root -p example < 03-create-table-notes.sql \
	&& cd \
	&& rm -rf huge \
	&& rm -rf /var/lib/apt/lists/* \
	&& apt-get purge --auto-remove -y git openssl ca-certificates

CMD ["mysqld"]

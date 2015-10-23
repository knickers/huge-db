FROM mariadb:10.0

ENV HUGE_VERSION v3.1

RUN set -x \
	&& apt-get update && apt-get install -y \
		git openssl ca-certificates \
		--no-install-recommends \
	&& git clone https://github.com/panique/huge \
	&& cd huge \
	&& git checkout tags/$HUGE_VERSION \
	&& mv application/_installation/*.sql ../docker-entrypoint-initdb.d/ \
	&& cd \
	&& rm -rf huge /var/lib/apt/lists/* \
	&& apt-get purge --auto-remove -y git openssl ca-certificates

CMD ["mysqld"]

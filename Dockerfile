FROM wordpress:6.7.0-php8.2-apache

RUN set -x \
	&& apt-get update \
	&& apt-get install -y libldap2-dev \
	&& rm -rf /var/lib/apt/lists/* \
	&& docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/ \
	&& docker-php-ext-install ldap \
	&& apt-get purge -y --auto-remove libldap2-dev

COPY custom.ini $PHP_INI_DIR/conf.d/

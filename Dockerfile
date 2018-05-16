FROM debian:stretch-slim

RUN apt-get update && apt-get install --no-install-recommends -y \
  curl \
  gnupg2 \
  lsb-release \
  apt-transport-https \
  ca-certificates

# Install node/uglifyjs
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - \
    && apt-get install --no-install-recommends -y nodejs \
    && npm install -g uglify-js

# Make php7.1 available
RUN curl -sL https://packages.sury.org/php/apt.gpg > /etc/apt/trusted.gpg.d/php.gpg \
    && echo "deb https://packages.sury.org/php/ stretch main" > /etc/apt/sources.list.d/php.list \
    && apt-get update && apt-get install --no-install-recommends -y \
    tar \
    bzip2 \
    apache2 \
    php7.1 \
    libapache2-mod-php7.1 \
    libapache2-mod-security2 modsecurity-crs \
    php7.1-xml \
    php7.1-dom \
    php7.1-intl \
    php7.1-sqlite3 \
    php7.1-mbstring \
  && rm -rf /var/lib/apt/lists/*

# Install composer
RUN curl -sL https://getcomposer.org/installer > composer-setup.php \
    && php composer-setup.php --install-dir=/usr/bin --filename=composer \
    && rm composer-setup.php

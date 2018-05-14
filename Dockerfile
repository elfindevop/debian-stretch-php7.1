FROM debian:stretch
RUN apt-get update && apt-get install --no-install-recommends -y \
  curl \
  gnupg2 \
  lsb-release \
  apt-transport-https \
  ca-certificates
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN curl -sL https://packages.sury.org/php/apt.gpg > /etc/apt/trusted.gpg.d/php.gpg
RUN echo "deb https://packages.sury.org/php/ stretch main" > /etc/apt/sources.list.d/php.list
RUN apt-get update && apt-get install --no-install-recommends -y \
    nodejs \
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
  && rm -rf /var/lib/apt/lists/* \
  && apt-get clean


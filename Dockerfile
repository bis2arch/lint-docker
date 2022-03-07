FROM php:7.4.26-cli

RUN apt update && apt install curl git -y && \
    set -eux && DEBIAN_FRONTEND=noninteractive apt-get update -qq && DEBIAN_FRONTEND=noninteractive apt-get install -qq -y --no-install-recommends --no-install-suggests libzip4 libzip-dev unzip && \
    set -eux && docker-php-ext-configure zip && docker-php-ext-install -j$(getconf _NPROCESSORS_ONLN) zip && true && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
    composer --version && \
    composer global config minimum-stability dev
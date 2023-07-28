FROM debian:bullseye

MAINTAINER fabien5525

# Install curl, node18, git, nginx, wget
RUN apt-get update && apt-get install -y curl && \
    curl -sL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs && \
    apt-get install -y git && \
    apt-get install -y nginx && \
    apt-get install -y wget

# Install php8 & composer
RUN apt-get install -y lsb-release ca-certificates apt-transport-https software-properties-common gnupg2
RUN echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/sury-php.list
RUN wget -qO - https://packages.sury.org/php/apt.gpg | apt-key add -
RUN apt-get update

RUN apt-get install -y php8.0 php8.0-fpm php8.0-mysql php8.0-mbstring php8.0-xml php8.0-curl php8.0-zip php8.0-gd php8.0-intl php8.0-bcmath php8.0-redis php8.0-imagick

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php --install-dir=/bin --filename=composer
RUN php -r "unlink('composer-setup.php');"

# copy nginx config
COPY ./client.conf /etc/nginx/sites-available/client.conf

# enable nginx config
RUN ln -s /etc/nginx/sites-available/client.conf /etc/nginx/sites-enabled/client.conf

# remove default nginx config
RUN rm /etc/nginx/sites-enabled/default

RUN mkdir -p /var/www/

WORKDIR /var/www/

# clone app (https://github.com/fabien5525/IPSSI_E-commerce)
RUN git clone https://github.com/fabien5525/IPSSI_E-commerce.git

# copy .env.local
COPY ./.env.local /var/www/IPSSI_E-commerce/.env.local

# composer install dependencies
WORKDIR /var/www/IPSSI_E-commerce/

EXPOSE 80

COPY ./entrypoint.sh /entrypoint.sh

CMD ["bash", "/entrypoint.sh"]


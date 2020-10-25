FROM docker.pkg.github.com/khromov/docker-php-nginx/docker-php-nginx

USER root

# Install geoip module
RUN apk --no-cache add nginx-mod-http-geoip

COPY db/GeoIPCountry.dat /usr/share/GeoIPCountry.dat

# Override config from base image
RUN rm /etc/nginx/nginx.conf
COPY config/nginx.conf /etc/nginx/nginx.conf

USER nobody
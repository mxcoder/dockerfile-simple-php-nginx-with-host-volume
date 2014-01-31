# Nginx + PHP5-FPM
#
# VERSION               0.0.1

FROM      ubuntu
MAINTAINER Ricardo Vega <ricardoe@gmail.com>

# expose port
EXPOSE 80

# add files
ADD config /opt/config
ADD www /var/www

# run commands for:
# - make sure the package repository is up to date and install packages
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list && apt-get update && apt-get -y upgrade && DEBIAN_FRONTEND=noninteractive apt-get -y install nginx php5-fpm
# - configure nginx links
RUN rm /etc/nginx/sites-enabled/default && ln -s /opt/config/nginx.conf /etc/nginx/sites-enabled/app.conf
# - proper perms for files
RUN chmod 755 /opt/config/run.sh && chown www-data:root /var/www -R

ENTRYPOINT ["/bin/bash", "/opt/config/run.sh"]

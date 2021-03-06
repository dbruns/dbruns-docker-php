FROM ubuntu:trusty
MAINTAINER Daniel Bruns <dbruns@gmail.com>

# Install packages
RUN apt-get update 
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install supervisor git apache2 libapache2-mod-php5 php5-ldap php5-mysql php5-gd php5-curl php-pear php-apc curl
RUN sed -i "s/variables_order.*/variables_order = \"EGPCS\"/g" /etc/php5/apache2/php.ini
RUN sed -i "s/^display_errors = Off/display_errors = On/g" /etc/php5/apache2/php.ini

# Add image configuration and scripts
ADD start.sh /start.sh
ADD run.sh /run.sh
RUN chmod 755 /*.sh
ADD supervisord-apache2.conf /etc/supervisor/conf.d/supervisord-apache2.conf

RUN mkdir -p /app && rm -fr /var/www/html && ln -s /app /var/www/html

EXPOSE 80
CMD ["/run.sh"]

FROM kcbase

WORKDIR /usr/local/apache2/conf

# Configure the httpd server for foswiki
COPY foswiki.cgi.conf extra/.
RUN sed -i '/# Supplemental configuration/a Include conf/extra/foswiki.cgi.conf' /usr/local/apache2/conf/httpd.conf


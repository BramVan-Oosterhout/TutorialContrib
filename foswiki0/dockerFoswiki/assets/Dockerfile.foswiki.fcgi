FROM kcbase

RUN apk update && \
    apk upgrade && \
    apk add apache-mod-fcgid perl-fcgi
    
RUN cp /usr/lib/apache2/mod_fcgid.so /usr/local/apache2/modules/.

WORKDIR /usr/local/apache2/conf

COPY foswiki.fcgi.conf extra/.
RUN sed -i -e '/# Supplemental configuration/a Include conf/extra/foswiki.fcgi.conf' \
           -e '/# Supplemental configuration/a LoadModule fcgid_module modules/mod_fcgid.so' /usr/local/apache2/conf/httpd.conf

#RUN cd /var/www/foswiki &&\
#    tools/extension_installer FastCGIEngineContrib -r -enable install &&\
#    chown -R daemon:daemon *

#WORKDIR /root 
#COPY docker-entrypoint.sh docker-entrypoint.sh
#RUN chmod +x docker-entrypoint.sh

#EXPOSE 80 443
#CMD ./docker-entrypoint.sh
 
#start the foswiki daemon  (nginx only)

#!/bin/bash
{
echo -n "Install/configure environment "
while [ ! -e Foswiki_config_complete ]
do
echo -n "+"
sleep 2
done
sleep 2
} 2>/dev/null
echo " >>"
docker exec -it -w /var/www/foswiki foswiki /bin/bash -c "touch data/.htpasswd"
docker exec -it -w /var/www/foswiki foswiki /bin/bash -c "tools/configure -save -set {Password}='password' >/dev/null"
docker exec -it -w /var/www/foswiki foswiki /bin/bash -c "tools/configure -save -set {Sessions}{UseIPMatching}='0' >/dev/null"
docker exec -it -w /var/www/foswiki foswiki /bin/bash -c "tools/configure -save -set {DefaultUrlHost}='https://$1' >/dev/null"
docker exec -it -w /var/www/foswiki foswiki /bin/bash -c "tools/configure -save -set {ForceDefaultUrlHost}='1' >/dev/null"
docker exec -it -w /var/www/foswiki foswiki /bin/bash -c "tools/configure -save -set {PermittedRedirectHostUrls}='http://$1,http://localhost' >/dev/null"
docker exec -it -w /var/www/foswiki foswiki /bin/bash -c "tools/configure -save -set {JQDataTablesPlugin}{DefaultConnector}='dbcache' >/dev/null"
docker exec -it -w /var/www/foswiki foswiki /bin/bash -c "tools/configure -save -set {Plugins}{AutoViewTemplatePlugin}{Enabled}='0' >/dev/null"
docker exec -it -w /var/www/foswiki foswiki /bin/bash -c "tools/configure -save -set {Plugins}{SolrPlugin}{Enabled}='0' >/dev/null"
docker exec -it -w /var/www/foswiki foswiki /bin/bash -c "tools/configure -save -set {Plugins}{CaptchaPlugin}{Enabled}='0' >/dev/null"
docker exec -it -w /var/www/foswiki foswiki /bin/bash -c "sed -i 's/Set SKIN/#Set SKIN/' data/Main/SitePreferences.txt"
docker exec -it -w /var/www/foswiki/bin foswiki /bin/bash -c "./view /Main/Webhome -refresh=on >/dev/null"
docker cp WorkbenchExample.tgz foswiki:/tmp/.
docker cp answer foswiki:/tmp/.
docker exec -it foswiki /bin/bash -c "apk add tar"
docker exec -it foswiki /bin/bash -c "sed -i '/server_name/a      add_header \"Access-Control-Allow-Origin\"  *;' /etc/nginx/conf.d/default.conf"
docker exec -it foswiki /bin/bash -c "/usr/sbin/nginx -s reload"
echo " done."
docker exec -it -w /var/www/foswiki foswiki /bin/bash

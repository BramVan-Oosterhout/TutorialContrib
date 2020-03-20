#!/bin/bash
apt-get update
apt-get -y install apache2
apt-get update; apt-get -y install libalgorithm-diff-perl libarchive-tar-perl libauthen-sasl-perl libcgi-pm-perl libcgi-session-perl libcrypt-passwdmd5-perl libdigest-sha-perl libemail-address-perl libemail-mime-perl libencode-perl liberror-perl libfile-copy-recursive-perl libhtml-parser-perl libhtml-tree-perl libio-socket-ip-perl libio-socket-ssl-perl libjson-perl liblocale-maketext-perl liblocale-maketext-lexicon-perl liblocale-msgfmt-perl libwww-perl liblwp-protocol-https-perl liburi-perl libversion-perl
a2enmod rewrite
a2enmod cgi
a2enmod access_compat
export PERL_MM_USE_DEFAULT=1; cpan -T install Algorithm::Diff Archive::Tar Authen::SASL CGI CGI::Session Digest::SHA Email::Address Email::MIME Encode Error File::Copy::Recursive HTML::Parser HTML::Tree IO::Socket::IP IO::Socket::SSL Locale::Maketext Locale::Maketext::Lexicon Locale::Msgfmt LWP LWP::Protocol::https URI version
curl -L -o /tmp/Foswiki-2.1.6.tgz https://github.com/foswiki/distro/releases/download/FoswikiRelease02x01x06/Foswiki-2.1.6.tgz
tar -C /var/www -xf /tmp/Foswiki-2.1.6.tgz
ln -s /var/www/Foswiki-2.1.6 /var/www/foswiki
chown -H -R www-data:www-data /var/www/foswiki
mv ~/foswiki.conf /etc/apache2/conf-available/.
a2enconf foswiki
sed -i 's/DocumentRoot.*$/DocumentRoot \/var\/www\/foswiki\/bin\/view\//' /etc/apache2/sites-enabled/000-default.conf
cd /var/www/foswiki
tools/configure -save -noprompt
tools/configure -save -set {DefaultUrlHost}='http://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com'
tools/configure -save -set {Password}='password'
tools/configure -save -set {Sessions}{UseIPMatching}='0'
touch data/.htpasswd
chown www-data:www-data lib/LocalSite.cfg working/logs/configure.log data/.htpasswd
service apache2 restart

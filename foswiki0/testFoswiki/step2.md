Foswiki requires some prerequisites for Ubuntu, Apache and perl.

A complete list is provided in the  [Installation guide (system requirements)](https://foswiki.org/System/InstallationGuide#SystemRequirements)

For Ubuntu there is a collection of libraries required. You can install each with the following commands:
*   `apt-get update`{{execute}}
*   `apt-get install libalgorithm-diff-perl`{{execute}}
*   `apt-get install libarchive-tar-perl`{{execute}}
*   `apt-get install libauthen-sasl-perl`{{execute}}
*   `apt-get install libcgi-pm-perl`{{execute}}
*   `apt-get install libcgi-session-perl`{{execute}}
*   `apt-get install libcrypt-passwdmd5-perl`{{execute}}
*   `apt-get install libdigest-sha-perl`{{execute}}
*   `apt-get install libemail-address-perl`{{execute}}
*   `apt-get install libemail-mime-perl`{{execute}}
*   `apt-get install libencode-perl`{{execute}}
*   `apt-get install liberror-perl`{{execute}}
*   `apt-get install libfile-copy-recursive-perl`{{execute}}
*   `apt-get install libhtml-parser-perl`{{execute}}
*   `apt-get install libhtml-tree-perl`{{execute}}
*   `apt-get install libio-socket-ip-perl`{{execute}}
*   `apt-get install libio-socket-ssl-perl`{{execute}}
*   `apt-get install libjson-perl`{{execute}}
*   `apt-get install liblocale-maketext-perl`{{execute}}
*   `apt-get install liblocale-maketext-lexicon-perl`{{execute}}
*   `apt-get install liblocale-msgfmt-perl`{{execute}}
*   `apt-get install libwww-perl`{{execute}}
*   `apt-get install liblwp-protocol-https-perl`{{execute}}
*   `apt-get install liburi-perl`{{execute}}
*   `apt-get install libversion-perl`{{execute}}
Some are already installed and up to date, some are new and require prerequisites as well.

You can install all of them in one command with:
`apt-get update; apt-get -y install libalgorithm-diff-perl libarchive-tar-perl libauthen-sasl-perl libcgi-pm-perl libcgi-session-perl libcrypt-passwdmd5-perl libdigest-sha-perl libemail-address-perl libemail-mime-perl libencode-perl liberror-perl libfile-copy-recursive-perl libhtml-parser-perl libhtml-tree-perl libio-socket-ip-perl libio-socket-ssl-perl libjson-perl liblocale-maketext-perl liblocale-maketext-lexicon-perl liblocale-msgfmt-perl libwww-perl liblwp-protocol-https-perl liburi-perl libversion-perl`{{execute}}

The required apache prerequisites are installed with:
*   `a2enmod rewrite`{{execute}}
*   `a2enmod cgi`{{execute}}
*   `a2enmod access_compat`{{execute}}

And the cpan prerequisites are installed with:
*   `cpan install Algorithm::Diff`{{execute}}
*   `cpan install Archive::Tar`{{execute}}
*   `cpan install Authen::SASL`{{execute}}
*   `cpan install CGI`{{execute}}
*   `cpan install CGI::Session`{{execute}}
*   `cpan install Digest::SHA`{{execute}}
*   `cpan install Email::Address`{{execute}}
*   `cpan install Email::MIME`{{execute}}
*   `cpan install Encode`{{execute}}
*   `cpan install Error`{{execute}}
*   `cpan install File::Copy::Recursive`{{execute}}
*   `cpan install HTML::Parser`{{execute}}
*   `cpan install HTML::Tree`{{execute}}
*   `cpan install IO::Socket::IP`{{execute}}
*   `cpan install IO::Socket::SSL`{{execute}}
*   `cpan install Locale::Maketext`{{execute}}
*   `cpan install Locale::Maketext::Lexicon`{{execute}}
*   `cpan install Locale::Msgfmt`{{execute}}
*   `cpan install LWP`{{execute}}
*   `cpan install LWP::Protocol::https`{{execute}}
*   `cpan install URI`{{execute}}
*   `cpan install version`{{execute}}

You can install all of them in one command with:
`export PERL_MM_USE_DEFAULT=1; cpan -T install Algorithm::Diff Archive::Tar Authen::SASL CGI CGI::Session Digest::SHA Email::Address Email::MIME Encode Error File::Copy::Recursive HTML::Parser HTML::Tree IO::Socket::IP IO::Socket::SSL Locale::Maketext Locale::Maketext::Lexicon Locale::Msgfmt LWP LWP::Protocol::https URI version`{{execute}}

## E-mail support
Foswiki can send email to various destination when configured, if that is supported by the environment.

The Katacoda environment does not readily support mailing to an external address, so we will not configure E-mail support.


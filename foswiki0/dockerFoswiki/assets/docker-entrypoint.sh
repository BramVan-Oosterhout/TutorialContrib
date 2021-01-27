#!/bin/bash

pkill -f foswiki.fcgi
cd /var/www/foswiki/bin && ./foswiki.fcgi -l 127.0.0.1:9000 -n 5 -d

exec httpd -DFOREGROUND "$@"
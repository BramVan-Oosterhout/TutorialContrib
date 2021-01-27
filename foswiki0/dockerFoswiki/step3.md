 To configure apache we need to:

|Purpose|Action|
|-|
|for `ssl`|enable `httpd-ssl.conf`<br />
 enable `mod_ssl` and `mod_socache_shmcb.so`|
|for logging|access to access.log <br />
 errors to `error.log`|
|for Foswiki|include `foswiki.conf`|

```

WORKDIR /usr/local/apache2/conf

# Configure the httpd server for ssl andlogging
COPY KcBvO.crt server.crt
COPY KcBvO.key server.key
RUN sed -i -e 's/^#\(Include .*httpd-ssl.conf\)/\1/' \
           -e 's/^#\(LoadModule .*mod_ssl.so\)/\1/' \
           -e 's/^#\(LoadModule .*mod_socache_shmcb.so\)/\1/' httpd.conf &amp;&amp; \
    sed -ri -e 's!^(\s*CustomLog)\s+\S+!\1 /var/log/httpd/access.log!g' \
            -e 's!^(\s*ErrorLog)\s+\S+!\1 /var/log/httpd/error.log!g' "httpd.conf" &amp;&amp; \

```


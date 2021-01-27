 The installation of Foswiki retrieves the tar ball from the [foswiki.org](../../..) and unpacks it:
```

WORKDIR /var/www

# Download and extract Foswiki
RUN wget -O Foswiki-2.1.6.tgz https://github.com/foswiki/distro/releases/download/FoswikiRelease02x01x06/Foswiki-2.1.6.tgz &amp;&amp; \
    tar -zxvf Foswiki-2.1.6.tgz &amp;&amp; \
    mv Foswiki-2.1.6 foswiki &amp;&amp; \
    rm Foswiki-2.1.6.tgz

```

 Then we use `tools/configure` to configure Foswiki:
```

WORKDIR /var/www/foswiki

#configure Foswiki
RUN tools/configure -save -noprompt &amp;&amp; \
    tools/configure -save -set {DefaultUrlHost}='http://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com' \
                          -set {Password}='password' \
                          -set {Sessions}{UseIPMatching}='0' &amp;&amp; \
    touch data/.htpasswd &amp;&amp; \
    chown -R daemon:daemon *

```


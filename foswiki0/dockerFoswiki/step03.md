 Open file `Dockerfile.foswiki.base`{{open}} if not already open.

 To configure Apache we need to:

|Purpose|Action|Lines|
|-|
|for `ssl`|supply the security certificate and key|Line 40 - 41|
||enable `httpd-ssl.conf`|Line 42 - 44|
||enable `mod_ssl` and `mod_socache_shmcb.so`||
|for logging|access to `access.log`<br />
 errors to `error.log`|Line 45 - 46|

 For instructions on creating a self-signed security certificate see [Digital Ocean: How To Create a Self-Signed SSL Certificate for Apache](https://www.digitalocean.com/community/tutorials/how-to-create-a-self-signed-ssl-certificate-for-apache-in-debian-10).

 At this point we have the base for the 5 configurations we explore in this scenario. The next steps will create, run and explore the various configurations.


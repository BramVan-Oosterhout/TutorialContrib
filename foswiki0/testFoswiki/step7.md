You can make further performance improvements by implementing [DBCachePlugin](https://foswiki.org/Extensions/DBCachePlugin)
based on [DBCacheContrib](https://foswiki.org/Extensions/DBCachePlugin).

### Install the plugin and dependencies
To complete this process, you need to login as _admin_ with password _password_.
Go to the configure page (from System.Webhome) and select

`Extensions > Instal, Update or Remove extensions`.

Search for DBCachePlugin, select the displayed plugin and click `Install`. Several dependencies are reported:

| Foswiki | Cpan |
|---------|------|
|DBCacheContrib |Sereal |
|               |Time::ParseDate |
|               |BerkeleyDB |
|TopicTitlePlugin |         |

The Foswiki dependencies are automatically installed. Close the report and save (top right) the changes.

The cpan dependencies need to be installed. From experience BerkeleyDB requires libdb-dev to be installed.
You get that from ubuntu: `apt-get install libdb-dev`{{execute}}

Then you install the cpan dependencies:
`cpan install Sereal Time::ParseDate BerkeleyDB`{{execute}}

And this completes the installation.

### Results
DBCachePlugin creates a cache per web in the Foswiki working directory.
`ls -lR /var/www/foswiki/working/work_areas/DBCacheContrib`{{execute}}
To populate the cache, you can add `?refresh=aa` to any topic and it will re populate the full cache. Try:
[System.WebHome?refresh=all](https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/foswiki/System.WebHome?refresh=all)
and you will see the cache being built: `ls -l /var/www/foswiki/working/work_areas/DBCacheContrib`{{execute}}

This cache will affect the performance of the macros listed in the documentation of the DBCachePlugin. To see the effect, create two Sandbox topics.

| Topic | Content |
|-------|---------|
|TestSEARCH | `%SEARCH{ ".*" type="regex" web="System" }%`{{copy}} |
|TestDBQUERY | `%DBQUERY{ "text=~'.*'" web="System" separator="<br />"}%`{{copy}} |

And time the results for the retrieval of each topic. I get:
*   TestSEARCH: 4276, 4193, 4764, 5290, 4832 ms
*   TestDBQUERY: 2076, 2047, 2114, 2076, 2035 ms:

DBCache substantially reduces the retrieval times of topics.
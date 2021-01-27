 Performance is a concern for web sites that want to be seen. Slow responses tend to scare off impatient people. Apache and Foswiki support various configurations to improve the performance of the Foswiki site. Foswiki supports these options out of the box and with several plugins. In the following steps we will install some of them and measure the result.

 In this step we introduce the measurement and set the base line.

 There are tools on the web that will measure the performance of any web site. You can search: "\_measuring web site response performance\_" for a list. In this Scenario we will use the [Pingdom](https://tools.pingdom.com/#!/) tool.

 However, for a first impression, you can use a simple command line script: <br />

**For localhost:**

  * `/usr/bin/time --quiet -f "%e" wget -pq --header="accept-encoding: gzip" --no-check-certificate --delete-after https://localhost/foswiki`{{execute}}

**For the Katacoda environment:**

  * `/usr/bin/time --quiet -f "%e" wget -pq --header="accept-encoding: gzip" --no-check-certificate --delete-after https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/foswiki`{{execute}}

 Try each several times and notice the variations. These measurements form a baseline against which to compare the performance of the other configurations.

 For this Foswiki CGI configuration I get the following results in seconds.

|First|Second|Third|Avg|Url|
|-|
|0.56|0.58|0.62|0.59|`localhost`|
|2.30|2.25|2.26|2.27|`katacoda host`|
|1.20|1.01|1.01|1.07|[Pingdom](https://tools.pingdom.com/#!/)|


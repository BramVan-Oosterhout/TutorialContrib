 The material transmitted to render a Foswiki page contains HTML and numerous supporting components (CSS, [JavaScript](http://cdlhttps://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/KatacodaCourses/Foswiki0/KcDockerAF/JavaScript?topicparent=KatacodaCourses/Foswiki0/KcDockerAF.ScenarioStep06 "Create this topic")). The [PageOptimizerPlugin](https://foswiki.org/Extensions/PageOptimizerPlugin) post processes the page html and compresses the CSS and [JavaScript](http://cdlhttps://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/KatacodaCourses/Foswiki0/KcDockerAF/JavaScript?topicparent=KatacodaCourses/Foswiki0/KcDockerAF.ScenarioStep06 "Create this topic") components in a single file each. The result is cached, so that the overhead of the compression is incurred once.

 To use this plugin, it needs to be installed and configured. That can be accomplished in the browser through the configure script. But for the sake of this tutorial we will build a Docker image with the `PageOptimizerPlugin` enabled.

 We start from the `foswiki-cgi` image. If you have not built this image in the previous step, you can follow the instructions in the answer section of this step.

```

FROM foswiki-cgi

# Install the PageOptimizerPlugin
RUN cd /var/www/foswiki &amp;&amp;\
    tools/extension_installer PageOptimizerPlugin -r -enable install&amp;&amp;\
    chown -R daemon:daemon pub/System/PageOptimizerPlugin

```

 Build the image with `docker build -t foswiki-pageopt -f Dockerfile.foswiki.pageopt .`{{execute}}.

 And start the container with: `docker run -d --name foswiki -p 443:443 foswiki-pageopt`{{execute}}.

 Open Foswiki https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/foswiki and measure the performance of the Main.WebHome page. In my excercise I get:

|#|html (ms)|Total (ms)|
|-|
|1|||
|2|||
|3|||
|4|||
|5|||
|Avg|||

 Dot com tools measures: first 3.8 seconds. Second visit 1.9 seconds


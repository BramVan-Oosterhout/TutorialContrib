 The material transmitted to render a Foswiki page contains `html` and numerous supporting components (`css`, `JavaScript (js)`). The [PageOptimizerPlugin](https://foswiki.org/Extensions/PageOptimizerPlugin) performs some processing of the generated `html` and combines the `css` and `js` elements in a single file each. The result is cached, so that the overhead of the combining is incurred once.

 To use this plugin, it needs to be installed and configured. That can be accomplished in the browser through the `configure` script. But for the sake of this tutorial we will build a Docker image with the `PageOptimizerPlugin` enabled.

 Open the `Dockerfile.foswiki.pageopt`{{open}}. We start from the `kcbase` image. (`Line 1`). and install the CGI Foswiki configuration file. (`Line 5 - 7`).

 Install the `PageOptimizerPlugin` extension and update the file permissions. (`Line 9 - 12`)

 Build the image with `docker build -t foswiki-pageopt -f Dockerfile.foswiki.pageopt . `{{execute}}

 Stop the running image: `docker stop foswiki`{{execute}}

 And start the container with: `docker run -d --rm --name foswiki -p 443:443 foswiki-pageopt`{{execute}}.

 Open Foswiki https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/foswiki and measure the performance of the `Main.WebHome` page. Baseline figures are in the `CGI` column. The measurement script are repeated in the Solutions.

|First|Second|Third|CGI|Url|
|-|
|0.66|0.64|0.83|0.59|`localhost`|
|2.23|2.04|1.99|2.27|`katacoda host`|
|0.97|1.49|1.05|1.07|[Pingdom](../../..)|

 The results are marginally different. Why would that be?


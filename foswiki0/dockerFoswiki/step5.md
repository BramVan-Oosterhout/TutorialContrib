 Performance is a concern for web sites that want to be seen. Slow responses tend to scare impatient people off. Foswiki has several plugins that will improve the performance of the installed and configured web site. In the following steps we will install some of them and measure the result.

 In this step we introduce the measurement and set the base line.

 There are tools on the web that will masure the performance of any web site. You can search: "measuring web site response performance" for a list. [dotcom tools](../../..) is fine.

 Or you can use your browser and read the data from the console. If you do that, you should do more than one reading and be aware of how much data ( javascript, stylesheets, etc) are cached locally.

 Here are my result for the default page `Main.WebHome`, read with the URL %KATACODAURL%/foswiki.

|#|html (ms)|total (ms)|
|-|
|1|1411|3400|
|2|1778|3300|
|3|1446|3100|
|4|1528|3220|
|5|1455|3360|
|Avg|1523|3276|

 Dotcom tools gives the first access as 13.7 seconds and average second visit as 1.2 seconds.

 It also suggests many improvements! Let's see what Foswiki provides.


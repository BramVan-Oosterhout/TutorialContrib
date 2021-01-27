 When you inspect the performance report for the Main.WebHome page, you will see that the the object size has a substantial bearing on the time to deliver the object to your browser. Apache can help by compressing the output file before transmission, thereby trading transmission time for processing time.

 The module to use is `mod_deflate`. To activate uncomment the line
```
#LoadModule deflate_module modules/mod_deflate.so
```

 For this exercise we use a `Dockerfile` to modify the image: `Dockerfile.foswiki.deflate`\{\{open\}\}

 Build the image with: `docker build -t foswiki-deflate -f Dockerfile.foswiki.deflate .`{{execute}}

 And start the container: `docker run -d --name foswiki -p 443:443 foswiki-deflate`{{execute}}


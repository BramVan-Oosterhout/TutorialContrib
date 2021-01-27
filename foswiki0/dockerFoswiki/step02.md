 Open file `Dockerfile.foswiki.base`{{open}} if not already open.

 To install Foswiki we retrieve the Foswiki tar ball from [foswiki.org](../../..) and unpack it (line 19 - 25):

 After installation the tar ball is removed (line 25).

 Then we use `tools/configure` to configure Foswiki from the command line (line 29 - 33). We need to create the `.htpasswd` file and ensure that the file protections are set correctly.


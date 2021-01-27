# Extensions

Welcome to your Katacoda Foswiki environment!

The Foswiki architecture consists of core functionality and is augmented by extensions. Extensions come in three major flavours:
*   Skins - this are extensions that are implemented using the skin template files and topics discussed in the previous chapter
*   Plugins - interact with the with the core functionality, using the Foswiki API, and are invoked through Foswiki macros
*   Contributions - Contribs for short. This are collections of topics and perl scripts that are broader in scope than the plugin

This chapter presents an introduction to plugins.

<div style="background-color: khaki; font-size: smaller" >
The Katacoda training environment is somewhat out of the ordinary. This setup installs Foswiki, listening at port 80 for the http protocol.
Access is through the katacoda-services host, which is accessible with the https protocol.
This leads to a mixed access scenario, which is by default not allowed in modern browsers.
For Firefox  you need to turn off all mixed content checking in
[about:config](https://docs.sdl.com/LiveContent/content/en-US/SDL%20Web-v5/GUID-A96F0612-53DE-4E35-AE09-48D57146D6E4)
<p />
**Please note** that you are `root` on the server in the training scenarios.
If you are not a user with root privileges on your own system, some commands will need to be `sudo'ed`.
</div>

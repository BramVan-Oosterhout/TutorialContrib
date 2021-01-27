## Preferences
Preferences are variables with a broader scope. Preferences are variables defined in a limited set of pre-specified topics:

| *Topic* | *Scope* |
|---------|---------|
|System.DefaultPreferences |All topics in all webs can see the definitions provided in this topic. <br />This topic defines variables like: ATTACHFILESIZELIMIT, WIKILOGOALT, WEBCOPYRIGHT and many others.  This topic is recreated each time Foswiki is installed or upgraded. It defines all preferences necessary to make the installation fully functional out-of-the-box. User edits in this topic will be lost at the next upgrade. |
|Main.SitePreferences |All topics in all webs can see the definitions provided in this topic. <br />On installation this topic defines a few variables relating to appearance, like: WIKITOOLNAME. And it _finalises_ some variables defined in System.DefaultPreferences, like : ATTACHFILESIZELIMIT. Finalisation makes the variable immutable in other topics. |
|Main._wikiuserame_ |All topics the registered user has access to will have access to variables defined in the topic named the _wikiusername_. For me the topic name is JoeBlog. <br />The topic is created on registration without defining any variables. |
|Web.WebPreferences |All topics in the web and its sub-webs can see the definitions in this topic. <br />There are a few variables defined in this topic when a web is created, like: WEBBGCOLOR and other parameters provided when the web is created. |
|Subweb.WebPreferences |All topics in the sub-web and its sub-webs can see the definitions in this topic, but the parent web can not see them. <br />The same variables as for the web are defined when the sub-web is created. |
| Web.AnyTopic |Variables defined in this topic are local to the topic. |

You may inspect these pages in the browser.

Foswiki preferences are by convention all uppercase. Variables can be defined with mixed case to avoid collisions.

Conceptually the value of a variable used in the evaluation of a topic is taken from the nearest definition available. So:<br />
 _Topic > Subweb.WebPreferences > Web.WebPreferences > Main.WikiUsername > Main.SitePreferences > System.DefaultPreferences_.

Technically the situation is more complex and the implementation is top down. That way finalisation can be implemented.
You can find more detail in the references at the end of this chapter.
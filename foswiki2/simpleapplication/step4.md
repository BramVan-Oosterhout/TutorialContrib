In the previous step we created the TopicType _ExampleType_ and saw examples of its functionality.
In this step we'll have a look at the implementation of this functionality.

When you look at the wiki text of topic
[ExampleType](https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/Applications/ExampleApp/ExampleType?raw=on)
you notice that the buttons are implemented using a DBCALL. DBCALL is equivalent to the standard Foswiki INCLUDE.
DBCALL uses the DBCachePlugin. You can read more about
[DBCachePlugin](https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/System/DBCachePlugin) in the documentation.

### The _Install_ button
The _Install_ button is implemented by `%DBCALL{"Applications.RenderTopicInstaller" ... }%`.
The call includes RenderTopicInstaller in the Applications web. When you open
[Applications.RenderTopicInstaller](https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/Applications/RenderTopicInstaller)
you see a page starting with a "Documentation" section. The "Documentation" section contains a Parameter list.
Following is an "Implementation" section which contains a mixture of TML, HTML and Foswiki macros.
This section renders the _Install_ button with the part wrapped by %STARTINCLUDE% and %STOPINCLUDE%.
The structure of this page is typical of the topic structure used to implement Foswiki applications.
We will look in detail at the RenderTopicInstaller implementation in the next Scenario.

### The _New_ button
The _New_ button is implemented by `%DBCALL{"Applications.RenderSimpleTopicCreator" ... }%`. You will see the familiar structure in
[Applications.RenderSimpleTopicCreator](https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/Applications/RenderSimpleTopicCreator).
Lets take a look at the Parameters. The first four parameters are set as part of the DBCALL:

| Parameter | Set to | Presents |
|-----------|--------|----------|
| TEXT | Create a new %TOPIC% | Create a new ExampleType |
| LABEL | Title | Title: |
| BUTTONTEXT | New | New |
| VALUE |  | blank |

The remainder will rely on the default:

| Parameter | Set to | Presents |
|:---------:|:------:|:--------:|
|VALUES | not set  | not used |
| FORM | not set |uses the form in ExampleType |
| TEMPLATE | not set | not used |
| TYPE | not set | , WikiTopic |
| PARENT | not set | ExampleType |
| WHITEBOARD | not set | topic text area for edit (on) |
| EXTRA | not set | not used |
| SCRIPT | not set | edit |
| EDITOR | not set | not used |

From this list we can conclude that the RenderSimpleTopicCreator will produce a better result if we call it with a few extra parameters.
Add the following parameters to `%DBCALL{"Applications.RenderSimpleTopicCreator" ... }%` in the Applications/ExampleApp/ExampleType topic.
*   `  FORM="Applications/ExampleApp.ExampleForm"`{{copy}} to use the form that you created in step 2.
*   `  TYPE="ExampleType, WikiTopic"`{{copy}}

With these changes the topic creator creates a topic with the desired form and form content.
Use the ExampleType topic in the Sandbox from step 3 to create a new topic ExampleNote2 and inspect the content of ExampleNote2.txt.
That topic is only a stub, referencing the now updated Applications/ExampleApp/ExampleType topic.
`cat data/Sandbox/ExampleNote2.txt`{{execute}}


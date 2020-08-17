The implementation of the RenderTopicInstaller has similarities to the RenderSimpleTopicCreator. The RenderTopicInstaller provides a mechnism to create a TopicStub in a web of your choosing. The TopicStub will refer back to the SOURCE, an application topic. To follow the explanation, open the [Applications.RenderTopicInstaller](https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/Applications.RenderTopicInstaller) in a separate Tab or window, so can can easily refer to the implementation.

Like the RenderSimpleTopicCreator, the implementation of RenderTopicInstaller  is wrapped in a TWISTY. Inside the TWISTY is form, this time invoking the `save` script:
```
<form id="topicinstaller" action="%SCRIPTURLPATH{"save"}%/" method="post">
```
The script is documented in the [System.CommandAndCGIScripts](https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/System.CommandAndCGIScripts#A_61save_61) topic.

After defining the header for the data entry, RenderTopicInstaller defines a collection of hidden parameters for the `save` script:
* onlynewtopic (on) - do not overwrite an existing topic
* TopicTitle - taken from the TopicTitle metadata of the SOURCE topic
* Summary - taken from the Summary metadata of the SOURCE topic
* topicparent - taken from the PARENT parameter
* templatetopic - taken from the TEMPLATE parameter
* formtemplate - taken from the FORM parameter. Default: `Applications.TopicStub`
* TopicType - "TopicStub, TYPE" (if the TYPE parameter is provided)
* Target - taken from the SOURCE parameter
* WikiApplication - taken from the WIKIAPP parameter
* topic - taken from the NAME paramter

Following the hidden parameters, FLEXWEBLIST is used to create options for a selector. FLEXWEBLIST loops through all webs and formats the output as
```
<option value='$web'>$web</option>
``` 

After the form are some macros to make the javascript, necessary for the topic, available:
* JREQUIRE("select2"} - adds a type-ahead selector to the selector. See [System.JQueryPlugin](https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/System.JQSelect2Contrib)
* ADDTOZONE - adds text, in this case a script defined in the `init` section of RenderTopicInstaller, to the header section of the rendered topic. See [System.VarADDTOZONE](https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/System.VarADDTOZONE) 

The javascript defined in the `init` section binds an anonymous callback function to the form through the `#topicinstaller` tag. On `submit` the function prefixes the selected `web` to  `topic` parameter to define the topic to be saved.

For some more examples see [Ex00_1](https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/Sandbox.Ex00_1) in the Sandbox

**How the stub works** <br />
The `TopicStub` implementation works through the support of the [System.AutoViewTemplatePlugin](https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/System.AutoViewTemplatePlugin). In the default mode (`exist`) the plugin will, on opening the topic, check the attached form. In case of the default for the RenderTopicInstaller, that will be the [Applications.TopicStub](https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/Applications.TopicStub). From this name AutoViewTemplatePlugin will derive a `view` template: [Applications.TopicStubViewTemplate](https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/Applications.TopicStubViewTemplate) to use for the rendering of the TopicStub.

Open the [Applications.TopicStubViewTemplate](https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/Applications.TopicStubViewTemplate) in new tab for inspection. The template contains a definition for the `beforetext` marker. The marker defines:
```
%DBCALL{"%FORMFIELD{"Target" topic="%BASEWEB%.%BASETOPIC%"}%" section="%FORMFIELD{"Section"}%"}%
```
This DBCALL will include the topic text of the topic listed in the `Target` formfield of the stub topic. It will honor the `Section` field if it is not empty. So the stub, although itself empty, will render the full text content of the targeted topic.

[Ex00_2](https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/Sandbox.Ex00_2) in the Sandbox explores some examples of this mechanism. 













### Answer
<!-- Solution text (if any) goes here -->
To refresh the examples use:
* `/tmp/answer step5`{{execute}}





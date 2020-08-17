<!-- Scenario text goes here -->
Foswiki supports an automatic incrementing number to create unique topic names on `edit` and `save`. This is documented in the [System.CommandAndCGIScripts](https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/System.CommandAndCGIScripts) documentation.

The wiki workbench topic creator supports this mechanism through the `TopicNameTemplate` field on the data form. To use it, we need to define two fields on the form associated with the data form {`NoteForm`). 

If we don't care about editing these fields, we can simply enter them with their values in the topic text. Copy the following into the left margin of the `NoteForm` topic. You **must** remove the leading `---` before saving the topic.
```
---%META:FIELD{name="TopicNamingMode" title="!TopicNamingMode" value="template"}%
---%META:FIELD{name="TopicNameTemplate" title="!TopicNameTemplate" value="NoteAUTOINC00000"}%
```{{copy}}

If all goes well, you can see the fields added to the meta data of the NoteForm: `less data/Applications/NotePadApp/NoteForm.txt`{{execute}}. The fields are not listed in the `DataForm` box, because they are not defined  in the form definition table for the `DataForm` in [Applications.DataForm](https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/Applications.DataForm)

To see the result, create a topic `NotePadHome` in the Sandbox and include the `NotePadApp.NoteWebHome`
```%DBCALL{ "Applications/NotePadApp.NoteWebHome" TYPE="NoteType" }%```{{copy}}

Now you can use [Sandbox.NotePadHome](https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/Sandbox.NotePadHome) to create notes in the Sandbox with the topic name of `NoteNNNNN`, where `NNNNN` is a number starting at `00000`.

Whilst we are here, we can improve the Home page a little by defining the `TEXT` parameter in the `NoteType` application topic. Change it to: `TEXT="%TRANSLATE{"Create a new Note" }%"`{{copy}}



### Answer
To compare you answers execute:
`/tmp/answer step1`{{execute}}
and refresh your Foswiki page. New webs will appear in the left margin.

Use the SolNotePad web in the Sandbox to experiment.

Check your answers in the Applications/SolNotePadApp web.

<!-- Solution text (if any) goes here -->


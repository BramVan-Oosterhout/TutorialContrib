<!-- Scenario text goes here -->

You now have a working application, with a home page in the Sandbox web. There are sevaral approaches to creating Note pads for multiple purposes and multiple people:

1. Using tags - through the [System.TagMePlugin](https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/System.TagMePlugin)
2. Using categories - through the [System.ClassificationPlugin](https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/System.ClassificationPlugin)
3. Using webs - by creating a web for each personalised Note pad

Each approach has its own merit. In this course we will use the latter. Creating webs does not introduce new concepts and is relatively straight forward. The approach is well supported by the [System.CopyContrib](https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/System.CopyContrib) with `mode="application"`.

### The Deploy button
To begin you create a new `TopicFunction`: `RenderDeployButton` in the NotePad application. we start with the basic functionality from the documentation:
```
<form action='%SCRIPTURLPATH{"copy"}%/%WEB%/%TOPIC%' method='post'>
  <input type='hidden' name='mode' value='application' />
  <input type='text' name='destination' size='80' value='Sandbox/Testapp1' />
  <input type='submit' />
</form>
```{{copy}}
Save the topic. Under the _Test_ header you find a text field with the target webname: `Sandbox.Testapp1` and a button: _Submit query_. Click the button and the `Sandbox.Testapp1` web is created. Check the _Index_ to verify the topics created. They are the default Foswiki topics, plus a copy of the `RenderDeployButton`. Try to repeat the button click and you will be told you cannot overwrite existing topics.

### The home page
Next you need to deploy a home page in the new web. The seed for the home page is part of the application. There are several options for the type of the seed topic. Make it a `TopicTemplate` for a `WikiTopic`.  Use the `TopicTemplate` application topic to create a `WikiTopic` in the application with title: `SeedWebHome` and content:
```
%DBCALL{ "Applications/NotePadApp.NoteType" 
             TYPE="NoteType" 
             TEXT="Create a new Note" 
}%
```{{copy}}
Save the topic.

To add the `SeedWebHome` topic as part of the creation of the new web, you add some parameters to the `copy` operation:

* `source - SeedWebHome => WebHome` will copy the seed as the real `WebHome` topic. Note &amp;gt; instead of >.
    * `<input type='hidden' name='source' value='SeedWebHome =&gt; WebHome' />`{{copy}}
* `onlynew - off` to allow repeated deployments to the same web
    * `<input type='hidden' name='onlynew' value='off' />`{{copy}}
* and you can adjust the button text by repacing the `submit` with:
    * `%BUTTON{"%TRANSLATE{"Deploy"}%" type="submit" icon="fa-check"}%`{{copy}}

Save the topic and deploy `Sandbox/Testapp1` again. You will find that the WebHome page is now a proper home page for the application. You can update `SeedWebHome` and redeploy to see the updates applied. 

### The VIEW template for the home page
To make the home page specific for the Note pad application, you need toapply a view template. It will be very similar to the Note VIEW template. Copy `TestSkinNoteViewTemplate` to `NoteWebHomeViewTemplate` and make the following changes:

* Remove the `aftertext` definition, returning it to the default empty one
    * This removes the `COMMENT` box from the VIEW template

To apply the template to the `WebHome` page you can use the `rules` mode of the [System.AutoTemplatePlugin](https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/System.AutoTemplatePlugin). Define the `rule` in `WebPreferences` with:
```
* Set VIEW_TEMPLATE_RULES =  WebHome => Applications.NotePadApp.NoteWebHomeView 
```{{copy}}
and save `WebPreferences`. Navigate to `WebHome` and you will see the template applied. To make this setting  part of the application, you create a `SeedWebPreferences` topic with the desired content in the application and add it to the list of topics to be deployed in `RenderDeployButton`.
* Change: `value='SeedWebHome =&gt; WebHome, SeedWebPreferences =&gt; WebPreferences'`
* To: `value='SeedWebHome =&gt; WebHome, SeedWebPreferences =&gt; WebPreferences'`{{copy}}

### Automatic application of the VIEW and EDIT template for a note
So far we have applied the `?cover=test` url parameter to display the note in the defined skin. In the deployed application you want this cover to be applied automatically. This is easy to achieve with the AutoTemplatePlugin. Copy the `TopicView`s 

* from `TestSkinNoteViewTemplate` to `NoteViewTemplate`; and
* from `TestSkinNoteEditTemplate` to `NoteEditTemplate`.

These templates are now automatically applied to any topic with a `NoteForm` attached.

The next step provides an opportuinity to fine tune the application. This is presented in the form of execises.



### Answer
<!-- Solution text (if any) goes here -->

To compare you answers execute: `/tmp/answer step6`{{execute}}

The complete template is in [Applications/SolNotePadApp/NoteViewTemplate](https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/Applications/SolNotePadApp/NoteViewTemplate) and [Applications/SolNotePadApp/NoteEditTemplate](https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/Applications/SolNotePadApp/NoteEditTemplate).

Check the answer in the Sandbox by creating a new note.




<!-- Scenario text goes here -->
We are using the regular Foswiki skin (the `pattern` skin). The `pattern` skin displays many options that are marginal and distracting to the functioning of the Note application. In the following steps you will define a skin for the `NoteType` that leaves many of these distractions behind. The principles of this modification were presented in the previous scenario with the `TopicStub`.

Remember that we are now changing the **presentation** of the topic when it is VIEWed. We are dealing with `TopicView` templates, not `TopicTemplates`. `TopicTemplates` contain default topic **content** at the time the topic is created. 

Before you proceed, reread:
*  the [System.SkinTemplates](https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/System.SkinTemplates) topic and pay special attention to the description of the template path. 
* the [System.AutoTemplatePlugin](https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/System.AutoTemplatePlugin) topic and note how the skin template topic name is formed with mode `exist`. Form at the end is removed and Skin and View are added. The skin template topic name for a Note with form NoteForm and skin &lt;cover> is &lt;cover>SkinNoteViewTemplate.

While you are developing the skin, it is convenient to use the COVER preference via the `?cover=` url parameter. When something goes wrong, you can get back to the default by not using the the url parameter. Use the cover name `test` and create a new `TopicView`:  `TestSkinNoteViewTemplate`

Start with 
* the removal of the form display box at the bottom of the page (INCLUDE: WikiTopicView)
* the display of the title at the head of the topic (DEF: beforetext )
* the display of the summary underneath that (DEF: beforetext )
* the removal of the version information (DEF: beforetext )

Here is the component to achieve that:
```
%TMPL:INCLUDE{"Applications.WikiTopicView"}%
%TMPL:DEF{"beforetext"}%
---+ %FORMFIELD{ "TopicTitle" }% <span style="font-size: small">(test skin note view template)</span>

%FORMFIELD{ "Summary" }%
%TMPL:END%
```{{copy}}

Go to  [Sandbox.NotePadHome](https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/Sandbox.NotePadHome) topic, create a new note and save it. Now add `?cover=test` to the url and see the same topic rendered with the `TestSkinNoteViewTemplate`.

We want to be able to add comments to the note. But we don't need to edit the COMMENT macro as part of the topic text. We can add it by adding the COMMENT at the bottom of the text:
```
%TMPL:DEF{"aftertext"}%
%COMMENT{ type="above" }%
%TMPL:END%
```{{copy}}
Check it out in the Sandbox. Refresh the Note you displayed previously or create a new one. 
Now that the COMMENT macro is embedded in the template, you can remove it from the [NoteTemplate](https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/Applications/NotePadApp.NoteTemplate) in the application. This change will not affect existing notes. You need to delete the COMMENT from the topic text. New Notes will be fine.

Edit, Attach, Subscribe and Print are useful. But we can remove History, Backlinks, wiki text and topic actions. At the top we don't need any distractions. 

Start with the links at the bottom.. To find what to modify, use grep:
`grep -l "topic actions" templates/*`{{execute}}.
`templates/viewtopicactionbuttons.tmpl` looks like a good candidate:
`less -N templates/viewtopicactionbuttons.tmpl`{{execute}}.
Bingo ! Modifying `topicactionbuttons (line 1)` will do the trick. Note that the `action_printable (line 21)` definition includes a final separator. So it is replaced with `printable (line 23)`
```
%TMPL:DEF{"topicactionbuttons"}%%TMPL:P{"action_activatable_edit_or_create"}%%TMPL:P{"action_activatable_attach"}%%TMPL:P{"action_activatable_subscribe"}%%TMPL:P{"printable"}%%TMPL:END%
```{{copy}}

The breadcrumbs at the top are meaningless for web user not familiar with Foswiki. And we can also remove the Edit, Attach and Subscribe buttons at the top. For the breadcrumbs `grep -l "You are here" templates/*`{{execute}} suggests the `templates/view.pattern.tmpl` and `less -N templates/view.pattern.tmpl`{{execute}} indicates we can redefine the `breadcrumb (line 30)` definition. But looking a bit further, you will notice that the breadcrumb and the `toolbarbuttons` are both wrapped in a single definition `top (line 24)`. So we can kill two birds with one stone:

```
%TMPL:DEF{"top"}%%TMPL:END%
```{{copy}}

Try it by refreshing the note in the Sandbox. In the next step you will adjust the top and side bar.

### Answer

To compare you answers execute: `/tmp/answer step2`{{execute}}

See the answer in Sandbox/SolNotePadApp. Create a note and  apply `?cover=test`.

Check your answer in the Sandbox by creating a new note from the NotePadHome topic. The created note will have the default skin applied. Apply `?cover=test` to see the new skin.

For the changes see: [Applications/SolNotePadApp.TestSkinNoteViewTemplate](https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/Applications/SolNotePadApp.TestSkinNoteViewTemplate)






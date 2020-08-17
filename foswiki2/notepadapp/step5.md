<!-- Scenario text goes here -->
We can adjust the presentation of the `edit` screen in the same way we adjusted the `view`. In this case we need to create a `TopicView` `TestSkinNoteEditTemplate`. The default `WikiTopicEdit` provides a good starting point. 

Create the `TopicView` `TestSkinNoteEditTemplate` and save it with the default content:
```
%TMPL:INCLUDE{"Applications.WikiTopicEdit"}%
```{{copy}} 

Display the edit screen for the note in the [Sandbox.Note00000](https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/Sandbox.Note00000). Once the screen is displayed, add `&cover=test`{{copy}} to the url. You will notice that in addition to the title, the summary field is available for edit above the text box.

When you inspect the skin edit template  [Applications.WikiTopicEditTemplate](https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/Applications.WikiTopicEditTemplate) you will see that the first tab is defined in `firsttab::impl` rendering `topicmeta` and `textarea`. We will leave `textarea` alone. And we will change the rendering of `topicmeta` to include the three fields relevant to the note:
* Title - Already a data entry field. Use this unchanged
* Summary - Already a data entry field. Make it 2 lines high
* Status - A new data entry field. Make it radio buttons, spaced horizontal

### Summary 
To change the `Summary` field, you can change the following attributes (See: [System.DataForm](https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/System.DataForm):

| Column | From | To |
|---------|------|----|
| Type    | text | textarea |
| Size    | 75   | 75x2 |

Once the change is saved, edit your note previously created in the Sandbox with `&cover=test`{{copy}} added to the url.

### Status
On inspection of the [Applications.WikiTopicEditTemplate](https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/Applications.WikiTopicEditTemplate) you will have noticed that the rendering of the topic meta data is performed by `RENDERFOREDIT` as defined in the `topicmeta` template definition. The fields to be rendered are listed in the `editfields` template definition. Add the Status to that defininition `%TMPL:DEF{"editfields"}%TopicTitle, Status, Summary%TMPL:END%`{{copy}} in the =TestSkinNoteEditTemplate. Save the topic. 

Now refresh the edit view of your note in the Sandbox. The `Status` field is displayed between the `Title` and the `Summary` as a dropdown. You can change it by modifying the definition of the Status field on the `NoteForm`. Change the _Type_ from `select+values` to `radio+values`{{copy}} and add `Open` to the _Default_ collumn. Save the `NoteForm` and refresh the note in the Sandbox. The `Status` is displayed as an _Open_ and a _Close_ radio button.

### Status - styling
The `Status` radio buttons are displayed vertically. Screen real estate would be better used if the buttons were displayed next to each other. There is no option on render for edit to change the display. Inspecting the generated html, you will notice that the radio buttons are layed out in a table:
```
  <div class='natEditTopicInfo'>
    <table class='foswikiLayoutTable jqTooltip'>
... Title
      <tr title='indicator'>
        <th valign='top'>Status:</th>
        <td valign='top'>
          <table>
            <tr>
              <td><label><input type="radio" name="Status" value=
              "Open" checked="checked" class="foswikiRadioButton"
              title="Open">Open</label></td>
            </tr>
            <tr>
              <td><label><input type="radio" name="Status" value=
              "Closed" class="foswikiRadioButton" title=
              "Closed">Closed</label></td>
            </tr>
          </table>
        </td>
      </tr>
... Summary
    </table>
  </div>
```

You can display the the `Status` table flattened by adding the following to the `UserNoteTypeStyle.css` attached to `NoteType`. Edit the [Applications/NotePad.NoteType](https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/Applications/NotePad.NoteType) to include this to the style sheet:
```
div.natEditTopicInfo table table tr {
  display: inline;     /* flatten the table */
  margin-right: 20px;  /* space out the buttons */
}
```{{copy}}

The edit template does not include the link to `UserNoteTypeStyle.css`. You need to add the `styles:screen` to the edit template just like you did for the view template:
```
%TMPL:DEF{"styles:screen"}%%IF{ "$ FOSWIKI_LAYOUT_URL" then="<link rel='stylesheet' href='%FOSWIKI_LAYOUT_URL%' media='all' type='text/css' />"}%
%IF{ "$ FOSWIKI_STYLE_URL"  then="<link rel='stylesheet' href='%FOSWIKI_STYLE_URL%' media='all' type='text/css' />"}%
%IF{ "$ FOSWIKI_COLORS_URL" then="<link rel='stylesheet' href='%FOSWIKI_COLORS_URL%' media='all' type='text/css' />"}%
%TMPL:P{"styles:custom_skin"}%%IF{ "$ USERLAYOUTURL or $ USERSTYLEURL or $ USERCOLORSURL" then="$percntTMPL:P{$quotstyles:user_defined$quot}$percnt"}%
<link rel='stylesheet' href='%PUBURLPATH%/Applications/NotePadApp/NoteType/UserNoteTypeStyle.css' media='all' type='text/css' />
%TMPL:P{"styles:dynamic"}%%TMPL:END%
```{{copy}}

After this addition, your note in the `Sandbox` will show the radio buttons spaced horizontally. (You may need to refresh your browser screen)




### Answer
<!-- Solution text (if any) goes here -->
To compare you answers execute: `/tmp/answer step5`{{execute}} 

The complete template is in [Applications/SolNotePadApp/TestSkinNoteEditTemplate](https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/Applications/SolNotePadApp/TestSkinNoteEditTemplate).

Check the answer in the Sandbox by creating a new note.





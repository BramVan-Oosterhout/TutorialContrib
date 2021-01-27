## Bottom navigation bar
The bottom navigation bar contains hyperlinks to functions that maintain and present topics. Below is a short description of each link.

### Edit 
The _Edit_ link navigates to the edit page for the topic being viewed.
The edit page is the same page as the page associated with the _Create new topic_ link in the Toolbox.
You can edit the topic and save the revision using the _Save_ button. Revisions more than an hour apart are saved as separate files.
*   _Save and Continue_ saves the topic and remains on the edit page.
*   _Preview_ renders the topic in the form it will be presented. You can close the preview and return to the edit page.
*   _Change form_ supports a change in the structured data associated with the topic. More about that later.
*   _Cancel_ does not save anything and returns to the display of the rendered topic.

### Attach
The _Attach_ link supports "attaching" a file to a topic.
"Attaching" a file means that the file is integrated and stored in the Foswiki directory structure and the topic has a reference to the file location.
The reference is embedded in the topic data, and can also be made available as a hyperlink in the topic text. Like topics, attachments have revisions.
If an attachment is an image file and linked from the topic text, the image will be displayed in the text.

### Subscribe
The _Subscribe_ link will record a request to be notified when this topic is changed.
You must be logged in to be able to subscribe. The link changes to _Unsubscribe_ once clicked, so you can undo the request.

### Print version
The _Print version_ link changes the presentation of the topic to a printable rendition. header, sidebar and footer are removed.
The displayed page can be printed using the browser print control.

### History
The _History: r2 < r1_ link supports navigation to previous versions.
In the display: _History: r2 < r1_, r1 will navigate to revision 1 and display that;
the &lt; character will navigate to a comparison display of r2 and r1; and the History hyperlink will navigate to a comparison page,
where the revisions to be compared can be selected.

### Backlinks
The _Backlinks_ hyperlink navigates to a page that presents a list of topics that have a reference to this topic.
Those references can be directly as a hyperlink in the text of the referring topic. Or they can be references from the referring topic to its parent topic.

### View wiki text
The _View wiki text_ link provides an insight in the notation used by Foswiki to format the presentation of the topic.
Wiki text will show the text of the topic as saved on disk. It shows the text you type as well as the Topic Markup Language (TML) elements that provide the formatting. You also see the use of Preferences and their implementation cousins (macros) in the form of the phrases starting with % or %text{ and ending with }%. TML and macros are  building blocks for the wiki applications. We will discuss them in more detail later.

### Edit wiki text
The _Edit wiki text_ hyperlink navigates to the edit page for the topic being viewed.
This is a different editor from the one presented previously. The editor does not support the WYSIWYG paradigm. Instead it will insert appropriate TML for the requested presentation. Clicking B(old) will insert the string <nop>*Bold text*. Selecting text followed by clicking B(old) will preceed and follow that text with an asterisk, the TML for bolding. This editor is a convenient mechanism for entry of TML whilst you are learning the language. 

### More topic actions
The _More topic actions_ hyperlink navigates to a page that supports the manipulation of the complete topic. It provides the ability to:
*   Show previous revisions of the topic
*   Compare revisions of the topic
*   Restore a topic by copying a selected revision of the topic to a new (latest) revision of the topic.
*   Set a new topic parent for this revision, replacing the old one.
*   Add preference settings to the topic, instead of using the =Set= keyword visibly in the topic.
*   Delete the topic. Move the topic with all revisions to the _Trash_ web.
*   Rename or move the topic. Change the topic name and/or move it to a different web.
*   Copy the topic. Make a copy of the topic with a new name, including the attachments, in the current web.
*   Show the child topics of this topic. I.e. list the topics that have this topic as a parent.
*   Show the _Backlinks_. Show the topics that have hyperlinks referring to this topic.


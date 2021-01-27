## Maintaining webs
Webs are maintained by the wiki administrator. The wiki administrator has access rights to the ManagingWebs topic in the System web.
The form on that page accepts the following details for the creation of the web:
*   Name of the new web - web names start with a capital and are preferably not wiki words.
*   Summary - summary of the purpose of the web. Foswiki displays this summary on the SiteMap in the System web.
*   Template web - an existing web, that serves as the template for the new web.
*   List on SiteMap page - select to show or hide this web on the SiteMap page
*   Include in global search and WEBLIST - include this web when search all webs is requested.
    WEBLIST is a variable that contains a list of selected webs in this wiki.
*   Web color - select a colour used as background for the web name.

When you click _Create web_  the new web is created in the _data_ directory.
The new web is populated with the standard Foswiki topics, used to manage the web.
The equivalent directory in the _pub_ directory is not created at this time. That happens when the first attachment is stored.
The standard Foswiki topics inserted at the time of web creation are:

<table>
<tr><td>
*   WebAtom
*   WebChanges
*   WebCreateNewTopic
*   WebHome
</td><td>
*   WebIndex
*   WebLeftBar
*   WebNotify
*   WebPreferences
</td><td>
*   WebRss
*   WebSearchAdvanced
*   WebSearch
*   WebTopicList
</td></tr>
</table>

We have encountered these pages before when we looked at the navigation from the left bar.
The list also includes the topic defining the left bar: WebLeftBar.txt

Whilst creating the web is the responsibility of the wiki administrator,
renaming, moving and deleting the web can be done from the _Tools_ section of the WebPreferences topic in the web.
Using this tool you can change the name of the web, make it the sub-web of another web or move the web to the _Trash_ web.

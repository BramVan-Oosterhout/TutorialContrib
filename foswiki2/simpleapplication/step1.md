The wiki workbench is a Foswiki application to support the building of applications in Foswiki.

To start, you must login (_admin/password_) and select the Applications web. On the home page of the Applications web you see a _New_ button.
Clicking the _New_ button opens a form. Enter the name of the new application (ExampleApp) and click _Submit_.
A new sub-web Application/ExampleApp is created. Navigate to the home page by clicking the _ExampleApp_ link.

The home page shows the workbench for the _ExampleApp_.
At the top of the page is a dashboard listing the common components of a wiki application.
The list is grouped in three parts: _Data Model_, _Control_ and _Documentation_.

The bottom of the page shows a table of the default components generated when the _ExampleApp_ was created.
You can filter the table with "web" and notice that the commmon Foswiki web control pages (like: WebPreferences and WebHome) are there.
When you filter by "topic" and sort the table by "TopicTitle", you will also find topics (like: DataForm and TopicStub) that are
generated to assist with the building of the new application.

If you look closely, you will see that many of the topics are of TopicType: TopicStub.
The TopicStub is an important component of a wiki application. Have a look at the content of the DataForm topic file
`cat data/Applications/ExampleApp/DataForm.txt`{{execute}}

A topic of type TopicStub contains only meta data. The essential fields are 
*   %META:FORM{name="Applications.TopicStub"}% identifying the topic as a TopicStub; and
*   %META:FIELD{name="Target" title="Target" value="Applications.DataForm"}% identifying that the content of this topic is defined in another web/topic:
[Applications.DataForm](https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/Applications/DataForm?raw=on)

You can navigate to Applications.DataForm to inspect the content.

In the next step we will use the DataForm topic to create a form that will list the fields defining the notepad entries in the _ExampleApp_

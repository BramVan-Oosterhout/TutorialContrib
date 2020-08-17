Now that we can create a topic for the note pad, we can begin to compose a home page for our implementation.
Since the home page will contain some logic, the type for the home page is selected as a TopicFunction.
Use the TopicFunction link on the application work bench to create a topic ExampleWebHome.

The content of the page must be placed between the %STARTINCLUDE% and %STOPINCLUDE% markers under the _Implementation_ header.
You can make it as nice as you want. At this stage you must include `%DBCALL{ "Applications/ExampleApp.ExampleType" }%`{{copy}}
so that the create button is included on the page. Save the topic.

You can see the resulting page under the _Test_ heading.

Note that there are no records found, even though we created two topics
(ExampleNote1 and ExampleNote2) in previous steps of this scenario. On closer inspection you will see that the grid is created by
`%DBCALL{"Applications.RenderTopicsOfType"}%` in the ExampleType topic. The documentation of
[Applications.RenderTopicsOfType](https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/Applications.RenderTopicsOfType)
states that the TYPE rendered is the BASETOPIC by default.
But our BASETOPIC is ExampleWebHome and there are no topics of that TYPE. So we need to provide the TYPE explicitly.
Edit the ExampleWebHome topic to use `%DBCALL{ "Applications/ExampleApp.ExampleType" TYPE="ExampleType"}%`{{copy}}
Now the two topics previously created in appear in the table.

We can use our ExampleWebHome anywhere we like. Create a new web using
[System.ManagingWebs](https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/System/ManagingWebs)
and call it ExampleWeb. Got to the WebHome page by clicking on the ExampleWeb link.
Edit the page, delete all content and replace it with `%DBCALL{ "Applications/ExampleApp.ExampleWebHome"}%`{{copy}}.
Save the page and you have a web that will record all the notes you create from the home page.

As everywhere else, you can add text to the WebHome page to explain the specific purpose of this web and how to use the application.
But in principle you now have a web that will contain topics of type ExampleType created at the press of a button.
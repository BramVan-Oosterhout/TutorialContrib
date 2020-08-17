So far we have ignored the content of the topics we create with the ExampleApp.

When we first create the ExampleNote{n} topic, we are presented with the standard wiki text entry page.
At this point, you can enter the complete content, or just a placeholder.

At the top of the page are 4 tabs. The page opens on the Text tab.

The Form tab contains the fields we defined earlier:
*   TopicType (read only) defines the type of the topic
*   TopicTitle, Summary and Status can be editted and should be set to an appropriate value.
   
When you add these fields, they will be populated in the grid on the WebHome page.

After the topic has been saved, you can add and modify text by clicking the Edit button,
update the text and save the page like any other topic.
For small additions it would be nice to have a Comment box on the page,
so you can add comments without going through the full edit/save cycle.

That can be done using the CommentPlugin  and the %COMMENT{ ... }% macro.
You can add that whenever you want to the page if the plugin is installed.

You can also add it as a default page content by using a TopicTemplate. In the work bench, select the TopicTemplate link.
Create a new TopicTemplate with the name ExampleTemplate. In the topic add: `%COMMENT%`{{copy}}.
We  will use all the defaults for now, they are good enough.

To use the topic template, you neeed to update the ExampleType topic creator.
Add the `TEMPLATE="Applications/ExampleApp.ExampleTemplate"`{{copy}} parameter to the parameter list of
`%DBCALL{"Applications.RenderSimpleTopicCreator" ... }%` and the ExampleTemplate is used to create the topics of type ExampleType.

After you save the update in the application, 
you can insert new topics with the comment box in the ExampleWeb created in step 5.
All the application changes are reflected in the implementation webs relying on the application.


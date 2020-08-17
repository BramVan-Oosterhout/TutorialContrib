Our _ExampleApp_ will support topics with specific data. Each topic will have a Title, Short descripton, a Status and some text.
The text will be stored in the body of the topic. The other three entries are fields associated with the topic.
To proceed we need to define a form that reflects this structure. The work bench DataForm  link provides the tools.

Click of the DataForm link and use the _New_ button to create the _ExampleForm_.
The ExampleForm will define the data structure used by topics in the _ExampleApp_.
Complete the ExampleForm with the following details:

| Our field | Form field name | Form field values |
|-----------|-----------------|------------------|
|Title      | TopicTitle      | use default      |
|Short description | Summary  | use default      |
|Status     | Status          |Name:_Status_ <br>Type: _select+values_ <br />Size: _1_ <br />Values: _Open,Closed_  |

The Status field is defined as a select drop down.

`| Status | select+values | 1 | Open,Closed | status drop down | | |`{{copy}}

More on field definitions in the [documentation](https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/System/DataForms).

When you save the ExampleForm topic, it will be added in the ExampleApp web as type DataForm.

In the next step we will define a mechanism to create a new topic that includes the fields in the ExampleForm.

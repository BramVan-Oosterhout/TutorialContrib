Our _ExampleApp_ will support topics with specific data. In the previous step we defined the form that defined that data.
The wiki work bench refers to topics that are associated with a particular set of fields as topic of that **type**

To develop a button that will create a topic of a particular type, we use the TopicType wiki work bench link.
After selecting the link, you are presented with a _New_ button. Click it and complete the details for the new TopicType.
The Title is: _ExampleType_ and you can add a short description. Click _Submit_ and you will be presented with a typical
TopicType definition created from a template. Save the topic.

There are four sections on the page.
### The "_Install_" button.
If you click it, you will be asked in which web you want to create a copy of this topic.
Install a copy in the Sandbox web and see what happens.  `cat data/Sandbox/ExampleType.txt`{{execute}}.
You created a stub pointing to the Applications/ExampleApp.ExampleType in the Sandbox with the name ExampleType.

### The "Documentation" section
This section serves to document what the ExampleType is for and how it is implemented. We will see some examples shortly

### The "Topics of type '_ExampleType_'" section 
At the top is a _New_ button. Click it and you get a form inviting you to create a new topic of type ExampleType.
Try it with the the title ExampleNote1 and click _Submit_. A new topic with title ExampleNote1 is created in the _ExampleApp_ web.
Save the topic.

Inspect the new topic with
[Applications/ExampleApp.ExampleNote1?raw=all](https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/Applications.ExampleApp/ExampleNote1?raw=all)
and note that:
*   %META:TOPICPARENT{name="ExampleType"}% - the topic parent is the type topic
*   %META:FORM{name="Applications/ExampleApp.ExampleType"}% - the form is of ExampleType, not ExampleForm we defined earlier.
*   The three fields defined in section "ExampleType Form" are included in the topic.

At the end of this section there is a data table. Note that the newly created topic ExampleNote1 is not listed there.
We will get back to this in the next section.

### The "ExampleType Form" section
This section defines a form. As we have seen, this form definition is used as the template for the topics created with the new button.

In the next step we will have a look under the hood and tie the ExampleType and the ExampleForm together.
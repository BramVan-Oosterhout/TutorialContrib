So now you have created a working wiki application. You can create topics of a specific type.
And you can create new webs, with different access rules for different purposes.

There are many shortcomings in the application. Whe will revisit this application in Scenario 4 of this course.

For now we will address one issue that is glaring on the front page. The grid does not display fields that are of interest.
the fields we would like are:
*   the Title
*   the Summary
*   the Status
*   the date last changed

Of these four, only the Status is not currently shown. Instead there is a field called "Application".
Inspecting the implementation of the grid in _ExampleType_, we see that it is implemented through
%DBCALL{"Applications.RenderTopicsOfType"}%. Inspecting
[Applications.RenderTopicsOfType](https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/Applications.RenderTopicsOfType)
the documentation suggests that the fields listed in the grid are implemented using the FIELDS parameter.
The display titles are implemented with the &lt;fieldname>_title construct. The following changes in _ExampleType_
will change the fields and their display title to the desired content.

Change `FIELDS="TopicTitle,Summary,WikiApplication,Changed"`{{copy}} <br />
And `Status_title="%MAKETEXT{"Status"}%"`{{copy}}

We do not delete the "WikiApplication_title" parameter in Applications.RenderTopicsOfType.
It will be ignored, since there is no WikiApplication field listed in the FIELDS parameter any more.

Using this modification shows the glaring absence of the Summary in the grid.
You can add the Summary by editing the topic field in the Form tab when the topic is being edited.
There are other, better ways to enter data into fields. But these will be discussed when we revisit this application in Scenario 4.


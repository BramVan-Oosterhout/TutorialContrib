In the previous step we explained the form for the RenderSimpleTopicCreator up to the data entry for the new topic name. The topic creator caters for additional data entry through the RENDERFOREDIT macro. RENDERFOREDIT is implemented in the [System.FlexFormPlugin](https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/System.FlexFormPlugin#RENDERFOREDIT).

### The second occurrence of RENDERFOREDIT
To explore the macro we will start with the second occurrence in the RenderSimpleTopicCreator. It has the simpler parameter constructs. Let's look at the parameters individually:
* form - specifies the topic that defines the form in table format
* topic - specifies the name of the topic for which the form is to be edited. In the RenderSimpleTopicCreator, it will be in the TEMPLATE, which defaults to empty.
* fields - specifies the (list of) fields to be rendered. In this case TopicTitle.
* excludeattr - Fields with an `H` in the attribute column of the form definition table are excluded from the rendering.
* format - the text to be rendered by the macro. It can contain a number of placeholder for specific content. See [documentation](https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/System.FlexFormPlugin#RENDERFOREDIT) for details. <br />
```
<div class='foswikiFormStep'><h3>$title:$mandatory</h3>$edit<div class='foswikiFormDescription'>$description</div></div>
```
* TopicTitle_value - value to be shown on initial display of the TopicTitle field. 
* TopicTitle_title - label to be shown as prompt for the rendered field

The last two parameters are a pattern. Any field defined in the form definition can be given an initial display value and a prompt using the pattern: &lt;fieldname>_attribute.

See [Ex05](https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/Sandbox.Ex05) in the Sandbox for examples.

### The first occurrence of RENDERFOREDIT
Now that we have seen the basic invocation of RENDERFOREDIT, we will take a look at some more complicated constructs. The first RENDERFOREDIT expects the VALUES parameter to be passed. A typical parameter would be `VALUES="fieldName1=value1;fieldName2=value2;fieldName3=value3"`.

The FORMATLIST macro will:
* split this list on the semicolon in three elements of the form field=value
* for each element
    * match the regular expression pattern `(.*)=(.*)` and collect the values for $1 (=field) and $2 (=value)
    * store $1 (the fieldName) in an array  
* join the elements of the array separated by a comma
The result is `fieldName1,fieldName2,fieldName3`. And this string becomes the value of the `fields` parameter. 

A similar expression is used further down to create a collection of parameters to the RENDERFOREDIT macro: <br />
`fieldName1_value="value1" fieldName2_value="value1" fieldName3_value="value3"`

Finally, the RENDERFORDISPLAY macro is used to contruct the `exclude=` parameter to exclude specific fieldnames from rendering. RENDERFORDISPLAY is used to extract the field `name` from the FORM for those fields that have an attribute : `c`. The resulting list of field names is returned, preceded by a vertical bar (|) and separated by vertical bars. So if `fieldName4` and `fieldName6` both had an attribute `c` then RENDERFORDISPLAY would result in: `|fieldName4|fieldName6`. And the resulting RENDERFOREDIT parameter would be: `exclude="^(TopicType|fieldName4|fieldName6)$`

See [Ex06](https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/Sandbox.Ex06) in the Sandbox for examples.

### The third occurrence of RENDERFOREDIT
The third occurrentce of RENDERFOREDIT renders a data entry format like the second occurrence does:
```
<div class='foswikiFormStep'><h3>$title:$mandatory</h3>$edit<div class='foswikiFormDescription'>$description</div></div>
```
But this time for all fields that have the attribute `c` set in the form definition table, due to the `includeattr="\bc\b"`.The topics: TopicType and TopicTitle are excluded by `exclude="^(TopicType|TopicTitle)$"`.  And field values are set by the FORMATLIST at the bottom as in the first occurrence.

### The fourth and final occurrence of RENDERFOREDIT
The final occurrence of RENDERFOREDIT will render three fields as per: `fields="TopicType,WikiApplication,Summary"`. The format will render them as hidden fields:
```
<input type='hidden' name='$name' value='$value' />
```
* TopicType, with the value provided in the TYPE parameter as per: `TopicType_value="%`TYPE%"`
* Summary, without a value as per: `Summary_value=""`
* WikiApplication, with the name of the BASEWEB as per `WikiApplication_value="%FLEXWEBLIST{include="%BASEWEB%" format="$name"}%"`

The FLEXWEBLIST macro is documented in the [System.FlexWebListPlugin](https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/System.FlexWebListPlugin). It is used here to remove any parent webs from the reference provided by the BASEWEB parameter.

If any of these fields has an attribute `c` set in the form definition table, then the field will be ignored (not rendered).

### In summary
The RenderSimpleTopicCreator will render a form with:
* a collection of standard **hidden** fields
* A **hidden** field (topic) with a constructed topic name as value
* followed by fields made available through RENDERFOREDIT:
    * **Hidden** fields as listed in the VALUES parameter, with the exception of those with attribute: `c`
    * The TopicTitle field for **data entry**, unless marked with attribute `H`
    * Fields marked with attribute `c` for **data entry**, with the exception of TopicType and TopicTitle
    * **Hidden** fields TopicType, WikiApplication and Summary, unless marked with attribute `c`








### Answer
<!-- Solution text (if any) goes here -->
To refresh the examples use:
* `/tmp/answer step4`{{execute}}





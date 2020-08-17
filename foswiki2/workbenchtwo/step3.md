<!-- Scenario text goes here -->
Login (_admin/password_) if you have not already done so. And open the RenderTopicsOfType in a separate tab.

The RenderTopicsOfType function presents topics of a givent type in a tabular format. The RenderTopicsOfType  function is implemented using a single macro: DATATABLE, documented in the [System.JQDataTablesPlugin](https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/System.JQDataTablesPlugin). The plugin has a large number of parameters that affect the display content, format and beviour. 

Some of the parameters used in RenderTopicsOfType are affected by the parameters passed to RenderTopicsOfType. 
* **TYPE** is used to limit the data displayed through the `query` parameter.
* **FILTER** extends the `query` with additional selection criteria
* **ROWNUMBERS** adds a special column `index` to the `columns` parameter if set to on.
* **SORT** and **REVERSE** affect sort order and field to be sorted on.
* **SELECTING** adds the `selecting`, `selectionmode` and `selectproperty` to define which column(s) have select boxes
* **FIELDS** lists the fields to be rendered in the table
    * For each field, the title and width can be set with the modifiers &lt;field>_title and &lt;field>_width. These are selected using the FORMATLIST macro

FORMATLIST is a versatile formatter, documented in the [System.FilterPlugin](https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/System.FilterPlugin). It takes a list, splits it on a defined separator character and then renders each element in the selected format. The format must be delayed so that the result translates into `&lt;field>_title="%&lt;field>_title%"` and `&lt;field>_width="%&lt;field>_width%"` with each `&lt;field>` appropriately substituted.

You can explore some detailed examples in [Ex02](https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/Sandbox/FoswikiTwo4.Ex02) in the Sandbox.

### Answer
To refresh the examples use:
* `/tmp/answer step3`{{execute}}
<!-- Solution text (if any) goes here -->


### _CommentPlugin_
The comment plugin provides a quick way to enter text in Foswiki, without going through an Edit/Save cycle. The simplest version of the use of the comment plugin is to add:
```
%COMMENT%
```{{copy}}
to the TML in Sandbox.ExtenstionsStep3 and after saving you are presented with a edit text box and an Add comment button.

The comment plugin is more versatile than that. Its presentation as well as its output is controlled through templates. For instance:
```
%COMMENT{type="table" button="Add" target="Sandbox.TestCommentPlugin" }%
```{{copy}}
will add the comment as a wiki table entry in the _Sandbox.TestCommentPlugin_.


The comment plugin uses the _comment.tmpl_ template file, which contains one line:
`%TMPL:INCLUDE{CommentPlugin}%`
The plugin looks for the _CommentPluginTemplate_ topic in the current web and, if not found, in the System web
to define the presentation of the input (the PROMPT box) and the output.
Different from the expansion of skin templates reads the template and emits text for every TMPL:P directive,
the comment plugin starts the text generation with a specific definition.  

For a particular _type_ the comment plugin will 
*   use the _PROMPT:type_ directive definition (_%TMPL:DEF{PROMPT:type}%_) to generate the input panel for the comment to replace the _%COMMENT{ ... }%_ macro
*   use the _OUTPUT:type_ directive definition (_%TMPL:DEF{OUTPUT:type}%_) to generate the text to be inserted in the requested location

The default entries in _System.CommentPluginTemplate_ are:
 
**the PROMPT directive**
`less -N -j 10 -p 'DEF\{PROMPT:table\}' /var/www/foswiki/data/System/CommentPluginTemplate.txt`{{execute}}


**the OUTPUT directive**
`less -N -j 10 -p 'DEF\{OUTPUT:table\}' /var/www/foswiki/data/System/CommentPluginTemplate.txt`{{execute}}

Some observations on the templates:
*   The _TMPL:DEF_ directives (like: _%TMPL:DEF{PROMPT:table}%_) do not quote the identyfier as in the skin templates we saw previously.
    The quoted syntax (like: _%TMPL:DEF{ "PROMPT:table" }%_ works, and is preferred for consistency.
*   The _PROMPT_ directive is a html form, presented in a TML table. It has _&lt;label>_ and _&lt;input>_ tags.
*      The _PROMPT_ directive does not define _&lt;form>&lt;/form>_ enclosing tags. These are automatically generated around the _PROMPT_.
*   The _DISABLED_ macro will expand to <code>disabled="disabled"</code> in the preview context
*   Macros are expanded in the _PROMPT_ templates, as they are in skin templates
*   The parameters are expanded in the template. For instance: <code>button="Add"</code> will expand _%button|Add entry%_ to _Add_
*      if the button parameter is not provided _%button|Add entry%_ will expand to  _Add entry_
*   User defined parameters will be expanded in the template. For instance: <code>myparameter="myvalue"</code> will expand _%myparameter|mydefault%_ to _myvalue_
*      and _%myparameter|%_ to _myvalue_, but _%myparameter%_ will not expand and display as _%myparameter%_
*      This construct for expanding parameters and default values is limited to the comment plugin templates.
*   The _OUTPUT_ directive supports a _POS:location_ macro to identify where the generated text is to be inserted in the target topic.
*      _location_ can be _TOP_ or _BOTTOM_ related to the target topic. Or _BEFORE_ or _AFTER_ related to the _%COMMENT{ ... }%_ macro.
*      The actual insertion is handled by the plugin code.
*   Only a limited set of macros are expanded in the output template at the time the comment is made.
    The remainder will be inserted in the comment and expanded when the comment is viewed.

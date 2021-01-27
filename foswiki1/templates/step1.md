### _Template directives_
In the context of a template, Foswiki expands a handful of special macros that are similar to meta data.
These macros are called template directives. Template directives all have the form _%TMPL:directive{"identifier"}%_.

There are five template directives:

| *Name* | *Purpose* |
|--------|-----------|
| _P_      |Places the string associated with the _identifier_ in the output stream. | 
| _DEF_ |Defines a string of text of any form (html, TML  and text) and associates that string with the _identifier_ .  The string is terminated by  the template macro: _%TMPL:END%_. |
| _END_ |Terminates the _%TMPL:DEF{ "identifier" }%_ |
| _INCLUDE_ |Includes another template in the current template file. |
| _&lt;nothing>_ |A special macro that is treated as a comment. All text inside _%{_ and _}%_ is ignored, including new lines |

Template expansion starts from the first _%TMPL:P{...}%_ directive encountered in the templates as they are expanded.
In the default _view_ case that directive is `%TMPL:P{"document"}%` in the included _templates/foswiki.tmpl_.
Check it out with:
`less -N /var/www/foswiki/templates/foswiki.tmpl`{{execute}}

_document_ is defined as:
`less -N -j 10 -p 'DEF\{"document"\}' /var/www/foswiki/templates/foswiki.tmpl`{{execute}}

You can see the structure of the html page reflected in the macros that are evaluated. First the _htmldoctype_ is emitted which is defined as:
`less -N -j 10 -p 'DEF\{"htmldoctype"\}' /var/www/foswiki/templates/foswiki.tmpl`{{execute}}

This is followed by the _htmlstart_, which is not defined in the default set of templates.
The expansion of undefined templates is quietly skipped.  Then _head_ is emitted, defined as:
`less -N -j 10 -p 'DEF\{"head"\}' /var/www/foswiki/templates/foswiki.tmpl`{{execute}}

Next comes _bodystart_,  defined as:
`less -N -j 10 -p 'DEF\{"bodystart"\}' /var/www/foswiki/templates/foswiki.tmpl`{{execute}}

Followed by _main_ defined as:
`less -N -j 10 -p 'DEF\{"main"\}' /var/www/foswiki/templates/foswiki.tmpl`{{execute}}

then _bodyend_:
`less -N -j 10 -p 'DEF\{"bodyend"\}' /var/www/foswiki/templates/foswiki.tmpl`{{execute}}

and finally _htmlend_, which does not have a definition in the default template files.

The examples above are taken directly from the _foswiki.tmpl_ file in the _Foswikiroot/templates_ directory. They illustrate a few things:
*   Empty definitions are OK and do not emit anything. They are silently ignored.
*   Definitions can in turn have new _%TMPL:P{...}%_ directives, which are potentially defined in another template file or topic.
*   Definitions can contain normal macros like: _%GMTIME%, %TOPIC%_ and so on. 
*   As a guide, the display of content is defined in the _contentwrapper_. 



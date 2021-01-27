### _Developing templates_
The references will help you further if you want to understand and develop templates.
Templates can be daunting to unravel and understand.
The following _perl_ script (_tracetmpl.pl_) can help you to get a summary of a template file.
`less -N tracetmpl.pl`{{execute}}

Run the script with a template file name as the parameter and you will see that most templates are full of definitions
and very few first level active directives. For instance:
`./tracetmpl.pl /var/www/foswiki/templates/edit.tmpl |less`{{execute}}
shows only one include statement. The rest are definitions.
```
---------- ACTIONS ----------
%TMPL:INCLUDE{"foswiki"}%
```

A more active version of this mechanism is documented in the _System.SkinTemplates_ topic under Debugging.
The module handling the template expansion has a trace mode. Change the TRACE constant value in _lib/Foswiki/Templates.pm_  from 0 to 1.
`less -N -j 10 -p 'TRACE => ' /var/www/foswiki/lib/Foswiki/Templates.pm`{{execute}}
and the directivename responsible for each part of the generated html will be included in the html.
Use _View>Source_ in your browser and you will see comments like this in the source:
```
<!--directivename--> emitted html <!--/directivename-->
```
This setting will lead to some mangled html and the display will be affected.
### _To find a template_ 
What template is used is in the first instance defined by the skin defined by the _SKIN_ preference.
There is an extensive naming and location scheme for templates which is roughly (for details see the documentation):

1.   check whether the template occurs as a file in the _Foswikiroot/templates_ directory (Set in _configure_ through _{TemplatePath}_
1.   check whether the template occurs as a topic in the current web 
1.   check whether the template occurs as a topic in the System web

The __first__ occurrence of the template is used. 

The name of the template is derived from the context as: 
*   `<script(view|edit)> . <skin> . tmpl` for filenames. Example: _view.pattern.tmpl_ 
*   `<skin> . Skin . <script(view|edit)> . Template` for topic names. Example: _PatternSkinViewTemplate_. 
*      <skin> may be undefined, in which case the names become: _view.tmpl_ for the file and _ViewTemplate_ for the topic. 

Template processing starts with a particular template file.
If the _SKIN_ preference is not set (`SKIN =` ), that would be _view.tmpl_ in the _Foswikiroot/templates_ directory for viewing a topic.
And _edit.tmpl_ for editing a topic.
*   `less /var/www/foswiki/templates/view.tmpl`{{execute}}
The first line in _view.tmpl_ is  `%TMPL:INCLUDE{"foswiki"}%` which ends with the line `%TMPL:P{"document"}%`
thereby starting the emission of the html.

The _SKIN_ preference can be a list of skins like: `SKIN = natedit, pattern`.
In that case the name of the template in the scheme above will first be tried with _natedit_ and if that file and topic is not found,
the search continues with _pattern_
*   `less /var/www/foswiki/templates/view.pattern.tmpl`{{execute}}
*   `less /var/www/foswiki/templates/edit.natedit.tmpl`{{execute}}

The set of templates in the _Foswikiroot/templates_ directory is complete and consistent for the operation of Foswiki.
The presentation achieved with these templates is considered plain and various skins are available as contributions on the Foswiki website.
Foswiki is shipped with the _pattern_ skin when installed out-of-the-box.

Templates are processed conceptually in two passes.  The first pass creates all the definitions.
Template definitions can be repeated between template files. When this occurs, the __last__ definition will be the one applied.

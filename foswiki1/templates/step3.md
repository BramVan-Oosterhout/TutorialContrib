### _Customising a skin with templates_
The definition and customisation of a skin is well documented. Customisation requires an entry point in the template file hierarchy.
This is most conveniently achieved by adding the name of your skin to the _SKIN_ preference like: <code>SKIN = myskin, pattern</code>.
This will ask Foswiki to look for:
*   _view.myskin.tmpl_ or _edit.myskin.tmpl_ in the _Foswikiroot/templates_ directory
*   _MyskinSkinViewTemplate_ or _MyskinSkinEditTemplate_ in the current web or the _System_ web

As an exercise: remove the remove the _Edit_ link from the bottom of the topic.
You need to override the definition of the _edit&lowbar;topic&lowbar;link_ directive.
That directive is defined in the _viewtopicactionbuttons.tmpl_ file
`./tracetmpl.pl /var/www/foswiki/templates/viewtopicactionbuttons.tmpl | less -N -j 10 -p '-- edit_topic_link --'`{{execute}}

The directive can be redefined in a local _Sandbox.MyskinSkinViewTemplate_ with:

```
%TMPL:INCLUDE{"view"}% 
%TMPL:DEF{"edit_topic_link"}%%TMPL:END% 
```{{copy}}

To activate the definition in a topic, you need to add
```
   * Set SKIN = myskin, pattern
```{{copy}}
to the topic. To activate it for the whole the web, you need to paste the statement in _Sandbox.WebPreferences_

If you want to remove the separator as well, you need to change the definition of _action&lowbar;activatable&lowbar;edit&lowbar;or&lowbar;create_
`./tracetmpl.pl /var/www/foswiki/templates/viewtopicactionbuttons.tmpl | less -N -j 10 -p '-- action_activatable_edit_or_create --'`{{execute}}


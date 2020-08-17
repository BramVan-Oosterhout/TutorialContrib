<!-- Scenario text goes here -->
In the previous step we modified the text content display. In this step we will adjust the display of the container.

The left bar can be removed, but we need to retain the registration and login capability. At the top we can remove Jump (To use it you need to know a topic name) and Search, because we have the grid on the home page. So replacing Jump and Search with the login seems appropriate. The techniques used before don't work here. So you need to read the documentation: [System.PatternSkin](https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/System.PatternSkin). 

The left bar is defined in the `viewsidebar.pattern` template. `less -N templates/viewsidebar.pattern.tmpl`{{execute}}. The content of the sidebar is defined (line 18) in the [Sandbox.WebLeftBarExample](https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/Sandbox.WebLeftBarExample) topic of the web you are using. Inspecting that topic, you will see that the login is specified in [System.WebLeftBarLogin](https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/System.WebLeftBarLogin). More about that in a minute. 

 The left bar can be removed by clearing the definition of `sidebar`. But that leaves side effects due to the styling. The documentation [System.PatternSkinCustomization#I_want_to_hide_the_side_bar](https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/System.PatternSkinCustomization#I_want_to_hide_the_side_bar) recommends to use a different style through setting the USERSTYLEURL. But that would affect all topics, not just the Notes. `grep -l "USERSTYLEURL" templates/*`{{execute}} shows USERSTYLEURL is used in `css.pattern.tmpl` (See: `less -N templates/css.pattern.tmpl
`{{execute}}) and rendered in `styles:user_defined (line 25)`. `styles:user_defined` is rendered conditionally in `styles:screen (line 5)`. To remove the side bar you can add the `hideleftbar.css` style sheet in `styles:screen`.
So instead of `Set USERSTYLEURL = %PUBURLPATH%/%SYSTEMWEB%/PatternSkinCssCookbookNoLeftBar/hideleftbar.css` we use:
```
%TMPL:DEF{"styles:screen"}%%IF{ "$ FOSWIKI_LAYOUT_URL" then="<link rel='stylesheet' href='%FOSWIKI_LAYOUT_URL%' media='all' type='text/css' />"}%
%IF{ "$ FOSWIKI_STYLE_URL"  then="<link rel='stylesheet' href='%FOSWIKI_STYLE_URL%' media='all' type='text/css' />"}%
%IF{ "$ FOSWIKI_COLORS_URL" then="<link rel='stylesheet' href='%FOSWIKI_COLORS_URL%' media='all' type='text/css' />"}%
%TMPL:P{"styles:custom_skin"}%%IF{ "$ USERLAYOUTURL or $ USERSTYLEURL or $ USERCOLORSURL" then="$percntTMPL:P{$quotstyles:user_defined$quot}$percnt"}%
<link rel='stylesheet' href='%PUBURLPATH%/%SYSTEMWEB%/PatternSkinCssCookbookNoLeftBar/hideleftbar.css' media='all' type='text/css' />
%TMPL:P{"styles:dynamic"}%%TMPL:END%
```{{copy}}

Without the left bar, the login links are no longer available. We can add the login links in the top bar by changing the definition of the `topbar (line 5)` template macro in
`less -N templates/viewtopbar.pattern.tmpl`{{execute}}. The `login` controls are rendered in [System.WebLeftBarLogin](https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/System.WebLeftBarLogin) and we can use that code in our `topbar`
```
%TMPL:DEF{"topbar"}%<div class="patternLeftBarPersonal">
%IF{
  "context authenticated" 
  then="%JQICON{"%IF{"context isadmin" then="user_red" else="user"}%"}%%MAKETEXT{"Hi, [_1]" args="<span class='foswikiUserName'>[[%WIKIUSERNAME%][%SPACEOUT{%WIKINAME%}%]]</span>"}%"
}%%IF{
  "$ LOGOUT != ''" 
  then="%JQICON{"lock"}%$percntLOGOUT$percnt"
  else="%IF{"{AdminUserWikiName}='%WIKINAME%'" then="%JQICON{"lock"}%[[%SCRIPTURLPATH{"view"}%/%BASEWEB%/%BASETOPIC%?logout=1][Logout]]"}%"
}%%IF{
  "$ LOGIN != '' and not context authenticated" 
  then="%JQICON{"key"}%$percntLOGIN$percnt %IF{
      "context registration_supported AND context registration_enabled" 
      then="%JQICON{"add"}%[%MAKETEXT{"Register"}%](https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/%SYSTEMWEB%.UserRegistration)"
    }%"
}%
</div>%TMPL:END%
```{{copy}}

Save the template and check out the display of your notes in the Sandbox. With `?cover=test`  added to the url you'll see that all extraneous material has been removed.
You are almost there. The content of the page is now all laid out. The page can look better if you add some more styling. We will do that in the next step.


### Answer
<!-- Solution text (if any) goes here -->
To compare you answers execute: `/tmp/answer step3`{{execute}} 

The complete template is in [Applications/SolNotePadApp/TestSkinNoteViewTemplate](https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/Applications/SolNotePadApp/TestSkinNoteViewTemplate).

Check the answer in the Sandbox by creating a new note.






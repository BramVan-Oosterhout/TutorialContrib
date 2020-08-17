<!-- Scenario text goes here -->
Login (_admin/password_) if you have not already done so. And open the [Applications/RenderWikiTopicView](https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/Applications/RenderWikiTopicView) in a separate tab.

The RenderWikiTopicView function presents the topic title and revision information at the top of the topic page.  The RenderWikiTopicView is implemented in two sections.
* The title, which is standard and defined between the %STARTINCLUDE% and %STOPINCLUDE% markers, and And t
* The revision, which is only presented when the include parameter DISPLAYREVISIONINFO="on" (the deafult) and defined between the %STARTSECTION{"revinfo"}% and %STOPSECTION{"revinfo"}% markers.

### Topic title

The RenderWikiTopicView function embelishes the topic title. The first IF{ ... } tests whether the TITLE_PREFIX parameter is defined and not empty. If true, the value of the parameter is renederded inside the span tags that define the style.

Immediately after the prefix, without any whitespace, the title of the topic is rendered as a link. Instead of the usual Foswiki `[ ... ](https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/ ... ), this function renders a proper html `a= tag. DBQUERY is used to format the href` attribute value using the SCRIPTURL parameter. The title of the link is inserted as a translation, using the TRANSLATE macro, of the OBJECT's TopicTitle field. The TopicTitle of the OBJECT is obtained with the GETTOPICTITLE macro, which is documented in the [System.DBCachePlugin](https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/System.DBCachePlugin).

Following the rendered title is another optional embellishment: the TITLE_EXTRA. The IF{ ... } checks that the parameter exists and is not empty. If true, the value of the TITLE_EXTRA parameter is rendered with the appropriate style.

After the embellished topic title is rendered, RenderWikiTopicView checks if the OBJECT has a Summary field. `IF{ 'OBJECT{ ... }/Summary' }`. If it has, the Summary field is retrieved with `FORMFIELD{ "Summary" topic="OBJECT" rev="URLPARAM{ "rev" }" }`. The revision is obtaned from the URL using the [URLPARAM](https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/System.VarURLPARAM) macro. Note that all macros are escaped using =$percent= and =\"=. The value of the Summary field is then translated and rendered.

### Revision
Following the renering of the title and summary, the DISPLAYREVISIONINFO macro is checked. If it is not set, the default value evaluates to true and the `revinfo` section in RenderWikiTopicView is rendered. There are four parts to the revision information:
* The revision date. This is formatted by the [REVINFO](https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/System.VarREVINFO) macro as a hyperlink to the Foswiki `diff` script with the date value formatted as `date - hh:mm`.
* The revision number, This starts with an icon rendered by `ICON{ "fa-flag" }` (See: [ICON](https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/System.VarICON)). Then follows a translation of the revision number retrieved by `REVINFO{ "$rev" ... }`.
    * Note that the value is provided to the string to be translated through: `TRANSLATE{ "Version [_1] args="..."}`. TRANSLATE is documented in the [System.MultiLingualPlugin](https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/System.MultiLingualPlugin).
* The author. The format first checks if the topic `Main.wikiusername` exists. If that is true, then GETTOPICTITLE retrieves the display name from the TopicTitle field of that topic and a link to `Main.wikiusername` is rendered. If `Main.wikiusername` does not exist, the author name listed in the metadata is rendered.
* The total likes. Finally DBQUEY checks the existence and value of the `total_likes` field on the OBJECT. If it is greater than 0, the result is rendered as ICON{ "fa-thumbs-o-up"} followed by the number of likes. Likes can be recorded with the [System.LikePlugin](https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/System.LikePlugin).

You can explore some detailed examples in [Ex01](https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/Sandbox.Ex01) in the Sandbox.




.

### Answer

<!-- Solution text (if any) goes here -->


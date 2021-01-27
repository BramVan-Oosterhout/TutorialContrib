### _Forms and Fields_
There are two additional meta properties that are related to user data. They are referred to as the form and the fields:

| *meta data* | *added when:* |
|-------------|---------------|
| META:FORM |Specifies the topic that defines the fields and properties. Forms can be added to a topic through the user interface, _if_ the form topic is listed in the WEBFORMS preference for the web.   |
| META:FIELD |Records the field value when assigned. Fields are defined in the form topic referred in the META:FORM data. |

By convention the form topic has a name ending with _Form_. When you search the System web for the topic title containing _Form_,
you will find several topics. There are some examples in the 
[Sandbox.MetaDataStep2](https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/foswiki/Sandbox/MetaDataStep2)
 topic.
   
At the bottom of the PreferencesPlugin debug display, you see the meta data in the topic, followed by the displayed form.

PackageForm is defined as the form supporting a topic by the following meta data entry in the topic:
  %META:FORM{ name="PackageForm" }%

The form topic usually resides in the same web as the topics that are supported by the form.
If the form topic is located in a different web from the topics supported by the form, the form topic name must be fully qualified with the web.
Like: _System.PackageForm_.

The content of the form topic _must_ contain a table that defines the fields of the form. The table format is:

| *Name* |the name of the field |
|---------|--------|
| *Type* |the type of the field like =checkbox, date, select= etc. |
| *Size* |The width (in characters) for display and data entry |
| *Values* |The predefined input for checkboxes, radio buttons and dropdown lists |
| *Description* |A description of the field |
| *Attributes* |Mandatory (M) and/or hidden (H) |
| *Default* |Value assigned on creation of the field |

Take a look at the PackageForm form definition  the topic linked in the
[Sandbox.MetaDataStep2](https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/foswiki/Sandbox/MetaDataStep2)
 topic.
```
| *Name:* | *Type:* | *Size:* | *Values:* | *Tooltip message:* |
| Author | text | 60 | | |
| Version | text | 60 | | Numerical version number e.g. 1.2 |
| Release | text | 60 | | Release identifier (usually the date) |
| Description | text | 60 | | one line description of the module |
| Repository | text | 60 | | e.g. https://github.com/foswiki/EmptyPlugin |
| Copyright | text | 60 | | e.g. 2015, The Artist, All Rights Reserved |
| License | text | 60 | | e.g GPL ([[http://www.gnu.org/copyleft/gpl.html][GNU General Public License]]) |
| Home | text | 60 | | e.g. https://foswiki.org/Extensions/%TOPIC% |
| Support | text | 60 | | e.g. https://foswiki.org/Support/%TOPIC% |
```


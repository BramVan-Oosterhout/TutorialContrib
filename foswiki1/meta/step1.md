### _Meta data_
Meta data is usually displayed in a form format and can be edited in that same format.
The meta data for each topic (like Creation date, Author and so on) is collected in the topic _.txt_ file.
You can see this by opening a topic with the _?raw=debug_ parameter, which displays the TML and meta data for the topic in a Foswiki formatted page.

You find an example in [Sandbox.MetaDataStep1](https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/foswiki/Sandbox/MetaDataStep1)

Instead of _?raw=debug_ you can use _?raw=all_ url parameter to see the raw text of the topic in the browser window
instead of inside a Foswiki formatted page..

When you inspect the topic with either url parameter, you will see two extra lines at the top. They are the meta data associated with this topic:
```
  %META:TOPICINFO{author="JoeBlog" comment="" date="1456896969" format="1.1" reprev="1" version="1"}%
  %META:TOPICPARENT{name="WebHome"}%
```
Meta data is recorded using the same syntax as a macro.
The macro starts with _%META:_ followed by the meta data name (like: _TOPICINFO_),
followed by the value(s) recorded with that item as _name="value"_ pairs.

The following is standard meta data added in the life cycle of a Foswiki topic:

| *meta data* | *added when:* |
|-------------|---------------|
| META:TOPICINFO |the topic is created. The topic info is maintained as the topic is updated |
| META:TOPICPARENT |the parent is changed using: _More topic actions > Set new topic parent_ |
| META:TOPICMOVED |the topic is moved using _More topic actions > Rename or move topic_ |
| META:FILEATTACHMENT |a file is attached to the topic |
| META:PREFERENCE |using _More topic actions > Edit topic preference settings_ |

The table above presents the circumstances when the meta data is created by Foswiki as part of actions in the user interface.
You can add meta data to a topic by typing the correct entry directly into the editor.
The percent (in _%META_) must be in column 1 for the meta data to be recognised.


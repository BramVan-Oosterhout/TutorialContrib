## What are webs
The out of the box Foswiki installation implements all Foswiki components as a single directory tree.
You can display the directory structure in the Terminal using: `tree -L 2 -d /var/www`{{execute}}.
They are devoted to the operation of Foswiki: **Technical directories**

*   _bin_ - contains the entry point executable. Like: _edit_, _attach_, _view_, etc.
*   _lib_ - contains the implementations of the functionality as perl modules. Like: _Foswiki.pm_. 
*   _locale_ - contains the portable object files for translation
*   _templates_ - contains the root of the template system, used to define the browser presentation of the topics.
*   _tools_ - contains a variety of command line perl scripts to support implementation. Like: _bulk&#95copy.pl_, dependencies, etc.
*   _working_ - contains data supporting the operation of Foswiki. Like: logs (_error.log_, _events.log_, _configure.log_)

or to the storage of web content: **Content directories**
*   _data_ - top directory for storage of topic data. Contains a directory for each web (like: _Main_, _Sandbox_), which in turn can contain directories for sub-webs
   *   For each topic there is a _topic.txt_ file and a _topic,pfv_ directory. Note the comma in topic&lt;comma&gt;pfv
   *   The _topic,pfv_ directory contains the history of the topic as files 1, 2, 3 and so on. Where the highest number is the current revision of the topic
*   _pub_ - top directory for the storage of attachments. Mirrors the directory structure of the data directory for each web. 
   *   Inside the directory for the web is a directory for each topic that has one or more attachments. Each topic attachment directory contains the attachments for the topic

`cd /var/www/foswiki; tree -L 2 data/Main pub/Main | less`{{execute}}

The directories under the _data_ and _pub_ directories that contain the current versions of topics or attachments
are the implementations of Foswiki *webs*. Webs are entities within the larger Foswiki data structure.
Within a web, topics are hyperlinked with the topic name only.
To hyperlink to a topic in another web, the topicname is qualified with the web name. Like _Main.TopicA_ instead of _TopicA_.
Searches are restricted to a single web, unless specifically asked to cover multiple webs.

Webs can have sub-webs, which in turn can have further sub-webs. Each of the sub-webs is a sub-directory in the parent web and follows the same rules.
Refererences from webs to subwebs and vice versa must be fully qualified.
The qualification is a full pathname followed by a dot, followed by a topic name.


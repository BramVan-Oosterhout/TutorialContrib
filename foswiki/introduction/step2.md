## Topic, Jump, Search and Breadcrumb
### The topic body
The topic body contains a bulleted list of hyperlinks with link titles that are spelled in camel case like: WebTopicList.
Words spelled that way are referred to as wiki words and are automatically hyperlinked to the topic of that name.
If that topic does not exist, the hyperlink will be coloured differently and will *create* a topic of that name for the user to edit.

### The Jump box
The Jump box provides a fast way to navigate between topics if you know the topic name.
You have to know the exact spelling of the topic name, including case. All other entries will lead to a _Topic "blah..." does not exist_ response.
So you can jump to WebTopicList, but not to webtopiclist

### The Search box
The search box provides a way to navigate to a topic  about which something is known.
You may search for WebTopicList and get all pages referring to WebTopicList as well as WebTopicList itself.
The search is not case sensitive. Searching for webtopiclist gives the same result.
Searching for web topic list (three words) produces a different result.
That search returms all topics containing the word web, or topic, or list or a combination of these words.
The search results page has a number of tabs: Search, Advanced search, A-Z and Help.
And it supports a number of search options, including a regular expression search. More on that later.

### The breadcrumb
The breadcrumb is a simple navigation aid.
It contains information on where the current topic is located in the web hierarchy, and when and who created the topic.
All Foswiki topics are stored as text files on permanent storage. That storage is subdivided in a directory structure.
The top of the directory is referred to as _Foswiki_. Below the top are a number of _web_ directories.
And each of the _web_ directories can contain one or more _sub-webs_. Topics are organised in a parent child structure.
Each topic has at most one parent.
The breadcrumb presents the hierarchy from the Foswiki top, through the _web_, _sub-web_ directories,
through the paren child relationships to the topic being viewed.

You can inspect the directory structure in the terminal tab.
*   Try `tree -L 1 /var/www/foswiki | less`{{execute}}
*   And `tree -L 1 /var/www/foswiki/data | less`{{execute}}


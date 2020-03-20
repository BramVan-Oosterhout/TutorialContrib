## Toolbox
The toolbox provides access to create and maintain the topics.

### Create a new topic
The _Create new topic_ link will present a page to enter the new topic name and then proceed to create that topic.
You can define a _parent topic_ for the new topic and you can select a template. Templates are used to define the presentation of a topic.
Selecting _Default_ presents an empty topic and you can type the text as required. Foswiki has several editors.
Out of the box you will find the WYSIWYG editor which is excellent for writing and formatting text.
Once you have completed the entry, you press _Save_. The new topic is saved to disk and rendered as a regular Foswiki topic.
One of Foswiki's attractive features is that previous revisions of the text are stored as well,
provided the update is more than an hour after the current update. Or by a different user.
If you want to guarantee a new revision is created (and the old one saved),
you must select the _Force New revision_ checkbox before pressing _Save_.

### The Index
The _Index_ link navigates to the WebIndex page.
The WebIndex page lists all topics in the current web (the directory on disk that contains the currently displayed topic).
On installation the index has over 20 entries. These are pages used by Foswiki to support the operation of the web.

### The Search
The _Search_ link navigates to the WebSearch topic.
That topic has a number of tabs: Search, Advanced search, A-Z and Help.
And it supports a number of search options, including a regular expression search.
It is the "same" page that displayed the search results in response to an entry in the Search box.
On the Advanced Search tab you can select search options to make the search case sensitive and several options to decide how the search matches.
The default _keyword_ option does a string match, supports minus (as in -string) to exclude a string and quoted strings
(like "this string") to match strings including spaces. _word_ is similar, but includes word boundaries.
So _in_ as a keyword matches _string_, but as a word it does not. _literal_ matches the whole search entry,
including white space and ignores special characters like minus. Other options, like _regex_ and _query_ will be discussed later.

### The Changes
The _Changes_ link navigates to  the WebChanges topic. The topic presents the 50 most recently changed topics.

### The Notifications
The _Notifications_ link navigates to  the WebNotifications topic.
The topic contains the list of registered users that will be notified when a topic in the web has been modified.
If you want to subscribe, you add your registered user name as an entry in the bulleted list.
That name is a wiki word. Like: BramVanOosterhout.

### The RSS feed
The _RSS feed_ link navigates to the WebRss topic where you can subscribe to the feed.
%RED% I don't know how this works/what it does. %ENDCOLOR% The topic is presented differently, because....???
%ENDCOLOR%

### The Preferences
The _Preferences_ link navigates to the WebPreferences topic.
Preferences are values maintained by Foswiki, that control behaviour and appearance of the application.
Preferences are maintained in bullet points that start with the _Set_ keyword.
Preference values are defined in a hierarchy: Default, Site, User, Web, Sub-web, Topic
and the last definition of a preference in this hierarchy will be used at the time the preference variable is encountered.
Preferences are important for access control and help greatly in the maintenance of a site. More on preferences later. 

### The Webs list
Topics in a  Foswiki site are stored on disk in a directory structure.
Out of the box Foswiki has 4 directories: System, Main, Sandbox and Trash.
*   System contains the topics that define and document Foswiki behaviour.
*   Main contains the topics created and maintained by registered Foswiki users.
*   Sandbox contains topics where Foswiki users experiment with functions and navigation, without an intention to keep these topics on a permanent basis.
*   Trash contains the topics that have been deleted from any web.

Webs are an important concept in Foswiki and a building stone for Foswiki Applications.

Go back to the [Main.Webhome](https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/foswiki) page.


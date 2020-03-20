
Create a topic like: TestMacros in the Sandbox and experiment along with the text.

## Variables
Variables are defined by placing the following text in a topic:
_(three spaces) * (one space) Set (variable name) = the value allocated to the variable_.
The value of the variable can include TML, including other macros, as well as HTML. For example:
```
   * Set JoeBlog = [[Main.JoeBlog][Joe Blog]] (administrator)
```
defines the variable JoeBlog and when you write (%JoeBlog%) in the topic,
the text will translate to (Joe Blog (administrator)).
Variables can take any amount of content, like the results of a search.
But variables are limited in scope to the topic where they are defined.
Note that the variable definition is active, even in &lt;verbatim> ... &lt;/verbatim> tags.

Variables can be defined multiple times in the same topic. However, all definitions are expanded at the time the topic is read from the disk.
The last definition found will be the value available for use.

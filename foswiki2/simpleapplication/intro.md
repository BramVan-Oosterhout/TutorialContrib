## Requirements
The note pad application provides very simple functionality. You have an idea.

1.   That idea is captured with a title and a short description. 
1.   The ideas have two states. Either they are under consideration (Open) or they have been discarded (Closed). 
1.   You want to be able to add to the idea as you research or develop the idea with text, references and attachments
1.   You want to have a list of the ideas, All ideas, just the Open ones or just the Closed ones.

Knowing Foswiki, you know that for requirement 3, you will need a topic for each idea.
Requirement 2 needs the status information to be easily accessible and that is best achieved with a formfield.
Requirement 4 can be implemented with the SEARCH{ ... } macro. And the COMMENT{ ... } plugin macro seems convenient
to capture the idea.

Finally, once I have developed the application, I may want to have different notepads for ideas, recipes, book reviews.
And your family may want their own notepad for whatever thoughts they want to keep.
This requirement suggests that we need a way to implement the functionality separate from the data.
The wiki workbench supports just that as we will see.

This course uses the Wiki workbench. It has been installed in this course environment.




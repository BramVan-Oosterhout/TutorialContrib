### _SpreadsheetPlugin_
The Spreadsheet plugin provides the ability to perform arithmatic and some list manipulation in Foswiki.
The manipulation can be performed within a table, thereby providing spreadsheet functionality.
That can be useful in some applications. The plugin also provides for simple calculations through the _%CALCULATE{ ... }%_ macro.
For example, the following construct returns a very crude wordcount for the WebHome topic. In the _Sandbox.ExtensionsStep3_ topic try:

```
%CALCULATE{ "$COUNTSTR($SPLIT( $comma, %EXTRACT{ 
                                          topic="System.WebHome" 
                                          pattern="(\w+)" 
                                          format="$1"  
                                          separator=","
                                        }%),  )" }%
```{{copy}}

This example also illustrates how nested macros are evaluated: Left to right, inside out. 
1.   As Foswiki scans the statement it first evaluates _%EXTRACT{ ... }%_.
     The _%EXTRACT{ ... }%_ will be replaced by the text of the _WebHome_ topicsplit into words by the _(\w+)_ pattern.
2.   Next Foswiki finds the _}%_ associated with the _%CALCULATE{_ macro and passes the parameters
     _$COUNTSTR($SPLIT( $comma, WebHome&#95;word&#95;list),  )_ to the spreadsheet plugin
3.   The spreadsheet plugin parses the parameters and completes the _SPLIT_ of the WebHome&#95;topic&#95;text into individual list items separated by a comma.
     The _SPLIT_ is done using a comma ($comma) as the boundary between items.
4.   The resulting list is passed to _COUNTSTR_, which counts the items in the list since the last parameter (the string text to count) is not specified

A word of warning. Although this looks very much like a programming example, Foswiki is essentially a text processor.
If you omit the comma after _}%)_ the last parameter of COUNTSTR will be the last word returned by _EXTRACT_. Try:

```
%CALCULATE{ "$COUNTSTR($SPLIT( $comma, %EXTRACT{ 
                                          topic="System.WebHome" 
                                          pattern="(\w+)" 
                                          format="$1"  
                                          separator=","
                                        }%)  )" }%
```{{copy}}

_COUNTSTR_ now takes the last element in the list as the string to count and counts the occurrences of that string in the remainder of the list.
There are none!

There are other ways of using _EXTRACT_ to achieve the same result. The following maps all words to a single character and returns the length of the string.
```
%CALCULATE{ "$LENGTH( %EXTRACT{ 
                                          topic="System.WebHome" 
                                          pattern="(\w+)" 
                                          format="A"  
                      }%)" }%
```{{copy}}

As an exercise: Use _EXTRACT_ and _CALCULATE_ to count:
*   the number of characters in a topic
*   the number of non-blank characters ina topic
*   the number of lines in a topic

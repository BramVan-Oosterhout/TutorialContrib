## Macros
Macros are the core of Foswiki's functionality and extensibility.
They are syntactically like variables with parameters: _%<nop>MACRO{ parameter="value" ... }%_.
The MACRO name can be all capitals (common for Foswiki defined macros) or mixed case if you choose to define your own.
Their semantics are usually implemented in the internals of Foswiki or as extensions.
There are hundreds of macros available in Foswiki and this course will cover a variety of them.
The Foswiki documentation provides a full list in System.MacrosQuickReference.
Below are some brief examples to demonstrate their power.

### _SHOWPREFERENCE_
_%SHOWPREFERENCE%_ will list all defined preferences __and where they are defined__. You can try this in the Sandbox.TestMacros topic.
The macro takes one or more comma separated variable names to show. Try:
```
%SHOWPREFERENCE{ "ATTACHFILESIZELIMIT,SKIN,UNDEFINED" }%
```{{copy}}

### _DISPLAYTIME_
_%DISPLAYTIME{ "format specification" }%_ presents the current time in a requested format.
The default (_%DISPLAYTIME%_) expands to the current date and time.
The format can be changed using format qualifiers like: _$day, $year, $minute_.
Try:
```
%DISPLAYTIME{ "$year$mo$day$hour$minute: The $day'st day of $month in the year $year" }%
```{{copy}}

The _$formatqualifier_ token format is commonly used in macros to format the output.
The tokens available are provided in the documentation of the macro. Jump to Main.VarDISPLAYTIME.

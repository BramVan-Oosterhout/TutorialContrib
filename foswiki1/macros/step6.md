### _IF_
When rendering a page it is common that the rendering varies depending on the exact content of the page or the context in which the page is rendered.
The IF macro can do this. The syntax is: _IF{ "condition" then="then text" else="else text" }%_.
Copy all of the following to Sandbox.TestMacros to see some examples
```
<verbatim>
%STARTSECTION{ "ex3" }%
%IF{ "$theText='birthday'" then="%RED%" }%
The %IF{ "defined theText"
         then="%theText%"
         else="holiday" }% of %theName% is %IF{ "$theText='birthday'" 
                                                then="%theDate%"
                                                else="anytime" }%.
%IF{ "$theText='birthday'" then="%ENDCOLOR%" }%
%ENDSECTION{ "ex3" }%
</verbatim>
---++++ theText="birthday"
<verbatim>%INCLUDE{ "%TOPIC%" 
              section="ex3" 
              theText="birthday" 
              theName="Main.%USERNAME%" 
              theDate="7 December"
}%</verbatim>
is expanded to:
%INCLUDE{ "%TOPIC%" 
              section="ex3" 
              theText="birthday" 
              theName="Main.%USERNAME%" 
              theDate="7 December" }%

---++++ theText is undefined
<verbatim>%INCLUDE{ "%TOPIC%" 
             section="ex3" 
             theName="Main.%USERNAME%" 
             theDate="7 December" 
}%</verbatim>
becomes:
%INCLUDE{ "%TOPIC%" 
            section="ex3" 
            theName="Main.%USERNAME%" 
            theDate="7 December" }%
```

The syntax of the _condition_ in the IF macro is unusual in that it uses (dollar) $variablename to refer to the macro value,
rather than the usual %variablename%. Also note the use of single quotes around the comparison value.

Ex3 also demonstrates a convenient feature of the macro specification. All text from _%MACRO{_ to _}%_ is replaced by the substitution result.
There is no need to put all information on one line. As a consequence, the parameter list of the macro can be formatted for readability.
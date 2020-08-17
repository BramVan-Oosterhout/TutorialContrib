<!-- Scenario text goes here -->

There are many presentation and useability changes appropriate to the current for of the application. You can take the following suggestions and try your hand at implementing them. Solutions to these execises are provided in the answers.

#### 1. Refactor the `NoteViewTemplate` and base it on the `NoteWebHomeViewTemplate`
_Hint_: Use `NoteWebHomeViewTemplate` as the root for `NoteViewTemplate` and remove all common components from `NoteViewTemplate`. 

#### 2. Change the access control to allow all registered users to create and edit notes
_Hint_: Experiment in a deployed application. When satisfied, update `SeedWebPreferences`

#### 3. Add a _Home_ link to the top bar in the VIEW template, so you can navigate back to the home page
_Hint_: Update the `topbar` DEF template definition. Use the ICON macro.

#### 4. Add a _Preferences_ link, available only to users in the Admin group.
_Hint_:  Update the `topbar` DEF template definition. Use IF{ "context isadmin" ...}

#### 5. Restrict the COMMENT box to notes with status `Open` or when the user is in the Admin group
_Hint_: Update the `aftertext` DEF template. Refiew the [System.IfStatements](https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/System.IfStatements) carefully.

#### 6. Remove the Edit, etc. links for a `Closed` note
Show "You cannot change the content of a closed note." instead of the `Edit | Attach | Subscribe |` links if the note has status `Closed` unless the user is in the Admin group.

_Hint_: Create a separate template for `Open` and `Closed` notes. Add `section` the configuration of the AutoTemplatePlugin to Mode: `rules, section, exist, type`. And  place the logic to select the template in the `NoteForm` See the documentation for [System.AutoTemplatePlugin](https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/System.AutoTemplatePlugin), `mode=section`

These modifications are shown in the SolNotePadApp if you want to see an example.








### Answer
<!-- Solution text (if any) goes here -->
#### Exercise 1
See: `/tmp/answer step7`{{execute}}





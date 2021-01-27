Adjust configuration

Disable AutoViewTemplate:

`tools/configure -save -set {Plugins}{AutoViewTemplatePlugin}{Enabled}='0'`{{execute}}

Disable Solr plugin:

`tools/configure -save -set {Plugins}{SolrPlugin}{Enabled}='0'`{{execute}}

Reset the SKIN to the default:

`sed -i 's/Set SKIN/#Set SKIN/' data/Main/SitePreferences.txt `{{execute}}



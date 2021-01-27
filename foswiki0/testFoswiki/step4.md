When Foswiki starts for the first time, Foswiki will configure itself based on the environment it finds itself in.
This usually works well, but there are some essential items you must set the first time.
There are some additional configuration settings that ar essential in the Katacoda environment.

The bootstrap is a one off. It cannot be repeated without intervention.
If things are completely inoperable after the bootstrap, you can delete =/var/www/foswiki/lib/LocalSite.cfg= and start the bootstrap all over.

To start the bootstrap, open foswiki with: https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/foswiki
You will notice quite a few warning signs on the page. You can ignore most of these right now. Let's deal with the essentials first.

## Essential configurations

In order to proceed with the configuration, you must enable the AdminUser (Username: **admin**).
You do this by setting a password for this user in the configuration. Select **Security and Authentication** in the left margin
and go to the **Password** tab. Scroll down and set the **Internal Password {Password}** to a value you will remember.

## Katacoda environment essential configurations
Still in **Security and Authentication** select the **Sessions** tab, click **Expert Settings** at the bottom left and deselect
**Use IP Mapping {Sessions}{UseIPMatching}**. This is essential, because Katacoda makes requests with different IP addresses.

Save these two changes. Open the configured site with the link provided at the top of the configuration page.

You are presented with the Home page of the Main web. You are still logged in as **admin**

## Verify basic operation
Under Main web utilities click the <code>Registration</code> link.

You will be presented with the Registration page. Register
*   First name; Joe
*   Last Name: Admin
*   Your Wiki Name is recommended
*   Email address: email is not configured in this installation
*   Your password: Something you can remember
*   Confirm password: ditto
Click <code>Register</code> and your registration will be confirmed. Select the <code>JoeAdmin</code> link which takes you to your profile page.

Log out in the left margin. And log in as JoeAdmin. Then click the <code>Edit</code> button (top right).
Select the form tab, add some details and save. Your page is now updated.

We'll do some more configuration in the next step.

## If things go wrong
Delete the defined configuration: `rm /var/www/foswiki/lib/LocalSite.cfg`{{execute}}
and start over.

The  configuration settings above can be set from the command line with:
*   `cd /var/www/foswiki`{{execute}}
*   `tools/configure -save -noprompt`{{execute}}
*   `tools/configure -save -set {DefaultUrlHost}='http://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com'`{{execute}}
*   `tools/configure -save -set {Password}='password'`{{execute}}
*   `tools/configure -save -set {Sessions}{UseIPMatching}='0'`{{execute}}
*   `touch /var/www/foswiki/data/.htpasswd`{{execute}}
*   `chown www-data:www-data lib/LocalSite.cfg working/logs/configure.log /var/www/foswiki/data/.htpasswd`{{execute}}
Now you can verify the basic operation as described in the section above
starting with https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/foswiki.



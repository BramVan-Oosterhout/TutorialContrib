Let's revisit the configuration to verify the various warning can be ignored.
Each configuration setting is well documented. Here i will just go through the list and make a short comment.

Login admin and navigate to the configure page. System page in the Administrators section.

*   File system paths
   *   Safe PATH: {SafeEnvPath} - Inspect and set as appropriate
*   Security and Authentication / Access Control
   *   Access to Configure: {FeatureAccess}{Configure} - Add JoeAdmin (or your own wiki name)
*   Store
   *   Store Implementation: {Store}{Implementation} - This is a fresh installation. Take note if you plan to upgrade from an older Foswiki
*   Mail
   *   Mail is not available in this enviroment. Do not configure
*   Extensions / PlainFileStoreContrib
   *   {Extensions}{PlainFileStoreContrib}{CheckForRCS}: - Turn this off if you are not upgrading an older Foswiki
   
That finishes the configuration. You now have a working Foswiki installation

#!/bin/sh
curl -LJo SolutionWebs.tgz https://github.com/BramVan-Oosterhout/katacoda-scenarios/blob/master/foswiki/webs/assets/SolutionWebs.tgz?raw=true
cd /var/www/foswiki/data/Sandbox 
tar -xzf /root/SolutionWebs.tgz
chown www-data:www-data SolutionWebsStep3
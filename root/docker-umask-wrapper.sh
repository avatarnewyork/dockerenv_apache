#!/bin/bash
 
# This wrapper script overcomes the problem of docker-produced files in a shared-volume not being
# readable or writeable by the non-root user in the docker host.
 
# NB: you still need to separately ensure that the newly created files have the
# correct group permission. This can be achieved as follows:
## chmod g+s /srv/octopress-master/{public,config,_deploy,source/_posts}
 
# Ensures all newly created files will be 775, instead of the debian default of 755.
umask 002
 
eval "$@"
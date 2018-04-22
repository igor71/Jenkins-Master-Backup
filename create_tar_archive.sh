#! /bin/bash

# Create  jenkins archive file
# When needed to ignore only exit status 1 but to preserve the exit status if it is anything else add folowing: 
# || ( export ret=$?; [[ $ret -eq 1 ]] || exit "$ret" )
# suppress these warning message "tar...: file changed as we read it" by setting option --warning=no-file-changed 

tar cpzf jenkins_6.tgz /root/.jenkins --warning=no-file-changed --exclude="./workspace" || ( export ret=$?; [[ $ret -eq 1 ]] || exit "$ret" )

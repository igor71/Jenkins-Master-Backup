#! /bin/bash

# Create  jenkins archive

tar cpzf jenkins_6.tgz /root/.jenkins --warning=no-file-changed --exclude="./workspace" || ( export ret=$?; [[ $ret -eq 1 ]] || exit "$ret" )

#!/bin/bash

set -euo pipefail
buildNumber=`curl https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/buildNumber`
my_number=`curl https://api.github.com/repos/horizon86/spigotAutoBuild/releases/latest | jq -r '.tag_name'`

if [ -n "`echo ${my_number} | sed -n '/^[0-9][0-9]*$/p'`" ];then

    if [ $my_number -eq $buildNumber ];then
        exit 0
    fi
else
    curl -O https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
    java -jar -Xmx1024M BuildTools.jar
    echo -n $buildNumber > new_build.txt
fi

#!/bin/bash

arango_site="docs.spring.io"

#archives=("Spring_Framework_Reference2")



function struct {
#    echo "${1,,}"
#    echo "${1//_/ }"
    local location="${1}.docset/Contents/Resources/Documents/${arango_site}"
    find "${location}/" -mindepth 1 -exec rm -rf {} \; 2> /dev/null
    echo "writing docs to ${location}"
    mkdir -p "${location}"
    cp -R "${2}"/* "${location}"
    cp -R icons/* "${1}.docset"
    sed -e "s/PROJECT_NAME/${1,,}/g" -e "s/PROJECT_TITLE/${1//_/ }/" Info.plist > "${1}.docset/Contents/Info.plist"
}

function clean {
    rm -rf "${1}.docset"
}


clean $1
struct $1 $2

#val="$1"
#
#if [ -z "${val}" ]; then
#    proc
#elif [ "${val}" == "c" ]; then
#    clean
#  proc
#fi

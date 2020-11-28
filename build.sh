#!/bin/bash

archives=("Spring_Framework_Reference" "Spring_Security_Reference" "Spring_REST_Reference")

function build {
#    python spring_dash.py -t "${1}"
    tar -zcvf "${1}.tgz" "${1}.docset"
}

for archive in "${archives[@]}"
do
    if [ -f "${archive}" ]; then
        echo "removing file"
        rm "${archive}"
        build "${archive}"
    else
        build "${archive}"
    fi
done

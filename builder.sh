#!/bin/bash

archives=("Spring_Framework_Reference" "Spring_Security_Reference" "Spring_REST_Reference")

function build {
#    python spring_dash.py -t "${1}"
    tar -zcvf "${1}.tgz" "${1}.docset"
}

#for archive in "${archives[@]}"
#do
#    if [ -f "${archive}" ]; then
#        echo "removing file"
#        rm "${archive}"
#        build "${archive}"
#    else
#        build "${archive}"
#    fi
#done

for dir in *.docset/     # list directories in the form "/tmp/dirname/"
do
    dir=${dir%*/}      # remove the trailing "/"
    name=${dir%*.docset}
    archive="${name}.tgz"
    echo ${dir##*/}    # print everything after the final "/"
    if [ -f "${archive}" ]; then
        echo "removing file"
        rm "${archive}"
        build "${name}"
    else
        build "${name}"
    fi
done

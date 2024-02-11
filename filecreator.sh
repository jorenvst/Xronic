#!/bin/bash

# variables
declare -i continue=1
time="time"
dist="dist"
name="name"
line="name,dist,time"
training_name=""
csv=$(mktemp)

# set training name
echo ">> enter training name"
read -r training_name

# main loop
while ((continue)); do
    
    # read command from stdin and check for comma's
    read -r command
    while [[ "${command}" =~ , ]]; do

        >&2 echo ">> no comma's allowed"
        read -r command

    done

    # command add name
    if [[ "${command}" =~ ^n\ [a-zA-Z]+$ ]]; then

        name=$(cut -d' ' -f2 <<< "${command}")
        line=$(sed "s/name/${name}/" <<< "${line}")

    fi

    # command add dist, currently supported "fl|tt" (flying lap | time trial)
    if [[ "${command}" =~ ^d\ [0-9]+(fl|tt)$ ]]; then

        dist=$(cut -d' ' -f2 <<< "${command}")
        line=$(sed "s/dist/${dist}/" <<< "${line}")

    fi

    # command add time
    if [[ "${command}" =~ ^t\ [0-9]{1,}:[0-9]{2}\.[0-9]+$ ]]; then

        time=$(cut -d' ' -f2 <<< "${command}")
        line=$(sed "s/time/${time}/" <<< "${line}")

    fi

    # append changes to file
    if [[ "${command}" =~ ^c$ ]]; then

        echo ">> do you want to commit \"${line}\"? y/n"
        read -r resp

        if [[ "${resp}" =~ y ]]; then
            echo "${line}" >> "${csv}"
            echo ">> changes comitted"

        else
            echo ">> no changes comitted"
        fi
            time="time"
            dist="dist"
            name="name"
            line="name,dist,time"

    fi

    if [[ "${command}" =~ ^e$ ]]; then

        continue=0

    fi
done

cat "${csv}" > "${training_name}".csv
exit 0
#!/bin/bash
# Generates a JSON file specifically for use in populating an AWS DynamoDB Table
# Should be wrapped in the table name
# Arg 1 specifies the subnet label e.g. mgmt
# Arg 2 specifies the destination file

echo \[ >> $2

for i in {5..250..1}
    do
        if [[ $i -lt 250 ]]; then
            echo \{ \"SubnetName\": \"$1-$i\", \"SubnetType\": \"Management\", \"SubnetNumber\": \"192.168.$i.0\/24\", \"InUse\": false \}, >> $2
        fi
        if [[ $i -eq 250 ]]; then
            echo \{ \"SubnetName\": \"$1-$i\", \"SubnetType\": \"Management\", \"SubnetNumber\": \"192.168.$i.0\/24\", \"InUse\": false \} >> $2
        fi 
    done

echo \] >> $2

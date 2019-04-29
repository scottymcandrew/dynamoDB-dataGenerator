#!/bin/bash
# Generates a JSON file specifically for use in populating an AWS DynamoDB Table
# Should be wrapped in the table name
# Arg 1 specifies the subnet label e.g. mgmt
# Arg 2 specifies the destination file

echo \{ \"SubnetManager\": \[ >> $2

for i in {5..250..1}
    do
        if [[ $i -lt 250 ]]; then
            echo \{ \"PutRequest\": \{ \"Item\": \{ \"SubnetName\": \{ \"S\": \"$1-$i\" \}, \"SubnetType\": \{ \"S\": \"Management\" \}, \"SubnetNumber\": \{ \"S\": \"192.168.$i.0\/24\" \}, \"In Use\": \{ \"BOOL\": false \} \} \} \}, >> $2
        fi
        if [[ $i -eq 250 ]]; then
            echo \{ \"PutRequest\": \{ \"Item\": \{ \"SubnetName\": \{ \"S\": \"$1-$i\" \}, \"SubnetType\": \{ \"S\": \"Management\" \}, \"SubnetNumber\": \{ \"S\": \"192.168.$i.0\/24\" \}, \"In Use\": \{ \"BOOL\": false \} \} \} \} >> $2
        fi 
    done

echo \] \} >> $2

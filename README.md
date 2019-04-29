# dynamoDB-dataGenerator

This repository was created in response to my requirement of loading in a reasonably-large data set to Amazon DynamoDB. The data in question is a number of IP Subnets which I will use as a basic IPAM.

1. Firstly I needed to create a shell script to generate my JSON file into the format required by DynamoDB.
2. Next I needed to populate my DB with the JSON data in the form of: aws dynamodb batch-write-item --request-items file://subnets.json

json-generator.sh creates the JSON in the format required by AWS CLI. However I ran into an issue - the AWS CLI only supports adding up to 25 items at a time!

This lead me to find the Boto3 Python library to interact with DynamoDB: https://boto3.amazonaws.com/v1/documentation/api/latest/guide/dynamodb.html

dynamodb_batchWriteFromJson.py was created to take a JSON named subnets.json and write these values, one at a time, to my DB table named SubnetManager

The JSON format needed to be different, and so I created a new JSON generator json-generator-boto.sh

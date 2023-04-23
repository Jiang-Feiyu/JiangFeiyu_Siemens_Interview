#!/bin/bash

# Call the API and store the response in a variable
response=$(curl -s https://reqres.in/api/users)
# echo "$response"

# Extract the user object of George Edwards using jq
george=$(echo "$response" | jq '.data[] | select(.first_name == "George" and .last_name == "Bluth")')
echo $george

# Change the email locally using jq
george_with_new_email=$(echo "$george" | jq '.email = "edwards.george@reqres.in"')

# Store the updated George Edwards object to a file
echo "$george_with_new_email" | jq '.' > george_edwards.json

#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <firebase-auth-emulator-host> <email>"
    exit 1
fi

# Set variables
FIREBASE_AUTH_EMULATOR_HOST="$1"
EMAIL="$2"

# Get user by email to find localId
GET_USER_RESPONSE=$(curl -X POST \
  "http://$FIREBASE_AUTH_EMULATOR_HOST/identitytoolkit.googleapis.com/v1/accounts:lookup?key=fake-api-key" \
  -H 'Content-Type: application/json' \
  -d '{
   "idToken": "'"${ID_TOKEN}"'",
    "email": ["'"${EMAIL}"'"]
  }')

# echo "$GET_USER_RESPONSE" | jq -r '.users[0].localId'

# Extract localId using jq
LOCAL_ID=$(echo "$GET_USER_RESPONSE" | jq -r '.users[0].localId')

# Check if localId was found
if [ "$LOCAL_ID" == "null" ]; then
    echo "Error: User with email $EMAIL not found."
    exit 1
fi

# Delete user
DELETE_RESPONSE=$(curl -X POST \
  "http://$FIREBASE_AUTH_EMULATOR_HOST/identitytoolkit.googleapis.com/v1/accounts:delete?key=fake-api-key" \
  -H 'Content-Type: application/json' \
  -d '{
  "idToken": "'"${ID_TOKEN}"'",
    "localId": "'"${LOCAL_ID}"'"
  }')

# Debug: Print the response
echo "Delete User Response: $DELETE_RESPONSE"


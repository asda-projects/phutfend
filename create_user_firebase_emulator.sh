#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <firebase-auth-emulator-host>"
    exit 1
fi

# Set variables
FIREBASE_AUTH_EMULATOR_HOST="$1"
EMAIL="asasdeaguia10@gmail.com"
PASSWORD="123456"
CUSTOM_CLAIMS='{"role": "staff"}'

# Create user
RESPONSE=$(curl -X POST \
  "http://$FIREBASE_AUTH_EMULATOR_HOST/identitytoolkit.googleapis.com/v1/accounts:signUp?key=fake-api-key" \
  -H 'Content-Type: application/json' \
  -d '{
    "email": "'"${EMAIL}"'",
    "password": "'"${PASSWORD}"'",
    "returnSecureToken": true
  }')

# Debug: Print the response
# echo "Create User Response: $RESPONSE"

# Extract ID token and local ID using jq

ID_TOKEN=$(echo "$RESPONSE" | jq -r .idToken)
LOCAL_ID=$(echo "$RESPONSE" | jq -r .localId)

echo $RESPONSE
export ID_TOKEN
export LOCAL_ID

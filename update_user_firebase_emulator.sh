#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <firebase-auth-emulator-host>"
    exit 1
fi

# Set variables
FIREBASE_AUTH_EMULATOR_HOST="$1"
CUSTOM_CLAIMS='{"role": "staff"}'



if [ -z "$ID_TOKEN" ] || [ -z "$LOCAL_ID" ]; then
    echo "Failed to extract ID token and local ID."
    exit 1
fi

# Escape CUSTOM_CLAIMS for use in the curl request
ESCAPED_CUSTOM_CLAIMS=$(echo "$CUSTOM_CLAIMS" | jq -c .)

# Debug: Print the escaped custom claims
echo "Escaped Custom Claims: $ESCAPED_CUSTOM_CLAIMS"

# Set custom claims and email verification
UPDATE_RESPONSE=$(curl -X POST \
  "http://$FIREBASE_AUTH_EMULATOR_HOST/identitytoolkit.googleapis.com/v1/accounts:update?key=fake-api-key" \
  -H 'Content-Type: application/json' \
  -d '{
  "idToken": "'"${ID_TOKEN}"'",
    "localId": "'"${LOCAL_ID}"'",
    
    "emailVerified": true
  }')

# Debug: Print the response
echo "Update User Response: $UPDATE_RESPONSE"
#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <firebase-auth-emulator-host>"
    exit 1
fi

# Set variables
FIRESTORE_EMULATOR_HOST="$1"
PROJECT_ID='phut-322a4'
COLLECTION_NAME='users'
DOCUMENT_DATA='{
  "fields": {
    "role": { "stringValue": "staff" }
  }
}'



if [ -z "$ID_TOKEN" ] || [ -z "$LOCAL_ID" ]; then
    echo "Failed to extract ID token and local ID."
    exit 1
fi

# Make the curl request to update the document
RESPONSE=$(curl -X PATCH \
"http://$FIRESTORE_EMULATOR_HOST/v1/projects/$PROJECT_ID/databases/(default)/documents/$COLLECTION_NAME/$LOCAL_ID" \
-H "Content-Type: application/json" \
-d "$DOCUMENT_DATA")

echo $RESPONSE


: << "FIRESTORE KEY FIELDS FOR TYPE FIELD"

{

  // Union field value_type can be only one of the following:
  "nullValue": null,
  "booleanValue": boolean,
  "integerValue": string,
  "doubleValue": number,
  "timestampValue": string,
  "stringValue": string,
  "bytesValue": string,
  "referenceValue": string,
  "geoPointValue": {
    object (LatLng)
  },
  "arrayValue": {
    object (ArrayValue)
  },
  "mapValue": {
    object (MapValue)
  }
  // End of list of possible types for union field value_type.
}


Union field value_type. Must have a value set. value_type can be only one of the following:

* nullValue	
null
A null value.

* booleanValue	
boolean
A boolean value.

* integerValue	
string (int64 format)
An integer value.

* doubleValue	
number
A double value.

* timestampValue	
string (Timestamp format)
A timestamp value.
Precise only to microseconds. When stored, any additional precision is rounded down.
A timestamp in RFC3339 UTC "Zulu" format, with nanosecond resolution and up to nine fractional digits. Examples: "2014-10-02T15:01:23Z" and "2014-10-02T15:01:23.045123456Z".

* stringValue	
string
A string value.
The string, represented as UTF-8, must not exceed 1 MiB - 89 bytes. Only the first 1,500 bytes of the UTF-8 representation are considered by queries.

* bytesValue	
string (bytes format)
A bytes value.
Must not exceed 1 MiB - 89 bytes. Only the first 1,500 bytes are considered by queries.
A base64-encoded string.

* referenceValue	
string
A reference to a document. For example: projects/{project_id}/databases/{databaseId}/documents/{document_path}.

* geoPointValue	
object (LatLng)
A geo point value representing a point on the surface of Earth.

* arrayValue	
object (ArrayValue)
An array value.
Cannot directly contain another array value, though can contain an map which contains another array.

* mapValue	
object (MapValue)
A map value.
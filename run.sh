#!/bin/bash

# Path to the Flutter project
PROJECT_PATH="/Users/pong/Documents/Projects/phutfend/app"

# Check if the Flutter executable exists
if [ ! -x "$(command -v flutter)" ]; then
  echo "Error: Flutter is not installed or not in your PATH."
  exit 1
fi

# Navigate to the Flutter project directory
cd "$PROJECT_PATH" || { echo "Error: Project directory not found."; exit 1; }

# Run the Flutter application in debug mode
flutter run -d web-server --web-port=7000 --web-hostname=0.0.0.0 --debug


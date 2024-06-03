#!/bin/bash

# Check if the flutter directory exists, if not, clone the Flutter repository
if cd flutter; then
  git pull && cd .. ;
else
  git clone https://github.com/flutter/flutter.git;
fi

# List contents of the current directory
ls

# Run flutter doctor to check the environment
flutter/bin/flutter doctor

# Clean any previous builds
flutter/bin/flutter clean

# Enable web support for Flutter
flutter/bin/flutter config --enable-web

# Create an environment file if it doesn't exist
touch .env

# Get the Flutter packages
flutter/bin/flutter pub get

# Generate files with build_runner
flutter/bin/flutter pub run build_runner build --delete-conflicting-outputs

# Build the web project with the specified renderer
flutter/bin/flutter build web --web-renderer canvaskit --release

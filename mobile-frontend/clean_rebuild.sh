#!/usr/bin/env bash

# Check pubspec.yaml exists in this level
if [ ! -f "pubspec.yaml" ]; then
  exit 1
fi

# Remove build artifacts
rm -rf build .dart_tool android/build android/.gradle 2>/dev/null

flutter clean
flutter pub get

echo "Local clean complete"

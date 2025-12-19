#!/usr/bin/env bash
if [ ! -f "pubspec.yaml" ]; then
  echo "Run from Flutter project root"
  exit 1
fi

rm -rf build
rm -rf .dart_tool
rm -rf android/build
rm -rf android/.gradle

flutter clean
flutter pub get

echo "Local clean complete"

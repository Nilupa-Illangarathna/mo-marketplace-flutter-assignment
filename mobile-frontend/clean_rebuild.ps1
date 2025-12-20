if (!(Test-Path "pubspec.yaml")) {
  Write-Host "Run from Flutter project root"
  exit 1
}

Remove-Item -Recurse -Force build, .dart_tool, android/build, android/.gradle -ErrorAction SilentlyContinue

flutter clean
flutter pub get

Write-Host "Local clean complete"
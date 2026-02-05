#!/bin/bash

set -e

# Prepare APP_NAME, VERSION_NAME, VERSION_CODE
APP_NAME="ToDone"
VERSION_STRING=$(grep '^version:' pubspec.yaml | awk '{print $2}' | tr -d '\r')
VERSION_NAME=$(echo "$VERSION_STRING" | cut -d '+' -f1)  # Lấy phần version
VERSION_CODE=$(echo "$VERSION_STRING" | cut -d '+' -f2)  # Lấy phần build number
VERSION="v${VERSION_NAME}(${VERSION_CODE})"
APK_PATH="./build/output/${APP_NAME}_${VERSION}.apk"
echo "📦 Building $APP_NAME $VERSION"

# Create output directory
mkdir -p ./build/output

# Build Android
echo "🚀 Building Flutter app..."
# flutter build apk --flavor dev --dart-define=FLAVOR=dev --release
flutter build apk --release
echo "📂 Copying APK file..."
# cp ./build/app/outputs/flutter-apk/app-dev-release.apk build/output/
# mv ./build/output/app-dev-release.apk "$APK_PATH"
cp ./build/app/outputs/flutter-apk/app-release.apk build/output/
mv ./build/output/app-release.apk "$APK_PATH"
echo "✅ APK file renamed to ${APP_NAME}_${VERSION}.apk"

# Open output directory
open ./build/output

# Finish
echo "✅ Build done!"
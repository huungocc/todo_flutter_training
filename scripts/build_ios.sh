#!/bin/bash

set -e

# Prepare APP_NAME, VERSION_NAME, VERSION_CODE
APP_NAME="ToDone"
VERSION_STRING=$(grep '^version:' pubspec.yaml | awk '{print $2}' | tr -d '\r')
VERSION_NAME=$(echo "$VERSION_STRING" | cut -d '+' -f1)  # Lấy phần version
VERSION_CODE=$(echo "$VERSION_STRING" | cut -d '+' -f2)  # Lấy phần build number
VERSION="v${VERSION_NAME}(${VERSION_CODE})"
echo "📦 Building $APP_NAME $VERSION"

# Create output directory
mkdir -p ./build/output

# Build iOS
if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "---------------------------------"
    echo "🚀 Building Flutter app for iOS..."
    # flutter build ios --flavor dev --dart-define=FLAVOR=dev --release --no-codesign
    flutter build ios --release --no-codesign

    echo "📦 Archiving iOS app..."
    cd ios
    # xcodebuild -workspace Runner.xcworkspace -scheme dev -destination "generic/platform=iOS" -archivePath ../build/ios/archive/Runner.xcarchive archive
    xcodebuild -workspace Runner.xcworkspace -scheme Runner -destination "generic/platform=iOS" -archivePath ../build/ios/archive/Runner.xcarchive archive

    echo "📦 Exporting IPA..."
    xcodebuild -exportArchive -archivePath ../build/ios/archive/Runner.xcarchive \
               -exportOptionsPlist ExportOptions.plist \
               -exportPath ../build/output/
    cd ..

    # Rename IPA file
    IPA_PATH=$(find build/output -name "*.ipa" | head -n 1)
    if [[ -f "$IPA_PATH" ]]; then
        mv "$IPA_PATH" "./build/output/${APP_NAME}_${VERSION}.ipa"
        echo "✅ IPA file renamed to ${APP_NAME}_${VERSION}.ipa"
    fi
else
    echo "⚠️ Skipping iOS build because this is not macOS."
fi

# Open output directory
open ./build/output

# Finish
echo "✅ Build done!"

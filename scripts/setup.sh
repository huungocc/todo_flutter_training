#!/bin/bash

set -e

# Flutter pre-build
echo "🛠 Cleaning project..."
flutter clean
echo "📦 Getting dependencies..."
flutter pub get
echo "🧹 Removing old WASM modules..."
dart run pdfrx:remove_wasm_modules
echo "🌎 Generating localization files..."
flutter pub run intl_utils:generate
echo "🏗 Running build runner..."
flutter pub run build_runner build --delete-conflicting-outputs
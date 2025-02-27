#!/bin/zsh

# Find and delete files ending with .g.dart or .freezed.dart
find . -type f \( -name "*.g.dart" -o -name "*.freezed.dart" \) -exec rm -v {} +

echo "Deleted all *.g.dart and *.freezed.dart files."

flutter clean

flutter pub get

spider build

flutter pub run build_runner build --delete-conflicting-outputs

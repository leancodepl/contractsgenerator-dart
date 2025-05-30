#!/bin/sh

# needs protoc installed together with dart's protoc plugin (`dart pub global activate protoc_plugin`)

protoc -I=contractsgenerator --dart_out=lib/src/proto contractsgenerator/contracts.proto
dart format lib/src/proto/*.dart

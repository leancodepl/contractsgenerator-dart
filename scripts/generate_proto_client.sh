#!/bin/sh

protoc -I=contractsgenerator --dart_out=lib/src/proto contractsgenerator/contracts.proto
dart format lib/src/proto/*.dart

#!/bin/sh

protoc -I=lib/src/proto --dart_out=lib/src/proto lib/src/proto/types.proto
dart format lib/src/proto/*.dart

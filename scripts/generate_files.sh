#!/bin/sh

# needs protoc installed together with dart's protoc plugin (`dart pub global activate protoc_plugin`)

protoc -I=contractsgenerator --dart_out=lib/src/proto contractsgenerator/contracts.proto
dart format lib/src/proto/*.dart


echo "\
part of 'generator_script.dart';

const _\$script = r'''
`cat contractsgenerator/tools/generate.sh`
''';" > lib/src/generator_script.g.dart

#!/bin/sh

echo "\
part of 'generator_script.dart';

const _\$script = r'''
`cat contractsgenerator/tools/generate.sh`
''';" > lib/src/generator_script.g.dart

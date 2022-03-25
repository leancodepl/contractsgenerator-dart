import 'dart:convert';

import 'package:build/build.dart';

/// An implementation of [AssetWriter] that writes outputs to memory.
class MemoryAssetWriter implements AssetWriter {
  MemoryAssetWriter();

  final assets = <AssetId, List<int>>{};

  @override
  Future writeAsBytes(AssetId id, List<int> bytes) async {
    assets[id] = bytes;
  }

  @override
  Future writeAsString(
    AssetId id,
    String contents, {
    Encoding encoding = utf8,
  }) async {
    await writeAsBytes(id, encoding.encode(contents));
  }
}

import 'package:ferry/ferry.dart';
import 'package:ferry_hive_store/ferry_hive_store.dart';
import 'package:flutter_starter/common/domain/__generated__/schema.schema.gql.dart'
    show possibleTypesMap;
import 'package:hive/hive.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ferry_cache_provider.g.dart';

@Riverpod(keepAlive: true)
Future<Cache> ferryCache(FerryCacheRef ref) async {
  final box = await Hive.openBox("graphql");

  final store = HiveStore(box);

  return Cache(
    store: store,
    possibleTypes: possibleTypesMap,
  );
}

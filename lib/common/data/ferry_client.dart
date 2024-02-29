import 'package:ferry/ferry.dart';
import 'package:ferry_hive_store/ferry_hive_store.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter/common/domain/__generated__/schema.schema.gql.dart'
    show possibleTypesMap;
import 'package:flutter_starter/common/application/dio_provider.dart';
import 'package:flutter_starter/env.dart';
import 'package:gql_dio_link/gql_dio_link.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<Client> ferryClient(Ref ref) async {
  await Hive.initFlutter();

  final box = await Hive.openBox("graphql");

  final store = HiveStore(box);

  final cache = Cache(
    store: store,
    possibleTypes: possibleTypesMap,
  );

  final dio = ref.read(dioProvider);

  final link = Link.from([
    DioLink("/${Env.graphqlPath}", client: dio),
  ]);

  final client = Client(
    link: link,
    cache: cache,
    defaultFetchPolicies: {
      OperationType.query: FetchPolicy.CacheAndNetwork,
      OperationType.mutation: FetchPolicy.CacheAndNetwork,
    },
  );

  return client;
}

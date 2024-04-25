import 'package:ferry/ferry.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter/common/application/dio_provider.dart';
import 'package:flutter_starter/common/application/ferry_cache_provider.dart';
import 'package:flutter_starter/env.dart';
import 'package:gql_dio_link/gql_dio_link.dart';

Future<Client> ferryClient(Ref ref) async {
  final cache = await ref.read(ferryCacheProvider.future);

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

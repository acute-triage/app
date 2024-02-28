import 'package:dio/dio.dart';
import 'package:ferry/ferry.dart';
import 'package:ferry_hive_store/ferry_hive_store.dart';
import 'package:gql_dio_link/gql_dio_link.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_starter/__generated__/schema.schema.gql.dart'
    show possibleTypesMap;

Future<Client> initClient() async {
  await Hive.initFlutter();

  final box = await Hive.openBox("graphql");

  final store = HiveStore(box);

  final cache = Cache(store: store, possibleTypes: possibleTypesMap);

  final dio = Dio();
  final link = Link.from([
    DioLink("/graphql", client: dio),
  ]);

  final client = Client(
    link: link,
    cache: cache,
  );

  return client;
}

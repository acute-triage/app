import 'package:ferry/ferry.dart';
import 'package:flutter_starter/common/data/ferry_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ferry_provider.g.dart';

@Riverpod(keepAlive: true)
Future<Client> ferry(FerryRef ref) async {
  return ferryClient(ref);
}

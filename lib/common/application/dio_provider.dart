import 'package:dio/dio.dart';
import 'package:flutter_starter/common/data/dio_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio_provider.g.dart';

@Riverpod(keepAlive: true)
Dio dio(DioRef ref) {
  return dioClient(ref);
}

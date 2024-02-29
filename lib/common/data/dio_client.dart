import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio_http2_adapter/dio_http2_adapter.dart';
import 'package:flutter_starter/common/application/logger.dart';
import 'package:flutter_starter/common/data/dio_interceptors/network_request_delay_interceptor.dart';
import 'package:flutter_starter/env.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';

Dio dioClient(Ref ref) {
  final dio = Dio();

  if (Env.baseUrl != null) {
    dio.options.baseUrl = Env.baseUrl!;
  }

  dio.interceptors.addAll([
    if (Env.logNetworkRequests || Env.logFailedNetworkRequests)
      TalkerDioLogger(
        talker: talker,
        settings: TalkerDioLoggerSettings(
          printRequestHeaders: true,
          printResponseHeaders: true,
          printResponseMessage: true,
          requestFilter: (request) => Env.logNetworkRequests,
          responseFilter: (response) {
            if (Env.logNetworkRequests) {
              return true;
            }

            return response.statusCode == null || response.statusCode! >= 400;
          },
        ),
      ),
    networkRequestDelayInterceptor,
    // authTokenInterceptor(ref),
    // RequestLoggerInterceptor(),
    // requestHeadersInterceptor(ref),
    // RequestTimeInterceptor(),
  ]);

  const useHttp1 = Env.useHttp1;

  if (!useHttp1) {
    dio.httpClientAdapter = Http2Adapter(
      ConnectionManager(
        idleTimeout: const Duration(seconds: 10),
        onClientCreate: (_, config) {
          if (Env.proxyUrl != null) {
            config.proxy = Uri.parse(Env.proxyUrl!);
            config.onBadCertificate = (_) => true;
          }
        },
      ),
    );
  }

  return dio;
}

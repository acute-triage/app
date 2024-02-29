import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env', allowOptionalFields: true, requireEnvFile: true)
final class Env {
  @EnviedField(varName: 'API_BASE_URL', optional: true)
  static const String? baseUrl = _Env.baseUrl;

  @EnviedField(varName: 'GRAPHQL_PATH', optional: true)
  static const String? graphqlPath = _Env.graphqlPath;

  @EnviedField(varName: 'PROXY_URL', optional: true)
  static const String? proxyUrl = _Env.proxyUrl;

  @EnviedField(varName: 'USE_HTTP1', defaultValue: false)
  static const bool useHttp1 = _Env.useHttp1;

  /// The delay in milliseconds to simulate network requests
  /// You may also commas to separate multiple values to generate a random delay
  /// Example: 100,3000 will generate a random delay between 100 and 3000 milliseconds
  @EnviedField(varName: 'NETWORK_REQUEST_DELAY', optional: true)
  static const String? networkRequestDelay = _Env.networkRequestDelay;
}

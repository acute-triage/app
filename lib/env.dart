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
}

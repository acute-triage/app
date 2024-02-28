import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env', allowOptionalFields: true)
final class Env {
  @EnviedField(varName: 'PROXY_URL', optional: true)
  static const String? proxyUrl = _Env.proxyUrl;

  @EnviedField(varName: 'USE_HTTP1', defaultValue: false)
  static const bool useHttp1 = _Env.useHttp1;
}

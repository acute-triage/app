import 'package:auto_route/auto_route.dart';
import 'package:flutter_starter/config.dart';

import 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        if (Config.customSplashScreen)
          CustomRoute(
            page: SplashRoute.page,
            initial: true,
          ),
        CustomRoute(
          page: HomeRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          initial: !Config.customSplashScreen,
        ),
        AutoRoute(page: ContactCardRoute.page),
      ];
}

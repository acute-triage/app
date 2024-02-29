import 'package:auto_route/auto_route.dart';

import 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        // TODO: Add splash screen route
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(page: AllPokemonsRoute.page),
        AutoRoute(page: ViewPokemonRoute.page),
      ];
}

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:flutter_starter/common/presentation/screens/home_screen.dart'
    as _i2;
import 'package:flutter_starter/common/presentation/screens/splash_screen.dart'
    as _i3;
import 'package:flutter_starter/features/show/presentation/screens/all_shows_screen.dart'
    as _i1;
import 'package:flutter_starter/features/show/presentation/screens/view_show_screen.dart'
    as _i4;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    AllShowsRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AllShowsScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomeScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.SplashScreen(),
      );
    },
    ViewShowRoute.name: (routeData) {
      final args = routeData.argsAs<ViewShowRouteArgs>();
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.ViewShowScreen(
          key: args.key,
          id: args.id,
          title: args.title,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.AllShowsScreen]
class AllShowsRoute extends _i5.PageRouteInfo<void> {
  const AllShowsRoute({List<_i5.PageRouteInfo>? children})
      : super(
          AllShowsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AllShowsRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute({List<_i5.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i3.SplashScreen]
class SplashRoute extends _i5.PageRouteInfo<void> {
  const SplashRoute({List<_i5.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i4.ViewShowScreen]
class ViewShowRoute extends _i5.PageRouteInfo<ViewShowRouteArgs> {
  ViewShowRoute({
    _i6.Key? key,
    required String id,
    String? title,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          ViewShowRoute.name,
          args: ViewShowRouteArgs(
            key: key,
            id: id,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'ViewShowRoute';

  static const _i5.PageInfo<ViewShowRouteArgs> page =
      _i5.PageInfo<ViewShowRouteArgs>(name);
}

class ViewShowRouteArgs {
  const ViewShowRouteArgs({
    this.key,
    required this.id,
    this.title,
  });

  final _i6.Key? key;

  final String id;

  final String? title;

  @override
  String toString() {
    return 'ViewShowRouteArgs{key: $key, id: $id, title: $title}';
  }
}

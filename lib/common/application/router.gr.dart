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
import 'package:flutter_starter/features/pokemon/presentation/screens/all_pokemons_screen.dart'
    as _i1;
import 'package:flutter_starter/features/pokemon/presentation/screens/view_pokemon_screen.dart'
    as _i4;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    AllPokemonsRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AllPokemonsScreen(),
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
    ViewPokemonRoute.name: (routeData) {
      final args = routeData.argsAs<ViewPokemonRouteArgs>();
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.ViewPokemonScreen(
          key: args.key,
          id: args.id,
          pokemonName: args.pokemonName,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.AllPokemonsScreen]
class AllPokemonsRoute extends _i5.PageRouteInfo<void> {
  const AllPokemonsRoute({List<_i5.PageRouteInfo>? children})
      : super(
          AllPokemonsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AllPokemonsRoute';

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
/// [_i4.ViewPokemonScreen]
class ViewPokemonRoute extends _i5.PageRouteInfo<ViewPokemonRouteArgs> {
  ViewPokemonRoute({
    _i6.Key? key,
    required int id,
    String? pokemonName,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          ViewPokemonRoute.name,
          args: ViewPokemonRouteArgs(
            key: key,
            id: id,
            pokemonName: pokemonName,
          ),
          initialChildren: children,
        );

  static const String name = 'ViewPokemonRoute';

  static const _i5.PageInfo<ViewPokemonRouteArgs> page =
      _i5.PageInfo<ViewPokemonRouteArgs>(name);
}

class ViewPokemonRouteArgs {
  const ViewPokemonRouteArgs({
    this.key,
    required this.id,
    this.pokemonName,
  });

  final _i6.Key? key;

  final int id;

  final String? pokemonName;

  @override
  String toString() {
    return 'ViewPokemonRouteArgs{key: $key, id: $id, pokemonName: $pokemonName}';
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:flutter_starter/common/presentation/screens/home_screen.dart'
    as _i2;
import 'package:flutter_starter/features/pokemon/presentation/screens/all_pokemons_screen.dart'
    as _i1;
import 'package:flutter_starter/features/pokemon/presentation/screens/view_pokemon_screen.dart'
    as _i3;

abstract class $AppRouter extends _i4.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    AllPokemonsRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AllPokemonsScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomeScreen(),
      );
    },
    ViewPokemonRoute.name: (routeData) {
      final args = routeData.argsAs<ViewPokemonRouteArgs>();
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.ViewPokemonScreen(
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
class AllPokemonsRoute extends _i4.PageRouteInfo<void> {
  const AllPokemonsRoute({List<_i4.PageRouteInfo>? children})
      : super(
          AllPokemonsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AllPokemonsRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute({List<_i4.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i3.ViewPokemonScreen]
class ViewPokemonRoute extends _i4.PageRouteInfo<ViewPokemonRouteArgs> {
  ViewPokemonRoute({
    _i5.Key? key,
    required int id,
    String? pokemonName,
    List<_i4.PageRouteInfo>? children,
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

  static const _i4.PageInfo<ViewPokemonRouteArgs> page =
      _i4.PageInfo<ViewPokemonRouteArgs>(name);
}

class ViewPokemonRouteArgs {
  const ViewPokemonRouteArgs({
    this.key,
    required this.id,
    this.pokemonName,
  });

  final _i5.Key? key;

  final int id;

  final String? pokemonName;

  @override
  String toString() {
    return 'ViewPokemonRouteArgs{key: $key, id: $id, pokemonName: $pokemonName}';
  }
}

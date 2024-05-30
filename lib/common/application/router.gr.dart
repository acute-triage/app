// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;
import 'package:flutter_starter/common/presentation/screens/home_screen.dart'
    as _i4;
import 'package:flutter_starter/common/presentation/screens/splash_screen.dart'
    as _i6;
import 'package:flutter_starter/features/contact_card/domain/contact_reason_card.dart'
    as _i10;
import 'package:flutter_starter/features/contact_card/presentation/screens/contact_card_category_screen.dart'
    as _i2;
import 'package:flutter_starter/features/contact_card/presentation/screens/contact_card_screen.dart'
    as _i3;
import 'package:flutter_starter/features/show/presentation/screens/all_shows_screen.dart'
    as _i1;
import 'package:flutter_starter/features/show/presentation/screens/shows_by_genre_screen.dart'
    as _i5;
import 'package:flutter_starter/features/show/presentation/screens/view_show_screen.dart'
    as _i7;

abstract class $AppRouter extends _i8.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    AllShowsRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AllShowsScreen(),
      );
    },
    ContactCardCategoryRoute.name: (routeData) {
      final args = routeData.argsAs<ContactCardCategoryRouteArgs>();
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.ContactCardCategoryScreen(
          key: args.key,
          contactCard: args.contactCard,
        ),
      );
    },
    ContactCardRoute.name: (routeData) {
      final args = routeData.argsAs<ContactCardRouteArgs>();
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.ContactCardScreen(
          key: args.key,
          contactCard: args.contactCard,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.HomeScreen(),
      );
    },
    ShowsByGenreRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.ShowsByGenreScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.SplashScreen(),
      );
    },
    ViewShowRoute.name: (routeData) {
      final args = routeData.argsAs<ViewShowRouteArgs>();
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.ViewShowScreen(
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
class AllShowsRoute extends _i8.PageRouteInfo<void> {
  const AllShowsRoute({List<_i8.PageRouteInfo>? children})
      : super(
          AllShowsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AllShowsRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ContactCardCategoryScreen]
class ContactCardCategoryRoute
    extends _i8.PageRouteInfo<ContactCardCategoryRouteArgs> {
  ContactCardCategoryRoute({
    _i9.Key? key,
    required _i10.ContactReasonCard contactCard,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          ContactCardCategoryRoute.name,
          args: ContactCardCategoryRouteArgs(
            key: key,
            contactCard: contactCard,
          ),
          initialChildren: children,
        );

  static const String name = 'ContactCardCategoryRoute';

  static const _i8.PageInfo<ContactCardCategoryRouteArgs> page =
      _i8.PageInfo<ContactCardCategoryRouteArgs>(name);
}

class ContactCardCategoryRouteArgs {
  const ContactCardCategoryRouteArgs({
    this.key,
    required this.contactCard,
  });

  final _i9.Key? key;

  final _i10.ContactReasonCard contactCard;

  @override
  String toString() {
    return 'ContactCardCategoryRouteArgs{key: $key, contactCard: $contactCard}';
  }
}

/// generated route for
/// [_i3.ContactCardScreen]
class ContactCardRoute extends _i8.PageRouteInfo<ContactCardRouteArgs> {
  ContactCardRoute({
    _i9.Key? key,
    required _i10.ContactReasonCard contactCard,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          ContactCardRoute.name,
          args: ContactCardRouteArgs(
            key: key,
            contactCard: contactCard,
          ),
          initialChildren: children,
        );

  static const String name = 'ContactCardRoute';

  static const _i8.PageInfo<ContactCardRouteArgs> page =
      _i8.PageInfo<ContactCardRouteArgs>(name);
}

class ContactCardRouteArgs {
  const ContactCardRouteArgs({
    this.key,
    required this.contactCard,
  });

  final _i9.Key? key;

  final _i10.ContactReasonCard contactCard;

  @override
  String toString() {
    return 'ContactCardRouteArgs{key: $key, contactCard: $contactCard}';
  }
}

/// generated route for
/// [_i4.HomeScreen]
class HomeRoute extends _i8.PageRouteInfo<void> {
  const HomeRoute({List<_i8.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i5.ShowsByGenreScreen]
class ShowsByGenreRoute extends _i8.PageRouteInfo<void> {
  const ShowsByGenreRoute({List<_i8.PageRouteInfo>? children})
      : super(
          ShowsByGenreRoute.name,
          initialChildren: children,
        );

  static const String name = 'ShowsByGenreRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i6.SplashScreen]
class SplashRoute extends _i8.PageRouteInfo<void> {
  const SplashRoute({List<_i8.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i7.ViewShowScreen]
class ViewShowRoute extends _i8.PageRouteInfo<ViewShowRouteArgs> {
  ViewShowRoute({
    _i9.Key? key,
    required String id,
    String? title,
    List<_i8.PageRouteInfo>? children,
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

  static const _i8.PageInfo<ViewShowRouteArgs> page =
      _i8.PageInfo<ViewShowRouteArgs>(name);
}

class ViewShowRouteArgs {
  const ViewShowRouteArgs({
    this.key,
    required this.id,
    this.title,
  });

  final _i9.Key? key;

  final String id;

  final String? title;

  @override
  String toString() {
    return 'ViewShowRouteArgs{key: $key, id: $id, title: $title}';
  }
}

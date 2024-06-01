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
    as _i3;
import 'package:flutter_starter/common/presentation/screens/splash_screen.dart'
    as _i4;
import 'package:flutter_starter/features/contact_card/domain/contact_reason_card.dart'
    as _i7;
import 'package:flutter_starter/features/contact_card/presentation/screens/contact_card_category_screen.dart'
    as _i1;
import 'package:flutter_starter/features/contact_card/presentation/screens/contact_card_screen.dart'
    as _i2;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    ContactCardCategoryRoute.name: (routeData) {
      final args = routeData.argsAs<ContactCardCategoryRouteArgs>();
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.ContactCardCategoryScreen(
          key: args.key,
          contactCard: args.contactCard,
        ),
      );
    },
    ContactCardRoute.name: (routeData) {
      final args = routeData.argsAs<ContactCardRouteArgs>();
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.ContactCardScreen(
          key: args.key,
          contactCard: args.contactCard,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomeScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.ContactCardCategoryScreen]
class ContactCardCategoryRoute
    extends _i5.PageRouteInfo<ContactCardCategoryRouteArgs> {
  ContactCardCategoryRoute({
    _i6.Key? key,
    required _i7.ContactReasonCard contactCard,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          ContactCardCategoryRoute.name,
          args: ContactCardCategoryRouteArgs(
            key: key,
            contactCard: contactCard,
          ),
          initialChildren: children,
        );

  static const String name = 'ContactCardCategoryRoute';

  static const _i5.PageInfo<ContactCardCategoryRouteArgs> page =
      _i5.PageInfo<ContactCardCategoryRouteArgs>(name);
}

class ContactCardCategoryRouteArgs {
  const ContactCardCategoryRouteArgs({
    this.key,
    required this.contactCard,
  });

  final _i6.Key? key;

  final _i7.ContactReasonCard contactCard;

  @override
  String toString() {
    return 'ContactCardCategoryRouteArgs{key: $key, contactCard: $contactCard}';
  }
}

/// generated route for
/// [_i2.ContactCardScreen]
class ContactCardRoute extends _i5.PageRouteInfo<ContactCardRouteArgs> {
  ContactCardRoute({
    _i6.Key? key,
    required _i7.ContactReasonCard contactCard,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          ContactCardRoute.name,
          args: ContactCardRouteArgs(
            key: key,
            contactCard: contactCard,
          ),
          initialChildren: children,
        );

  static const String name = 'ContactCardRoute';

  static const _i5.PageInfo<ContactCardRouteArgs> page =
      _i5.PageInfo<ContactCardRouteArgs>(name);
}

class ContactCardRouteArgs {
  const ContactCardRouteArgs({
    this.key,
    required this.contactCard,
  });

  final _i6.Key? key;

  final _i7.ContactReasonCard contactCard;

  @override
  String toString() {
    return 'ContactCardRouteArgs{key: $key, contactCard: $contactCard}';
  }
}

/// generated route for
/// [_i3.HomeScreen]
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
/// [_i4.SplashScreen]
class SplashRoute extends _i5.PageRouteInfo<void> {
  const SplashRoute({List<_i5.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_starter/common/application/router.dart';
import 'package:flutter_starter/common/presentation/theme.dart';
import 'package:flutter_starter/i18n/strings.g.dart';
import 'package:flutter_web_frame/flutter_web_frame.dart';

class MainRootWidget extends StatelessWidget {
  MainRootWidget({super.key});

  final _appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FlutterWebFrame(
      maximumSize: const Size(390, 844),
      enabled: kIsWeb,
      backgroundColor: Colors.white,
      builder: (context) => MaterialApp.router(
        routerConfig: _appRouter.config(
          navigatorObservers: () => [
            // TalkerRouteObserver(talker),
          ],
        ),
        locale: TranslationProvider.of(context).flutterLocale, // use provider
        supportedLocales: AppLocaleUtils.supportedLocales,
        localizationsDelegates: GlobalMaterialLocalizations.delegates,
        title: t.app_name,
        theme: AppTheme.lightThemeData,
        darkTheme: AppTheme.darkThemeData,
        themeMode: ThemeMode.light,
        builder: (_, router) => Material(child: router!),
      ),
    );
  }
}

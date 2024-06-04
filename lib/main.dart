import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter/common/presentation/widgets/main_root_widget.dart';
import 'package:flutter_starter/config.dart';
import 'package:flutter_starter/firebase_options.dart';
import 'package:flutter_starter/i18n/strings.g.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // LocaleSettings.useDeviceLocale();
  LocaleSettings.setLocale(AppLocale.da);

  if (Config.customSplashScreen) {
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  }

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };

  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  runApp(
    TranslationProvider(
      child: ProviderScope(
        child: MainRootWidget(),
      ),
    ),
  );
}

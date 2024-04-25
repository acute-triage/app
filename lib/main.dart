import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter/common/presentation/widgets/main_root_widget.dart';
import 'package:flutter_starter/config.dart';
import 'package:flutter_starter/firebase_options.dart';
import 'package:flutter_starter/i18n/strings.g.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  LocaleSettings.useDeviceLocale();

  if (Config.customSplashScreen) {
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  }

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await Hive.initFlutter();

  runApp(
    TranslationProvider(
      child: ProviderScope(
        child: MainRootWidget(),
      ),
    ),
  );
}

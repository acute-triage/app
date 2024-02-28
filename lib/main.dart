import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter/common/presentation/main_root_widget.dart';
import 'package:flutter_starter/i18n/strings.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocaleSettings.useDeviceLocale();

  runApp(
    TranslationProvider(
      child: const ProviderScope(
        child: MainRootWidget(),
      ),
    ),
  );
}

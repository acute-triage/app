import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_starter/common/application/router.gr.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

///
/// This splash screen is used to display the app logo when the app is launched.
/// It is also used to perform any initial setup that is required before the app
/// can be used.
///
/// It may serve as a loading screen for the app, and can be used to
/// determine if the user is already logged in or not, and then redirect
/// the user to the appropriate screen.
///
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    FlutterNativeSplash.remove();

    Future.delayed(const Duration(seconds: 1), () {
      context.router.replace(const HomeRoute());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Placeholder(),
    );
  }
}

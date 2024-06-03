import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_starter/common/application/router.gr.dart';
import 'package:flutter_starter/config.dart';

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
class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final AnimationController _scaleController;
  late final Animation<double> _scaleAnimation;

  static const homeRoute = HomeRoute();

  static const debugging = false;

  @override
  void initState() {
    super.initState();

    FlutterNativeSplash.remove();

    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400), // Adjust duration as needed
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 20.0,
    ).animate(_scaleController);

    _controller = AnimationController(vsync: this);
    _controller.addListener(() {
      if (_controller.isCompleted) {
        _navigateAway();
      }
    });

    if (!Config.customSplashScreen && !debugging) {
      context.router.replace(homeRoute);
    }
  }

  _navigateAway() async {
    _scaleController.forward();

    await Future.delayed(const Duration(milliseconds: 50));

    if (mounted && !debugging) {
      context.router.replace(homeRoute);
    } else if (debugging) {
      // start over
      _controller.forward(from: 0.0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _scaleController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: AnimatedBuilder(
          animation: _scaleAnimation,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation.value,
              child: const SizedBox(),
            );
          }),
    );
  }
}

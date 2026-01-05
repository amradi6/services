import 'dart:async';

import 'package:flutter/material.dart';
import 'package:services/presentation/resources/assets_manager.dart';
import 'package:services/presentation/resources/color_manager.dart';
import 'package:services/presentation/resources/constant_manager.dart';
import 'package:services/presentation/resources/routes_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;

  void _goNext() =>
      Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);

  _startDelay() {
    _timer = Timer(Duration(seconds: AppConstant.splashDelay), () => _goNext());
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: Center(child: Image(image: AssetImage(ImageAssets.splashLogo))),
    );
  }
}

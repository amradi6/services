import 'package:flutter/material.dart';
import 'package:services/presentation/forgot_password/forgot_password_view.dart';
import 'package:services/presentation/login/view/login_view.dart';
import 'package:services/presentation/main/main_view.dart';
import 'package:services/presentation/onboarding/view/onboarding_view.dart';
import 'package:services/presentation/register/register_view.dart';
import 'package:services/presentation/splash/splash_view.dart';
import 'package:services/presentation/store_details/store_details_view.dart';

import 'strings_manager.dart';

class Routes {
  static const splashRoute = "/";

  static const onBoardingRoute="/onBoarding";

  static const loginRoute = "/login";

  static const registerRoute = "/register";

  static const forgotPasswordRoute = "/forgotPassword";

  static const mainRoute = "/main";

  static const storeDetailsRoute = "/storeDetails";
}

class RoutersGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const OnboardingView(),);
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordView());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const MainView());
      case Routes.storeDetailsRoute:
        return MaterialPageRoute(builder: (_) => const StoreDetailsView());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() => MaterialPageRoute(
    builder: (context) => Scaffold(
      appBar: AppBar(title: Text(AppStrings.noRouteFound)),
      body: Center(child: Text(AppStrings.noRouteFound)),
    ),
  );
}

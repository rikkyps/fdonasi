// ignore_for_file: dead_code, prefer_const_constructors

import 'package:flutter/material.dart';
import '../screen/pages/pages.dart';

class RouterApp {
  Route? onGenerateRouter(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => SplashPage());
        break;
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginPage());
        break;
      case '/register':
        return MaterialPageRoute(builder: (_) => RegisterPage());
        break;
      case '/home':
        return MaterialPageRoute(builder: (_) => MainPage());
        break;
      case '/campaign-detail':
        return MaterialPageRoute(builder: (_) => CampaginDetailPage());
        break;
      case '/donation':
        return MaterialPageRoute(builder: (_) => DonationPage());
        break;
      case '/payment':
        return MaterialPageRoute(builder: (_) => PaymentPage());
        break;
      case '/payment-method':
        return MaterialPageRoute(builder: (_) => PaymentMethodPage());
        break;
      case '/success':
        return MaterialPageRoute(builder: (_) => SuccessPage());
        break;
      default:
        return null;
    }
  }
}

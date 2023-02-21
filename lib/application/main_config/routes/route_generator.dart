part of 'route_import.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case RoutePath.initialRoute:
        return PageRouter.fadeScale(() => SignUpScreen());
      case RoutePath.setPasswordScreen:
        return PageRouter.fadeScale(() => SetPasswordScreen());
      case RoutePath.loginScreen:
        return PageRouter.fadeScale(() => LoginScreen());
        case RoutePath.verifyEmailScreen:
        return PageRouter.fadeScale(() => VerifyEmailScreen());
        case RoutePath.getUserDataScreen:
        return PageRouter.fadeScale(() => GetUserDataScreen());
      case RoutePath.signUpScreen:
        return PageRouter.fadeScale(() => SignUpScreen());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: Center(
          child: Container(
            color: Style.accentColor,
            child: const Text('Page Not Found'),
          ),
        ),
      );
    });
  }
}

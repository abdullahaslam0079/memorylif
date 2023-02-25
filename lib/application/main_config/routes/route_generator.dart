part of 'route_import.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case RoutePath.initialRoute:
        return PageRouter.fadeScale(() => GetStartedScreen());
      case RoutePath.signUpScreen:
        return PageRouter.fadeScale(() => SignUpScreen());
        case RoutePath.alreadyHaveAccount:
        return PageRouter.fadeScale(() => AlreadyHaveAccount());
        case RoutePath.getStartedScreen:
        return PageRouter.fadeScale(() => GetStartedScreen());
        case RoutePath.homeScreen:
        return PageRouter.fadeScale(() => HomeScreen());
        case RoutePath.dashboardScreen:
        return PageRouter.fadeScale(() => DashboardScreen());
        case RoutePath.textEditorScreen:
        return PageRouter.fadeScale(() => TextEditorScreen());
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

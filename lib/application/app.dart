import 'package:flutter/material.dart';
import 'package:memorylif/application/book_view_model.dart';
import 'package:memorylif/application/core/scroll_behavior.dart';
import 'package:memorylif/application/main_config/routes/route_path.dart';
import 'package:memorylif/constant/style.dart';
import 'package:memorylif/main.dart';
import 'package:memorylif/ui/base/base_mixin.dart';
import 'package:provider/provider.dart';
import 'app_view_model.dart';

class MemoryLifApp extends StatefulWidget {
  final SetRegisteredRoutes? route;

  const MemoryLifApp({Key? key, this.route}) : super(key: key);

  @override
  State<MemoryLifApp> createState() => MemoryLifAppState();
}

class MemoryLifAppState extends State<MemoryLifApp> with BaseMixin {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppViewModel()),
        ChangeNotifierProvider(create: (_) => BookViewModel()),
      ],
      child: MaterialApp(
        title: 'Mind Shift',
        builder: (context, child) => ScrollConfiguration(
          behavior: CustomScrollBehavior(),
          child: child!,
        ),
        initialRoute: RoutePath.initialRoute,
        onGenerateRoute: widget.route,
        debugShowCheckedModeBanner: false,
        navigatorKey: navigator.key(),
        color: Style.primaryColor,
        theme: ThemeData(
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                backgroundColor: Colors.transparent),
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            selectedRowColor: Colors.transparent,
            // colorScheme: const ColorScheme.light(
            //     background: Style.scaffoldBackground,
            //     secondary: Style.accentColor,
            //     primary: Style.primaryColor,
            //     brightness: Brightness.light)),
        // darkTheme: ThemeData(
        //     highlightColor: Colors.transparent,
        //     splashColor: Colors.transparent,
        //     selectedRowColor: Colors.transparent,
        //     colorScheme: const ColorScheme.dark(
        //         background: Style.scaffoldBackgroundDark,
        //         secondary: Style.accentColor,
        //         primary: Style.primaryColor,
        //         brightness: Brightness.dark),
        ),
      ),
    );
  }
}

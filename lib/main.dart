import 'package:mitiquiz/app/startup_navigator/startup_navigator.dart';
import 'package:mitiquiz/core/constants.dart' as constants;
import 'package:mitiquiz/injection_container.dart' as get_it;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await get_it.init();
  runApp(MitiquizApp());
}

class MitiquizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    return MaterialApp(
      title: constants.appName,
      theme: ThemeData(
        primaryColor: constants.colorPrimary,
        accentColor: constants.colorPrimary,
        cupertinoOverrideTheme: const CupertinoThemeData(brightness: Brightness.light),
      ),
      initialRoute: constants.startupNavigator,
      routes: {
        constants.startupNavigator: (context) => StartupNavigator(),
      },
    );
  }
}

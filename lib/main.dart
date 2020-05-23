import 'package:mitiquiz/app/dashboard/DashboardScreen.dart';
import 'package:mitiquiz/core/constants.dart';
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
      title: Constants.appName,
      theme: ThemeData(
        primaryColor: Constants.colorPrimary,
        accentColor: Constants.colorPrimary,
        cupertinoOverrideTheme: const CupertinoThemeData(brightness: Brightness.light),
      ),
      initialRoute: Constants.dashboardScreen,
      routes: {
        Constants.dashboardScreen: (context) => DashboardScreen(),
      },
    );
  }
}

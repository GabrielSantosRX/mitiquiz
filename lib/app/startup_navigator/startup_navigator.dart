import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mitiquiz/app/dashboard/dashboard_screen.dart';
import 'package:mitiquiz/core/constants.dart' as constants;

class StartupNavigator extends StatefulWidget {
  @override
  _StartupNavigatorState createState() => _StartupNavigatorState();
}

class _StartupNavigatorState extends State<StartupNavigator> {
  int _currentIndex;

  final _screens = <Widget>[
    const Center(child: Text('Account', style: TextStyle(fontSize: 22, color: Colors.white))),
    DashboardScreen(),
    const Center(child: Text('Rank', style: TextStyle(fontSize: 22, color: Colors.white))),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = 1;
  }

  void changePage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bottomMenuItens = <BubbleBottomBarItem>[
      buildBubbleBottomBarItem(
        'Sing in',
        iconData: Icons.account_box,
        primaryColor: constants.colorPrimary,
        secundaryColor: constants.colorRedVine,
        backgroundColor: constants.colorRedVine,
      ),
      buildBubbleBottomBarItem(
        'Quiz',
        iconData: Icons.playlist_add_check,
        primaryColor: constants.colorPrimary,
        secundaryColor: constants.colorRedVine,
        backgroundColor: constants.colorGrayLight,
      ),
      buildBubbleBottomBarItem(
        'Rank',
        iconData: Icons.equalizer,
        primaryColor: constants.colorPrimary,
        secundaryColor: constants.colorRedVine,
        backgroundColor: constants.colorRedVine,
      ),
    ];

    return Scaffold(
      backgroundColor: constants.colorGrayDark,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BubbleBottomBar(
        backgroundColor: Colors.transparent,
        hasNotch: false,
        hasInk: true,
        inkColor: Colors.white,
        opacity: .2,
        currentIndex: _currentIndex,
        onTap: changePage,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(16),
        ),
        elevation: 8,
        items: bottomMenuItens,
      ),
      body: _screens[_currentIndex],
    );
  }

  BubbleBottomBarItem buildBubbleBottomBarItem(
    String value, {
    IconData iconData,
    Color primaryColor,
    Color secundaryColor,
    Color backgroundColor,
  }) =>
      BubbleBottomBarItem(
          backgroundColor: backgroundColor,
          icon: Icon(
            iconData,
            color: secundaryColor,
          ),
          activeIcon: Icon(
            iconData,
            color: primaryColor,
          ),
          title: Text(
            value,
            style: const TextStyle(
              color: Colors.white,
            ),
          ));
}

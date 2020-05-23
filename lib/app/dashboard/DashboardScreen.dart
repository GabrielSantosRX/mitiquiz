import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mitiquiz/core/constants.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int currentIndex;
  @override
  void initState() {
    super.initState();
    currentIndex = 1;
  }

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bottomMenuItens = <BubbleBottomBarItem>[
      buildBubbleBottomBarItem(
        'Sing in',
        iconData: Icons.account_box,
        primaryColor: Constants.colorPrimary,
        secundaryColor: Constants.colorRedVine,
        backgroundColor: Constants.colorRedVine,
      ),
      buildBubbleBottomBarItem(
        'Quiz',
        iconData: Icons.playlist_add_check,
        primaryColor: Constants.colorPrimary,
        secundaryColor: Constants.colorRedVine,
        backgroundColor: Constants.colorGrayLight,
      ),
      buildBubbleBottomBarItem(
        'Rank',
        iconData: Icons.equalizer,
        primaryColor: Constants.colorPrimary,
        secundaryColor: Constants.colorRedVine,
        backgroundColor: Constants.colorRedVine,
      ),
    ];

    return Scaffold(
      backgroundColor: Constants.colorGrayDark,
      // appBar: AppBar(
      //   title: Text(Constants.appName),
      // ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: Icon(Icons.playlist_add_check),
      //   backgroundColor: Colors.red,
      // ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BubbleBottomBar(
        backgroundColor: Constants.colorGray,
        hasNotch: false,
        hasInk: true,
        inkColor: Colors.white,
        opacity: .2,
        currentIndex: currentIndex,
        onTap: changePage,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(16),
        ),
        elevation: 8,
        items: bottomMenuItens,
      ),
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

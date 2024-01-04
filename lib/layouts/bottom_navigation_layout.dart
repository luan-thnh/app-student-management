import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:student_management/constants/colors_theme.dart';
import 'package:student_management/constants/image_urls.dart';

class BottomNavigationLayout extends StatelessWidget {
  final int currentIndex;
  final Function(int)? onTapNavigatorBar;
  const BottomNavigationLayout({Key? key, required this.currentIndex, this.onTapNavigatorBar});

  @override
  Widget build(BuildContext context) {
    Size mq = MediaQuery.of(context).size;

    return Container(
      height: mq.height * 0.08,
      color: Colors.white,
      child: NavigationBar(
        onDestinationSelected: onTapNavigatorBar,
        indicatorColor: Colors.transparent,
        selectedIndex: currentIndex,
        backgroundColor: ColorsTheme.blue,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        destinations: <Widget>[
          NavigationDestination(
            selectedIcon: SvgPicture.asset(ImageUrls.homeIcon, color: ColorsTheme.yellow),
            icon: SvgPicture.asset(ImageUrls.homeIcon, color: ColorsTheme.white),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: SvgPicture.asset(ImageUrls.archiveIcon, color: ColorsTheme.yellow),
            icon: SvgPicture.asset(ImageUrls.archiveIcon, color: ColorsTheme.white),
            label: 'Archive',
          ),
          NavigationDestination(
            selectedIcon: SvgPicture.asset(ImageUrls.settingIcon, color: ColorsTheme.yellow),
            icon: SvgPicture.asset(ImageUrls.settingIcon, color: ColorsTheme.white),
            label: 'Setting',
          ),
          NavigationDestination(
            selectedIcon: SvgPicture.asset(ImageUrls.userIcon, color: ColorsTheme.yellow),
            icon: SvgPicture.asset(ImageUrls.userIcon, color: ColorsTheme.white),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

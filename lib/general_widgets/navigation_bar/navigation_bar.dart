import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'nav_bar_desktop.dart';
import 'nav_bar_mobile.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: const NavigationBarMobile(),
      tablet: const NavigationBarTabletDesktop(),
    );
  }
}

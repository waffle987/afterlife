import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../authentication/ui/sign_in_page.dart';
import '../../config/ui_helpers.dart';
import '../buttons/elongated_button.dart';
import 'nav_bar_logo.dart';

class NavigationBarTabletDesktop extends StatelessWidget {
  const NavigationBarTabletDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData _mediaQuery = MediaQuery.of(context);

    return SizedBox(
      height: 50.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const NavBarLogo(),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(width: _mediaQuery.size.width * 0.05),
              ElongatedButton(
                text: 'Sign In',
                onPressed: () => Get.to(() => const SignInPage()),
                buttonColour: kPrimaryColour,
                textColour: kSecondaryColour,
              ),
            ],
          )
        ],
      ),
    );
  }
}

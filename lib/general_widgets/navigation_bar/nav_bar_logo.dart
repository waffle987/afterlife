import 'package:flutter/material.dart';

import '../../config/assets.dart';

class NavBarLogo extends StatelessWidget {
  const NavBarLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData _mediaQuery = MediaQuery.of(context);

    return SizedBox(
      height: 100,
      width: 200,
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: Image.asset(Assets.logo).image,
          ),
          SizedBox(width: _mediaQuery.size.width * 0.01),
          const Text(
            "Afterlife",
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 20.0,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/ui_helpers.dart';
import '../../general_widgets/buttons/elongated_button.dart';
import '../../submit_complaint/ui/submit_complaint_page.dart';
import '../widgets/home_details.dart';

class DesktopHomePage extends StatelessWidget {
  const DesktopHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData _mediaQuery = MediaQuery.of(context);

    final Shader linearGradient = const LinearGradient(
      colors: <Color>[
        Colors.pinkAccent,
        Colors.pink,
      ],
    ).createShader(const Rect.fromLTWH(0.0, 0.0, 1000.0, 70.0));

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          SizedBox(height: _mediaQuery.size.height * 0.05),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: _mediaQuery.size.width * 0.05),
            child: const HomeDetails(),
          ),
          SizedBox(height: _mediaQuery.size.height * 0.05),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: _mediaQuery.size.width * 0.30),
            child: ElongatedButton(
              text: 'Submit a Complaint',
              onPressed: () => Get.to(() => const SubmitComplaintPage()),
              buttonColour: kPrimaryColour,
              textColour: kSecondaryColour,
            ),
          ),
          SizedBox(height: _mediaQuery.size.height * 0.05),
          Padding(
            padding:
                EdgeInsets.symmetric(vertical: _mediaQuery.size.height * 0.14),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                '© 2022 Afterlife. All rights reserved.',
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w300,
                  foreground: Paint()..shader = linearGradient,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

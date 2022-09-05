import 'package:flutter/material.dart';

import '../../authentication/controllers/auth_controller.dart';
import '../../config/assets.dart';
import '../../general_widgets/buttons/elongated_button.dart';
import '../../general_widgets/centred_view.dart';
import 'mediator_cases_feed.dart';

class MediatorHomePage extends StatelessWidget {
  const MediatorHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData _mediaQuery = MediaQuery.of(context);

    /// GetX Controllers
    final AuthController _authController = AuthController.to;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0.0,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: Image.asset(Assets.logo).image,
            ),
            SizedBox(width: _mediaQuery.size.width * 0.01),
            const Text(
              'Afterlife (Lawyer)',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(_mediaQuery.size.width * 0.005),
            child: ElongatedButton(
              text: "Sign Out",
              onPressed: () => _authController.signOut(),
              buttonColour: Colors.red,
              textColour: Colors.white,
            ),
          ),
        ],
      ),
      body: CenteredView(
        child: ListView(
          children: const [
            MediatorCasesFeed(),
          ],
        ),
      ),
    );
  }
}

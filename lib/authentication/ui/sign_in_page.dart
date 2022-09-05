import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/assets.dart';
import '../../config/ui_helpers.dart';
import '../../general_widgets/buttons/busy_button.dart';
import '../../general_widgets/centred_view.dart';
import '../../general_widgets/input_fields/input_field.dart';
import '../../general_widgets/text_link.dart';
import '../controllers/auth_controller.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData _mediaQuery = MediaQuery.of(context);

    /// GetX Controllers
    final AuthController _authController = AuthController.to;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: Image.asset(Assets.logo).image,
            ),
            SizedBox(width: _mediaQuery.size.width * 0.01),
            const Text(
              'Afterlife',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: kPrimaryColour,
      body: CenteredView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(350, 0, 350, 0),
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
                top: _mediaQuery.size.height * 0.0001,
                bottom: _mediaQuery.size.height * 0.0001),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(50, 30, 50, 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    verticalSpaceTiny,
                    const Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 35.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    verticalSpaceSmall,
                    Text(
                      'Sign in to continue',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black.withOpacity(0.8),
                      ),
                    ),
                    verticalSpaceLarge,
                    InputField(
                      placeholder: 'Email',
                      controller: _authController.emailTextController,
                    ),
                    verticalSpaceSmall,
                    InputField(
                      placeholder: 'Password',
                      password: true,
                      controller: _authController.passwordTextController,
                    ),
                    verticalSpaceMedium,
                    BusyButton(
                      title: 'Sign in',
                      busy: false,
                      onTap: () =>
                          _authController.signInWithEmailAndPassword(context),
                      color: kPrimaryColour,
                    ),
                    verticalSpaceMedium,
                    verticalSpaceSmall,
                    TextLink(
                      text: 'Forgot password?',
                      onPressed: () => Get.to(() => Scaffold()),
                      color: kcMediumGreyColour,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

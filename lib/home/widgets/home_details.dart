import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../config/assets.dart';

class HomeDetails extends StatelessWidget {
  const HomeDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData _mediaQuery = MediaQuery.of(context);

    return ResponsiveBuilder(builder: (context, sizingInformation) {
      var textAlignment =
          sizingInformation.deviceScreenType == DeviceScreenType.desktop
              ? TextAlign.left
              : TextAlign.left;

      double titleSize =
          sizingInformation.deviceScreenType == DeviceScreenType.mobile
              ? 50
              : 80;
      double descriptionSize =
          sizingInformation.deviceScreenType == DeviceScreenType.mobile
              ? 16
              : 21;
      return SizedBox(
        width: 600.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: Image.asset(Assets.logo).image,
                  radius: _mediaQuery.size.height * 0.10,
                ),
                SizedBox(width: _mediaQuery.size.width * 0.03),
                Text(
                  'Resolve\nDisputes',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    height: 0.9,
                    fontSize: titleSize,
                  ),
                  textAlign: textAlignment,
                ),
              ],
            ),
            SizedBox(height: _mediaQuery.size.height * 0.05),
            Text(
              'Have a contentious probate matter that you want to resolve? '
              'Use this website to send your case to a lawyer so they can help you!',
              style: TextStyle(
                fontSize: descriptionSize,
                fontWeight: FontWeight.w300,
                height: 1.7,
              ),
              textAlign: textAlignment,
            )
          ],
        ),
      );
    });
  }
}

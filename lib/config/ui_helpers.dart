import 'package:flutter/material.dart';

/// Colour theme
const Color kPrimaryColour = Color(0xFFF6BCBB);
const Color kSecondaryColour = Colors.white;

/// Dimensions and heights
const Widget horizontalSpaceTiny = SizedBox(width: 5.0);
const Widget horizontalSpaceSmall = SizedBox(width: 10.0);
const Widget horizontalSpaceMedium = SizedBox(width: 25.0);

const Widget verticalSpaceTiny = SizedBox(height: 5.0);
const Widget verticalSpaceSmall = SizedBox(height: 10.0);
const Widget verticalSpaceMedium = SizedBox(height: 25.0);
const Widget verticalSpaceLarge = SizedBox(height: 50.0);
const Widget verticalSpaceMassive = SizedBox(height: 120.0);

Widget verticalSpace(double height) => SizedBox(height: height);

double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

double screenHeightFraction(BuildContext context,
        {int dividedBy = 1, double offsetBy = 0}) =>
    (screenHeight(context) - offsetBy) / dividedBy;

double screenWidthFraction(BuildContext context,
        {int dividedBy = 1, double offsetBy = 0}) =>
    (screenWidth(context) - offsetBy) / dividedBy;

double halfScreenWidth(BuildContext context) =>
    screenWidthFraction(context, dividedBy: 2);

double thirdScreenWidth(BuildContext context) =>
    screenWidthFraction(context, dividedBy: 3);

const double fieldHeight = 55;
const double smallFieldHeight = 40;
const double inputFieldBottomMargin = 30;
const double inputFieldSmallBottomMargin = 0;
const EdgeInsets fieldPadding = EdgeInsets.symmetric(horizontal: 15);
const EdgeInsets largeFieldPadding =
    EdgeInsets.symmetric(horizontal: 15, vertical: 15);

/// Box Decorations
BoxDecoration fieldDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(5), color: Colors.grey[200]);

BoxDecoration disabledFieldDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(5), color: Colors.grey[100]);

/// Colors
const Color kcMediumGreyColour = Color(0xff868686);
const Color kcLightGreyColour = Color(0xffe5e5e5);
const Color kcVeryLightGreyColour = Color(0xfff2f2f2);

/// Text Styles
const TextStyle bodyStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w400,
);

/// Input Decorations
const kTextFieldInputDecoration = InputDecoration(
  hintText: 'Enter a value',
  contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.black,
      width: 1.0,
    ),
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.black,
      width: 2.0,
    ),
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
  ),
);

import 'package:flutter/material.dart';

import '../../config/ui_helpers.dart';

class CustomTextFormField extends StatelessWidget {
  final String header;
  final String hintText;
  final TextEditingController textEditingController;
  final TextInputType textInputType;
  final Widget? iconWithSizedBox;

  const CustomTextFormField({
    Key? key,
    required this.header,
    required this.hintText,
    required this.textEditingController,
    required this.textInputType,
    this.iconWithSizedBox,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            iconWithSizedBox == null ? Container() : iconWithSizedBox!,
            Text(
              header,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
          ],
        ),
        const SizedBox(height: 15.0),
        Container(
          child: TextFormField(
            controller: textEditingController,
            keyboardType: textInputType,
            maxLines: null,
            decoration: kTextFieldInputDecoration.copyWith(
              hintText: hintText == '' ? 'Type here...' : hintText,
            ),
          ),
        ),
      ],
    );
  }
}

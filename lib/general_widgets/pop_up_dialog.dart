import 'package:flutter/material.dart';

Widget popUpDialog({
  required BuildContext dialogContext,
  required Function() function,
  required String description,
  required String noColourButtonText,
  required String colourButtonText,
  required Color buttonColour,
  required Widget icon,
  required Color circularImageColour,
}) {
  return Dialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16.0),
    ),
    elevation: 0.0,
    backgroundColor: Colors.transparent,
    child: _dialogContent(
      dialogContext: dialogContext,
      icon: icon,
      description: description,
      function: function,
      noColourButtonText: noColourButtonText,
      colourButtonText: colourButtonText,
      buttonColour: buttonColour,
      circularImageColour: circularImageColour,
    ),
  );
}

Widget _dialogContent({
  required BuildContext dialogContext,
  required Function() function,
  required String description,
  required String noColourButtonText,
  required String colourButtonText,
  required Color buttonColour,
  required Widget icon,
  required Color circularImageColour,
}) {
  return Stack(
    children: <Widget>[
      _popUpCard(
        dialogContext: dialogContext,
        description: description,
        function: function,
        noColourButtonText: noColourButtonText,
        colourButtonText: colourButtonText,
        buttonColour: buttonColour,
      ),
      Positioned(
        left: 16.0,
        right: 16.0,
        child: CircleAvatar(
          backgroundColor: circularImageColour,
          child: icon,
          radius: 66.0,
        ),
      ),
    ],
  );
}

Widget _popUpCard({
  required BuildContext dialogContext,
  required Function() function,
  required String description,
  required String noColourButtonText,
  required String colourButtonText,
  required Color buttonColour,
}) {
  return Container(
    padding: const EdgeInsets.only(
      top: 66.0 + 16.0,
      bottom: 16.0,
      left: 16.0,
      right: 16.0,
    ),
    margin: const EdgeInsets.only(top: 66.0),
    decoration: BoxDecoration(
      color: Colors.white,
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.circular(16.0),
      boxShadow: const [
        BoxShadow(
          color: Colors.black26,
          blurRadius: 10.0,
          offset: Offset(
            0.0,
            10.0,
          ),
        ),
      ],
    ),
    child: ListView(
      shrinkWrap: true,
      children: <Widget>[
        Text(
          description,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 24.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Align(
              alignment: Alignment.bottomLeft,
              child: TextButton(
                onPressed: () => Navigator.pop(dialogContext),
                child: Text(
                  noColourButtonText,
                  style: const TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                onTap: function,
                child: Card(
                  color: buttonColour,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 15.0),
                    child: Text(
                      colourButtonText,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

import 'package:flutter/material.dart';

Container circularProgressIndicator({required BuildContext context}) {
  return Container(
    alignment: Alignment.center,
    padding: const EdgeInsets.only(top: 10.0),
    child: const CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(Colors.lightBlueAccent),
    ),
  );
}

linearProgressIndicator({required BuildContext context}) {
  return Container(
    padding: const EdgeInsets.only(bottom: 10.0),
    child: LinearProgressIndicator(
      valueColor: AlwaysStoppedAnimation(Theme.of(context).primaryColor),
    ),
  );
}

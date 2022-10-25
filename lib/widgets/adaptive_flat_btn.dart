import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveFlatBtn extends StatelessWidget {
  final String text;
  final VoidCallback handler;
  AdaptiveFlatBtn(this.text, this.handler);


  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            child: Text(text,
                style: TextStyle(fontWeight: FontWeight.bold)),
            onPressed: handler)
        : TextButton(
            onPressed: handler,
            child: Text(
              text,
              style: TextStyle(fontWeight: FontWeight.bold),
            ));
  }
}

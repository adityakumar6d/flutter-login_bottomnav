import 'package:flutter/material.dart';
import 'choices.dart';

class SelectCard extends StatelessWidget {
  late final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle? textStyle = Theme.of(context).textTheme.headline1;
    return Card(
        color: Colors.orange,
        child: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                    child: Icon(choice.icon, size: 50.0, color: Colors.blue)),
                Text(choice.title, style: textStyle),
              ]),
        ));
  }
}

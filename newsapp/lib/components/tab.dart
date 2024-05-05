import 'package:flutter/material.dart';

class Tabwidget extends StatelessWidget {
  final String inserText;
  final IconData insertIcon;

  const Tabwidget(
      {super.key, required this.inserText, required this.insertIcon});

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(insertIcon),
          const SizedBox(
            width: 10,
          ),
          Text(inserText),
        ],
      ),
    );
  }
}

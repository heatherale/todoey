import 'package:flutter/material.dart';

class RoundedContainer extends StatelessWidget {

  final Widget child;

  RoundedContainer({this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.0),
    topRight: Radius.circular(20.0)
        )
        ),
      child: this.child,
    );
  }
}

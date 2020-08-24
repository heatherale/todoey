import 'package:flutter/material.dart';

class ListButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: IconButton(
          icon: Icon(Icons.format_list_bulleted),
          iconSize: 50.0,
          color: Colors.lightBlueAccent,
          onPressed: (){},
        ),
      ),
    );
  }
}

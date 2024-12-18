import 'package:flutter/material.dart';

class SocialLinks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(Icons.code),
          color: Colors.white,
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.email),
          color: Colors.white,
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.link),
          color: Colors.white,
          onPressed: () {},
        ),
      ],
    );
  }
}

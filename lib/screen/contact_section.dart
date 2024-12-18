import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Bọc trong Scaffold
      appBar: AppBar(
        title: Text('Contact Section'),
        leading: IconButton(
          // Thêm nút back tùy chỉnh
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Quay lại trang trước đó
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Contact Me',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Text('Email: your.email@example.com'),
            Text('Phone: +123456789'),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    icon: FaIcon(FontAwesomeIcons.facebook), onPressed: () {}),
                IconButton(
                    icon: FaIcon(FontAwesomeIcons.linkedin), onPressed: () {}),
                IconButton(
                    icon: FaIcon(FontAwesomeIcons.github), onPressed: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

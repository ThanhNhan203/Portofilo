import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  // Các URL để chuyển hướng
  final String facebookUrl = 'https://www.facebook.com/thanhaan203/';
  final String linkedinUrl = 'https://www.linkedin.com/';
  final String githubUrl = 'https://github.com/ThanhNhan203';

  // Hàm để mở trình duyệt với liên kết
  Future<void> _openLink(BuildContext context, String url) async {
    if (await canLaunch(url)) {
      await launch(url); // Mở liên kết trong trình duyệt mặc định
    } else {
      throw 'Không thể mở liên kết: $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Section'),
        backgroundColor: Colors.deepPurple, // Thay đổi màu AppBar
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Quay lại trang trước đó
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/anhnen.png'), // Ảnh nền
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Ảnh đại diện
              CircleAvatar(
                radius: 60, // Kích thước ảnh đại diện
                backgroundImage:
                    AssetImage('assets/profile_picture.png'), // Ảnh đại diện
              ),
              SizedBox(height: 20),
              Text(
                'Contact Me',
                style: TextStyle(
                  fontSize: 32, // Tăng kích thước chữ
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Màu chữ đen
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Email: thanhnhaan203@gmail.com',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              Text(
                'Phone: 0368384742',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon:
                        FaIcon(FontAwesomeIcons.facebook, color: Colors.white),
                    onPressed: () => _openLink(context, facebookUrl),
                  ),
                  // IconButton(
                  //   icon:
                  //       FaIcon(FontAwesomeIcons.linkedin, color: Colors.black),
                  //   onPressed: () => _openLink(context, linkedinUrl),
                  // ),
                  IconButton(
                    icon: FaIcon(FontAwesomeIcons.github, color: Colors.white),
                    onPressed: () => _openLink(context, githubUrl),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

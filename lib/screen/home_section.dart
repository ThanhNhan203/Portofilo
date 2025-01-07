import 'package:flutter/material.dart';
import 'package:portofio/EffectandIcons/social_links.dart';
import 'package:portofio/EffectandIcons/ParticleScreen.dart';
import 'package:portofio/screen/Blog/blog_section.dart';
import 'package:portofio/screen/contact_section.dart';
import 'package:portofio/screen/experience_section.dart';

class HomeSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Nền particle
          ParticleScreen(),

          // Nội dung chính
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Ảnh đại diện
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/profile_picture.png'),
                ),
                SizedBox(height: 20),
                // Tên
                Text(
                  'Nguyễn Thành Nhân',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Mô tả ngắn
                Text(
                  'Studying at Ho Chi Minh City University of Technology',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 20),
                // Liên kết mạng xã hội
                SocialLinks(),
              ],
            ),
          ),

          // AppBar với nút điều hướng
          Positioned(
            top: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeSection(),
                      ),
                    );
                  },
                  child: Text('HOME', style: TextStyle(color: Colors.white)),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ExperienceSection(),
                      ),
                    );
                  },
                  child:
                      Text('EXPERIENCE', style: TextStyle(color: Colors.white)),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BlogSection(),
                      ),
                    );
                  },
                  child: Text('BLOG', style: TextStyle(color: Colors.white)),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ContactSection(),
                      ),
                    );
                  },
                  child: Text('CONTACT', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class BlogDetailScreen extends StatelessWidget {
  final Map<String, dynamic> blog;

  BlogDetailScreen({required this.blog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          blog['title'],
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Row(
        children: [
          // Bên trái: danh sách chủ đề blog
          Container(
            width: 200,
            padding: const EdgeInsets.all(16.0),
            color: Colors.grey[200],
            child: ListView(
              children: [
                ListTile(
                  title: Text('Chủ đề 1'),
                  onTap: () {
                    // Tạo hành động khi chọn chủ đề
                  },
                ),
                ListTile(
                  title: Text('Chủ đề 2'),
                  onTap: () {
                    // Tạo hành động khi chọn chủ đề
                  },
                ),
                ListTile(
                  title: Text('Chủ đề 3'),
                  onTap: () {
                    // Tạo hành động khi chọn chủ đề
                  },
                ),
                // Thêm các chủ đề khác nếu cần
              ],
            ),
          ),

          // Bên phải: chi tiết bài viết blog
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Tiêu đề bài viết
                  Text(
                    blog['title'],
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 8),

                  // Ngày tháng
                  Text(
                    blog['date'],
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                  Divider(
                    color: Colors.grey[300],
                    thickness: 1,
                    height: 24,
                  ),

                  // Nội dung bài viết
                  Text(
                    blog['content'],
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.6,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

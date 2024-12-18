import 'package:flutter/material.dart';

class BlogSection extends StatelessWidget {
  final List<Map<String, String>> blogs = [
    {
      'title': 'Blog Post 1',
      'description': 'A short description of blog post 1.'
    },
    {
      'title': 'Blog Post 2',
      'description': 'A short description of blog post 2.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Bọc trong Scaffold
      appBar: AppBar(
        title: Text('Blog Section'),
        leading: IconButton(
          // Thêm nút back tùy chỉnh
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Quay lại trang trước đó
          },
        ),
      ),
      body: ListView.builder(
        itemCount: blogs.length,
        itemBuilder: (context, index) {
          final blog = blogs[index];
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Text(blog['title']!),
              subtitle: Text(blog['description']!),
            ),
          );
        },
      ),
    );
  }
}

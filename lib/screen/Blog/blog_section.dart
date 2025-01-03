import 'package:flutter/material.dart';
import 'package:portofio/screen/Blog/blog_listscreen.dart';

class BlogSection extends StatelessWidget {
  final List<String> categories = ["Java", "JavaScript"]; // Các danh mục

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Blog Categories"),
        backgroundColor: Colors.deepPurple, // Màu sắc AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Khoảng cách giữa các phần tử
        child: ListView.builder(
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4, // Độ bóng của Card
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12), // Bo tròn góc
              ),
              margin: EdgeInsets.symmetric(
                  vertical: 8), // Khoảng cách giữa các Card
              child: ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                title: Text(
                  categories[index],
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600, // Kiểu chữ đậm vừa phải
                    color: Colors.deepPurple, // Màu sắc cho tiêu đề
                  ),
                ),
                trailing: Icon(Icons.arrow_forward, color: Colors.deepPurple),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          BlogListScreen(category: categories[index]),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:portofio/screen/Blog/blog_listscreen.dart';

class BlogSection extends StatelessWidget {
  final List<String> categories = ["Java", "JavaScript"]; // Các danh mục

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Blog Categories"),
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(categories[index],
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      BlogListScreen(category: categories[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

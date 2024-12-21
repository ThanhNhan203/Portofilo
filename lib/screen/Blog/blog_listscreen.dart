import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class BlogListScreen extends StatefulWidget {
  final String category;

  BlogListScreen({required this.category});

  @override
  _BlogListScreenState createState() => _BlogListScreenState();
}

class _BlogListScreenState extends State<BlogListScreen> {
  List<dynamic> blogs = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadBlogs();
  }

  Future<void> _loadBlogs() async {
    try {
      final String response =
          await rootBundle.loadString('assets/blog/blog_data.json');
      final Map<String, dynamic> data = json.decode(response);

      setState(() {
        blogs = data[widget.category] ?? [];
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load blogs!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : blogs.isEmpty
              ? Center(
                  child: Text(
                    'No blogs available.',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, // 3 chủ đề trên mỗi hàng
                      mainAxisSpacing: 15, // Khoảng cách giữa các hàng
                      crossAxisSpacing: 15, // Khoảng cách giữa các cột
                      childAspectRatio: 5 / 3, // Tỉ lệ khung hình nhỏ hơn
                    ),
                    itemCount: blogs.length,
                    itemBuilder: (context, index) {
                      final blog = blogs[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  BlogDetailScreen(blog: blog),
                            ),
                          );
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(6), // Bo góc nhỏ hơn
                          ),
                          elevation: 1.5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(6)),
                                  child: blog['image'] != null
                                      ? Image.asset(
                                          blog['image'],
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                        )
                                      : Container(
                                          color: Colors.grey[300],
                                          child: Icon(
                                            Icons.image_not_supported,
                                            size: 30, // Icon nhỏ hơn
                                            color: Colors.grey,
                                          ),
                                        ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 6, vertical: 2),
                                child: Text(
                                  blog['category'] ?? 'No Category',
                                  style: TextStyle(
                                    fontSize: 15, // Font nhỏ hơn
                                    color: Colors.grey[600],
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 6),
                                child: Text(
                                  blog['title'] ?? 'No Title',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15, // Font nhỏ hơn
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 6, vertical: 4),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.calendar_today,
                                      size: 15, // Icon lịch nhỏ hơn
                                      color: Colors.blue,
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      blog['date'] ?? 'No Date',
                                      style: TextStyle(
                                        fontSize: 15, // Font nhỏ hơn
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
    );
  }
}

class BlogDetailScreen extends StatelessWidget {
  final Map<String, dynamic> blog;

  BlogDetailScreen({required this.blog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(blog['title'] ?? 'Blog Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // blog['image'] != null
            //     ? Image.asset(blog['image'], fit: BoxFit.cover)
            //     : Container(
            //         height: 200,
            //         color: Colors.grey[300],
            //         child: Icon(
            //           Icons.image_not_supported,
            //           size: 100,
            //           color: Colors.grey,
            //         ),
            //       ),
            //  SizedBox(height: 20),
            Text(blog['title'] ?? 'No Title',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(blog['date'] ?? 'No Date',
                style: TextStyle(color: Colors.grey, fontSize: 16)),
            SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  blog['content'] ?? 'No Content Available',
                  style: TextStyle(fontSize: 18, height: 1.5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

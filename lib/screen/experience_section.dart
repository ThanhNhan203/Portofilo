import 'package:flutter/material.dart';
import 'dart:convert'; // Để decode JSON
import 'package:flutter/services.dart'; // Để sử dụng rootBundle

class ExperienceSection extends StatefulWidget {
  @override
  _ExperienceSectionState createState() => _ExperienceSectionState();
}

class _ExperienceSectionState extends State<ExperienceSection> {
  List<Map<String, String>> experiences = [];

  @override
  void initState() {
    super.initState();
    _loadExperiences(); // Gọi hàm load dữ liệu từ JSON
  }

  Future<void> _loadExperiences() async {
    try {
      // Đọc file JSON từ assets
      final String response =
          await rootBundle.loadString('assets/experience/experience.json');
      final List<dynamic> data = json.decode(response);

      // Cập nhật state với dữ liệu JSON
      setState(() {
        experiences = data.map((item) {
          return {
            'title': item['title'] as String,
            'company': item['company'] as String,
            'duration': item['duration'] as String,
            'experience': item['experience'] as String,
          };
        }).toList();
      });
    } catch (e) {
      print('Error loading JSON: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue.shade800, Colors.purple.shade700],
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Experience Section',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: experiences.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        itemCount: experiences.length,
                        itemBuilder: (context, index) {
                          final experience = experiences[index];
                          return GestureDetector(
                            onTap: () {
                              _showExperienceDetails(context, experience);
                            },
                            child: Card(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 5,
                              child: ListTile(
                                contentPadding: EdgeInsets.all(16),
                                leading: Icon(Icons.work,
                                    color: Colors.blueAccent, size: 30),
                                title: Text(
                                  experience['title']!,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                subtitle: Text(
                                  '${experience['company']} • ${experience['duration']}',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                ),
                                trailing: Icon(Icons.arrow_forward_ios,
                                    color: Colors.grey),
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showExperienceDetails(
      BuildContext context, Map<String, String> experience) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          title: Text(experience['title']!,
              style: TextStyle(fontWeight: FontWeight.bold)),
          content: Text(
              'Company: ${experience['company']}\nDuration: ${experience['duration']}\nExperience :${experience['experience']}'),
          actions: [
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

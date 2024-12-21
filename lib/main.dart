import 'package:flutter/material.dart';
import 'screen/home_section.dart';
import 'screen/experience_section.dart';
import 'screen/Blog/blog_section.dart';
import 'screen/contact_section.dart';

void main() {
  runApp(PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: PortfolioHomePage(),
    );
  }
}

class PortfolioHomePage extends StatefulWidget {
  @override
  _PortfolioHomePageState createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeSection(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
    );
  }
}

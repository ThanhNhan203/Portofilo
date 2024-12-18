import 'dart:math';
import 'package:flutter/material.dart';
import 'particle.dart';
import 'particle_painter.dart';

class ParticleScreen extends StatefulWidget {
  const ParticleScreen({Key? key}) : super(key: key);

  @override
  _ParticleScreenState createState() => _ParticleScreenState();
}

class _ParticleScreenState extends State<ParticleScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Particle> _particles;
  final int _particleCount = 50;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final screenSize = MediaQuery.of(context).size;
      _particles = List.generate(
        _particleCount,
        (_) => Particle(
          Offset(
            Random().nextDouble() * screenSize.width,
            Random().nextDouble() * screenSize.height,
          ),
          Offset(
            (Random().nextDouble() - 0.5) * 2,
            (Random().nextDouble() - 0.5) * 2,
          ),
        ),
      );
      _controller.repeat();
    });

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 16),
    )..addListener(() {
        setState(() {
          for (var particle in _particles) {
            particle.update(MediaQuery.of(context).size);
          }
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          CustomPaint(
            size: Size.infinite,
            painter: ParticlePainter(_particles),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

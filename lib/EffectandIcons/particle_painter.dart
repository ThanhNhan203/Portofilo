import 'dart:ui';
import 'particle.dart';
import 'package:flutter/material.dart';

class ParticlePainter extends CustomPainter {
  final List<Particle> particles;

  ParticlePainter(this.particles);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey.shade300
      ..style = PaintingStyle.fill;

    // Draw particles
    for (var particle in particles) {
      canvas.drawCircle(particle.position, 2, paint);
    }

    // Draw lines between close particles
    for (var i = 0; i < particles.length; i++) {
      for (var j = i + 1; j < particles.length; j++) {
        final distance =
            (particles[i].position - particles[j].position).distance;
        if (distance < 100) {
          final linePaint = Paint()
            ..color = Colors.grey.withOpacity(1 - distance / 100)
            ..strokeWidth = 0.5;
          canvas.drawLine(
              particles[i].position, particles[j].position, linePaint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

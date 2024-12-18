import 'dart:ui';

class Particle {
  Offset position;
  Offset velocity;

  Particle(this.position, this.velocity);

  void update(Size size) {
    position += velocity;

    // Bounce when hitting screen boundaries
    if (position.dx < 0 || position.dx > size.width) {
      velocity = Offset(-velocity.dx, velocity.dy);
    }
    if (position.dy < 0 || position.dy > size.height) {
      velocity = Offset(velocity.dx, -velocity.dy);
    }
  }
}

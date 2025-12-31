import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: WriCustomClipper()));
}

class WriCustomClipper extends StatelessWidget {
  const WriCustomClipper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Practice Clipper Design'),
        backgroundColor: Colors.amberAccent,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Opacity(
            opacity: 0.5,
            child: ClipPath(
              clipper: WaveClipper(),
              child: Container(
                color: const Color.fromARGB(255, 250, 226, 4),
                height: 260,
              ),
            ),
          ),
          ClipPath(
            clipper: WaveClipper(),
            child: Container(
              alignment: Alignment.center,
              color: const Color.fromARGB(255, 238, 221, 71),
              height: 230,
              child: const Text(
                'Wave Clipper',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(0, size.height);

    final firstStart = Offset(size.width / 5, size.height);
    final firstEnd = Offset(size.width / 2.25, size.height - 50);

    path.quadraticBezierTo(
      firstStart.dx,
      firstStart.dy,
      firstEnd.dx,
      firstEnd.dy,
    );

    final secondStart = Offset(
      size.width - (size.width / 3.24),
      size.height - 105,
    );
    final secondEnd = Offset(size.width, size.height - 10);

    path.quadraticBezierTo(
      secondStart.dx,
      secondStart.dy,
      secondEnd.dx,
      secondEnd.dy,
    );

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

import 'package:flutter/material.dart';
import 'package:friend_app/home_screen.dart';
import 'package:friend_app/random_match_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class ConnectScreen extends StatelessWidget {
  const ConnectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE8DEF8),

      body: SafeArea(
        child: Stack(
          children: [
            IconButton(
              icon: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
                color: Color(0xff1A1763),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
            ),

            /// DOTTED CURVE LINES
            Positioned.fill(child: CustomPaint(painter: DottedPainter())),

            /// TOP SMALL PROFILE
            const Positioned(
              top: 10,
              left: 170,
              child: ProfileWidget(
                image:
                    'https://images.unsplash.com/photo-1494790108377-be9c29b29330',
                radius: 22,
                borderColor: Colors.pink,
              ),
            ),

            /// LEFT BIG PROFILE
            const Positioned(
              top: 90,
              left: 30,
              child: ProfileWidget(
                image:
                    'https://images.unsplash.com/photo-1438761681033-6461ffad8d80',
                radius: 42,
                borderColor: Colors.pink,
              ),
            ),

            /// TOP RIGHT BIG PROFILE
            const Positioned(
              top: 85,
              right: 65,
              child: ProfileWidget(
                image:
                    'https://images.unsplash.com/photo-1544005313-94ddf0286df2',
                radius: 45,
                borderColor: Colors.lime,
              ),
            ),

            /// CENTER SMALL PROFILE
            const Positioned(
              top: 180,
              left: 145,
              child: ProfileWidget(
                image:
                    'https://images.unsplash.com/photo-1517841905240-472988babdf9',
                radius: 18,
                borderColor: Colors.deepPurple,
              ),
            ),

            /// LIKE ICON
            Positioned(
              top: 170,
              right: 25,
              child: buildIcon(Icons.thumb_up, Colors.orange),
            ),

            /// HEART ICON
            Positioned(
              top: 240,
              left: 70,
              child: buildIcon(Icons.favorite, Colors.red),
            ),

            /// CENTER RIGHT PROFILE
            const Positioned(
              top: 280,
              right: 55,
              child: ProfileWidget(
                image:
                    'https://images.unsplash.com/photo-1546961329-78bef0414d7c',
                radius: 48,
                borderColor: Colors.deepPurple,
              ),
            ),

            /// BOTTOM LEFT SMALL PROFILE
            const Positioned(
              bottom: 250,
              left: 25,
              child: ProfileWidget(
                image:
                    'https://images.unsplash.com/photo-1488426862026-3ee34a7d66df',
                radius: 20,
                borderColor: Colors.pink,
              ),
            ),

            /// BOTTOM CENTER PROFILE
            const Positioned(
              bottom: 160,
              left: 90,
              child: ProfileWidget(
                image:
                    'https://images.unsplash.com/photo-1494790108377-be9c29b29330',
                radius: 50,
                borderColor: Colors.lime,
              ),
            ),

            /// RIGHT HEART ICON
            Positioned(
              bottom: 250,
              right: 70,
              child: buildIcon(Icons.favorite, Colors.redAccent),
            ),

            /// TITLE + BUTTON
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Find Your Right Matching",
                      style: GoogleFonts.inter(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff1A1763),
                      ),
                    ),

                    const SizedBox(height: 30),

                    GestureDetector(
                      onTap: () {
                        // Handle button tap
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RandomMatchScreen(),
                          ),
                        );
                      },

                      child: Container(
                        height: 58,
                        width: 260,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: [0.0, 0.5, 1.0],
                            colors: [
                              Color(0xFF07038D),
                              Color(0xFF131055),
                              Color(0xFF120F70),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Center(
                          child: Text(
                            "Let’s Start",
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget buildIcon(IconData icon, Color color) {
    return Container(
      height: 52,
      width: 52,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
      ),
      child: Icon(icon, color: color),
    );
  }
}

/// PROFILE WIDGET
class ProfileWidget extends StatelessWidget {
  final String image;
  final double radius;
  final Color borderColor;

  const ProfileWidget({
    super.key,
    required this.image,
    required this.radius,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [borderColor, Colors.white, borderColor],
        ),
        boxShadow: [
          BoxShadow(color: borderColor.withOpacity(0.4), blurRadius: 12),
        ],
      ),
      child: CircleAvatar(radius: radius, backgroundImage: NetworkImage(image)),
    );
  }
}

/// DOTTED LINE PAINTER
void drawDashedPath(Canvas canvas, Paint paint, Path path) {
  const dashWidth = 8;
  const dashSpace = 6;

  for (final pathMetric in path.computeMetrics()) {
    double distance = 0;

    while (distance < pathMetric.length) {
      final nextDistance = distance + dashWidth;

      canvas.drawPath(pathMetric.extractPath(distance, nextDistance), paint);

      distance = nextDistance + dashSpace;
    }
  }
}

@override
bool shouldRepaint(CustomPainter oldDelegate) => false;

/// DOTTED LINE PAINTER
class DottedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.deepPurple.withOpacity(0.45)
      ..strokeWidth = 2.2
      ..style = PaintingStyle.stroke;

    /// TOP SMALL -> LEFT BIG
    drawDashedPath(
      canvas,
      paint,
      Path()
        ..moveTo(190, 35)
        ..quadraticBezierTo(120, 70, 75, 130),
    );

    /// TOP SMALL -> TOP RIGHT
    drawDashedPath(
      canvas,
      paint,
      Path()
        ..moveTo(205, 40)
        ..quadraticBezierTo(240, 60, 290, 120),
    );

    /// LEFT BIG -> CENTER SMALL
    drawDashedPath(
      canvas,
      paint,
      Path()
        ..moveTo(90, 160)
        ..quadraticBezierTo(120, 200, 165, 205),
    );

    /// CENTER SMALL -> RIGHT BIG
    drawDashedPath(
      canvas,
      paint,
      Path()
        ..moveTo(175, 220)
        ..quadraticBezierTo(230, 240, 275, 320),
    );

    /// RIGHT BIG -> BOTTOM CENTER
    drawDashedPath(
      canvas,
      paint,
      Path()
        ..moveTo(285, 360)
        ..quadraticBezierTo(240, 470, 165, 520),
    );

    /// BOTTOM LEFT -> BOTTOM CENTER
    drawDashedPath(
      canvas,
      paint,
      Path()
        ..moveTo(55, 500)
        ..quadraticBezierTo(90, 510, 145, 535),
    );

    /// TOP RIGHT -> BOTTOM RIGHT
    drawDashedPath(
      canvas,
      paint,
      Path()
        ..moveTo(300, 160)
        ..quadraticBezierTo(360, 300, 300, 500),
    );

    /// LEFT BIG -> BOTTOM LEFT
    drawDashedPath(
      canvas,
      paint,
      Path()
        ..moveTo(60, 180)
        ..quadraticBezierTo(10, 320, 40, 480),
    );
  }

  void drawDashedPath(Canvas canvas, Paint paint, Path path) {
    const dashWidth = 8;
    const dashSpace = 6;

    for (final pathMetric in path.computeMetrics()) {
      double distance = 0;

      while (distance < pathMetric.length) {
        final nextDistance = distance + dashWidth;

        canvas.drawPath(pathMetric.extractPath(distance, nextDistance), paint);

        distance = nextDistance + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

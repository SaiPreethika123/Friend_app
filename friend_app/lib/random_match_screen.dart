import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RandomMatchScreen extends StatefulWidget {
  const RandomMatchScreen({super.key});

  @override
  State<RandomMatchScreen> createState() => _RandomMatchScreenState();
}

class _RandomMatchScreenState extends State<RandomMatchScreen> {
  int selectedIndex = 0;
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xffB6ABF5), Color(0xffD9D3FF), Colors.white],
          ),
        ),

        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Column(
              children: [
                /// BACK BUTTON
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                        size: 18,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                /// IMAGES SECTION
                SizedBox(
                  height: 330,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      /// MALE CARD
                      Positioned(
                        top: 0,
                        right: 45,
                        child: Transform.rotate(
                          angle: 0.10,
                          child: profileCard(
                            image:
                                "https://images.unsplash.com/photo-1500648767791-00dcc994a43e",
                            width: 150,
                            height: 220,
                            bgColor: Colors.black,
                          ),
                        ),
                      ),

                      /// FEMALE CARD
                      Positioned(
                        top: 70,
                        left: 20,
                        child: Transform.rotate(
                          angle: -0.15,
                          child: profileCard(
                            image:
                                "https://images.unsplash.com/photo-1494790108377-be9c29b29330",
                            width: 160,
                            height: 230,
                            bgColor: const Color(0xffD6C12D),
                          ),
                        ),
                      ),

                      /// HEART TOP
                      Positioned(top: 0, child: circleHeart()),

                      /// HEART BOTTOM
                      Positioned(bottom: 20, left: 30, child: circleHeart()),
                    ],
                  ),
                ),

                const SizedBox(height: 10),

                /// TITLE
                const Text(
                  "Perfect Match",
                  style: TextStyle(
                    fontSize: 56,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff22135C),
                    fontFamily: 'cursive',
                  ),
                ),

                const SizedBox(height: 10),

                /// SUBTITLE
                Text(
                  "Real conversations start with a single hello.",
                  style: GoogleFonts.ubuntu(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black54,
                  ),
                ),

                const SizedBox(height: 34),

                /// BUTTONS
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = 0; // VIDEO SELECTED
                        });
                      },

                      child: Container(
                        width: 124,
                        height: 120,
                        decoration: BoxDecoration(
                          gradient: selectedIndex == 0
                              ? const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  stops: [0.0, 0.5, 1.0],
                                  colors: [
                                    Color(0xFF07038D),
                                    Color(0xFF131055),
                                    Color(0xFF120F70),
                                  ],
                                )
                              : null,

                          color: selectedIndex == 0 ? null : Colors.white,

                          borderRadius: BorderRadius.circular(18),

                          border: Border.all(
                            color: const Color(0xff13008F),
                            width: 1.2,
                          ),
                        ),

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 18,
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.videocam,
                                color: const Color(0xff13008F),
                              ),
                            ),

                            const SizedBox(height: 14),

                            Text(
                              "Video Call",
                              style: GoogleFonts.inter(
                                color: selectedIndex == 0
                                    ? Colors.white
                                    : const Color(0xff13008F),
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),

                            const SizedBox(height: 6),

                            Text(
                              "12 coins /min 😂",
                              style: GoogleFonts.inter(
                                color: selectedIndex == 0
                                    ? Colors.white
                                    : Colors.black87,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 30),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = 1; // AUDIO SELECTED
                        });
                      },

                      child: Container(
                        width: 124,
                        height: 120,
                        decoration: BoxDecoration(
                          gradient: selectedIndex == 1
                              ? const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  stops: [0.0, 0.5, 1.0],
                                  colors: [
                                    Color(0xFF07038D),
                                    Color(0xFF131055),
                                    Color(0xFF120F70),
                                  ],
                                )
                              : null,

                          color: selectedIndex == 1 ? null : Colors.white,

                          borderRadius: BorderRadius.circular(18),

                          border: Border.all(
                            color: const Color(0xff13008F),
                            width: 1.2,
                          ),
                        ),

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 18,
                              backgroundColor: selectedIndex == 1
                                  ? Colors.white
                                  : const Color(0xffFF5A5F),

                              child: Icon(
                                Icons.mic,
                                color: selectedIndex == 1
                                    ? const Color(0xff13008F)
                                    : Colors.white,
                              ),
                            ),

                            const SizedBox(height: 14),

                            Text(
                              "Audio Call",
                              style: GoogleFonts.inter(
                                color: selectedIndex == 1
                                    ? Colors.white
                                    : const Color(0xff13008F),
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),

                            const SizedBox(height: 6),

                            Text(
                              "20 coins /min 😂",
                              style: GoogleFonts.inter(
                                color: selectedIndex == 1
                                    ? Colors.white
                                    : Colors.black87,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                const Spacer(),

                /// CONTINUE
                Padding(
                  padding: const EdgeInsets.only(bottom: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Continue Browsing",
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      SizedBox(width: 10),

                      Text(
                        ">>>>",
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// PROFILE CARD
  static Widget profileCard({
    required String image,
    required double width,
    required double height,
    required Color bgColor,
  }) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(22),
        image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
    );
  }

  /// HEART CIRCLE
  static Widget circleHeart() {
    return Container(
      width: 58,
      height: 58,
      decoration: const BoxDecoration(
        color: Color(0xff13008F),
        shape: BoxShape.circle,
      ),
      child: const Icon(Icons.favorite, color: Colors.white, size: 28),
    );
  }
}

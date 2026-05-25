import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class AudioScreen extends StatefulWidget {
  const AudioScreen({super.key});

  @override
  State<AudioScreen> createState() => _AudioCallScreenState();
}

class _AudioCallScreenState extends State<AudioScreen> {
  bool isMicOn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F4F4),

      body: Column(
        children: [
          /// ================= TOP BAR =================
          Container(
            height: 118,
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),

            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,

                stops: [0.0, 0.5, 1.0],

                colors: [
                  Color(0xFF07038D), // TOP COLOR
                  Color(0xFF131055), // MIDDLE COLOR
                  Color(0xFF120F70), // BOTTOM COLOR
                ],
              ),
            ),

            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },

                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),

                  const SizedBox(width: 70),

                  Text(
                    "Audio Call",
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const Spacer(),

                  /// COIN BOX
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),

                    decoration: BoxDecoration(
                      color: Color(0xffE5E7EB).withOpacity(0.10),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Color(0xffE5E7EB).withOpacity(0.10),
                      ),
                    ),

                    child: Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.coins,
                          color: Color(0xffFFD700),
                          size: 15,
                        ),

                        const SizedBox(width: 3),

                        Text(
                          "1,250",
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 10),

                  const Icon(Icons.more_vert, color: Colors.white, size: 20),
                ],
              ),
            ),
          ),

          /// ================= BODY =================
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  children: [
                    const SizedBox(height: 22),

                    /// TOP BUTTONS
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        /// FOLLOW BUTTON
                        Container(
                          height: 34,

                          padding: const EdgeInsets.symmetric(horizontal: 18),

                          alignment: Alignment.center,

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),

                            gradient: const LinearGradient(
                              colors: [Color(0xff9333EA), Color(0xff2563EB)],
                            ),
                          ),

                          child: Text(
                            "Follow",
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),

                        const SizedBox(width: 10),

                        /// COIN/MIN
                        Container(
                          height: 34,

                          padding: const EdgeInsets.symmetric(horizontal: 10),

                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(color: Colors.grey.shade300),
                          ),

                          child: Row(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.coins,
                                color: Color(0xffFFD700),
                                size: 15,
                              ),

                              const SizedBox(width: 3),

                              Text(
                                "10/min",
                                style: GoogleFonts.inter(
                                  color: Colors.black,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(width: 16),
                      ],
                    ),

                    const Spacer(),
                  ],
                ),

                /// CENTER CONTENT
                /// ================= CENTER CONTENT =================
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    /// PROFILE SECTION
                    SizedBox(
                      height: 150,
                      width: 190,

                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          /// ================= LEFT IMAGE RINGS =================
                          Positioned(
                            left: -2,
                            top: 8,

                            child: Container(
                              height: 112,
                              width: 112,

                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: const Color(0xff2B1BAA),
                                  width: 1.2,
                                ),
                              ),
                            ),
                          ),

                          Positioned(
                            left: -7,
                            top: 3,

                            child: Container(
                              height: 122,
                              width: 122,

                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: const Color(0xff2B1BAA),
                                  width: 1,
                                ),
                              ),
                            ),
                          ),

                          /// ================= LEFT IMAGE =================
                          Positioned(
                            left: 5,
                            top: 12,

                            child: Container(
                              height: 102,
                              width: 102,

                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: const Color(0xff2B1BAA),
                                  width: 2.5,
                                ),

                                image: const DecorationImage(
                                  image: NetworkImage(
                                    "https://images.unsplash.com/photo-1494790108377-be9c29b29330",
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),

                          /// ================= RIGHT IMAGE RINGS =================
                          /// ================= RIGHT IMAGE RINGS =================
                          // Positioned(
                          //   right: 6,
                          //   top: 34,

                          //   child: Container(
                          //     height: 98,
                          //     width: 98,

                          //     decoration: BoxDecoration(
                          //       shape: BoxShape.circle,
                          //       border: Border.all(
                          //         color: const Color(0xff2B1BAA),
                          //         width: 1,
                          //       ),
                          //     ),
                          //   ),
                          // ),

                          // Positioned(
                          //   right: 1,
                          //   top: 29,

                          //   child: Container(
                          //     height: 108,
                          //     width: 108,

                          //     decoration: BoxDecoration(
                          //       shape: BoxShape.circle,
                          //       border: Border.all(
                          //         color: const Color(0xff2B1BAA),
                          //         width: 1,
                          //       ),
                          //     ),
                          //   ),
                          // ),

                          /// ================= RIGHT IMAGE =================
                          Positioned(
                            right: 20,
                            top: 38,

                            child: Column(
                              children: [
                                Container(
                                  height: 92,
                                  width: 92,

                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,

                                    border: Border.all(
                                      color: const Color(0xff2B1BAA),
                                      width: 3,
                                    ),

                                    image: const DecorationImage(
                                      image: NetworkImage(
                                        "https://images.unsplash.com/photo-1500648767791-00dcc994a43e",
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 4),

                                Text(
                                  "Samuel",
                                  style: GoogleFonts.inter(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 18),

                    /// NAME
                    Text(
                      "Stella",
                      style: GoogleFonts.manrope(
                        color: Colors.black,
                        fontSize: 34,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    const SizedBox(height: 6),

                    /// TIME
                    Text(
                      "00:12",
                      style: GoogleFonts.manrope(
                        color: Color(0xffF01212),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 10),
                  ],
                ),

                /// ================= BOTTOM FULL CONTAINER =================
                Align(
                  alignment: Alignment.bottomCenter,

                  child: SafeArea(
                    top: false,

                    child: Container(
                      width: double.infinity,
                      height: 100,

                      decoration: const BoxDecoration(
                        color: Colors.black,

                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(28),
                          topRight: Radius.circular(28),
                        ),
                      ),

                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 12,
                          ),

                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(40),
                          ),

                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              /// VIDEO BUTTON
                              buildCircleButton(
                                icon: Icons.videocam,
                                iconColor: Colors.green,
                                onTap: () {},
                              ),

                              const SizedBox(width: 14),

                              /// MIC BUTTON
                              buildCircleButton(
                                icon: isMicOn ? Icons.mic : Icons.mic_off,
                                iconColor: Colors.white,
                                borderColor: Colors.white,

                                onTap: () {
                                  setState(() {
                                    isMicOn = !isMicOn;
                                  });
                                },
                              ),

                              const SizedBox(width: 14),

                              /// END CALL
                              buildCircleButton(
                                icon: Icons.call_end,
                                iconColor: const Color(0xffFF0000),

                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCircleButton({
    required IconData icon,
    // required Color bgColor,
    required Color iconColor,
    Color? borderColor,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,

      child: Container(
        height: 48,
        width: 48,

        decoration: BoxDecoration(
          // color: bgColor,
          shape: BoxShape.circle,
          color: Color(0xff000000),

          border: borderColor != null
              ? Border.all(color: borderColor, width: 1.5)
              : null,
        ),

        child: Icon(icon, color: iconColor, size: 27),
      ),
    );
  }
}

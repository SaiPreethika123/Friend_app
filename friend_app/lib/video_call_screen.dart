import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({super.key});

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  bool isMicOn = true;
  bool isVideoOn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: Column(
        children: [
          /// ================= TOP BAR =================
          Container(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              top: 50,
              bottom: 18,
            ),

            decoration: BoxDecoration(
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

                const Spacer(),

                Text(
                  "Video Call",
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
                    horizontal: 12,
                    vertical: 6,
                  ),

                  decoration: BoxDecoration(
                    color: const Color(0xff4A2B93),
                    borderRadius: BorderRadius.circular(20),
                  ),

                  child: Row(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.coins,
                        color: Color(0xffFFD700),
                        size: 15,
                      ),

                      SizedBox(width: 4),

                      Text(
                        "1,250",
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 10),

                const Icon(Icons.more_vert, color: Colors.white),
              ],
            ),
          ),

          /// ================= VIDEO SECTION =================
          Expanded(
            child: Stack(
              children: [
                /// MAIN IMAGE
                SizedBox(
                  height: double.infinity,
                  width: double.infinity,

                  child: Image.network(
                    "https://images.unsplash.com/photo-1494790108377-be9c29b29330",
                    fit: BoxFit.cover,
                  ),
                ),

                /// DARK OVERLAY
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(.65),
                      ],
                    ),
                  ),
                ),

                /// LEFT GLOW
                Positioned(
                  left: -40,
                  top: 220,

                  child: Container(
                    height: 280,
                    width: 120,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),

                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,

                        colors: [
                          Colors.purpleAccent.withOpacity(.45),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ),

                /// RIGHT GLOW
                Positioned(
                  right: -40,
                  top: 320,

                  child: Container(
                    height: 280,
                    width: 120,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),

                      gradient: LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,

                        colors: [
                          Colors.purpleAccent.withOpacity(.45),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ),

                /// ================= FULL CONTENT =================
                Padding(
                  padding: const EdgeInsets.all(14),

                  child: Stack(
                    children: [
                      /// ================= TOP USER ROW =================
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// PROFILE + NAME
                          Column(
                            children: [
                              Container(
                                height: 52,
                                width: 52,

                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,

                                  border: Border.all(
                                    color: Colors.white,
                                    width: 1.8,
                                  ),

                                  image: const DecorationImage(
                                    image: NetworkImage(
                                      "https://images.unsplash.com/photo-1494790108377-be9c29b29330",
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),

                              const SizedBox(height: 6),

                              Text(
                                "Stella",
                                style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),

                          const Spacer(),

                          /// RIGHT ACTIONS
                          Row(
                            children: [
                              /// FOLLOW BUTTON
                              Container(
                                height: 36,

                                alignment: Alignment.center,

                                padding: const EdgeInsets.symmetric(
                                  horizontal: 22,
                                ),

                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),

                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xff9333EA),
                                      Color(0xff2563EB),
                                    ],
                                  ),
                                ),

                                child: Text(
                                  "Follow",
                                  style: GoogleFonts.inter(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),

                              const SizedBox(width: 8),

                              /// TIMER + COINS
                              Container(
                                height: 36,

                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                ),

                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(22),
                                ),

                                child: Row(
                                  children: [
                                    Text(
                                      "00:12:00",
                                      style: GoogleFonts.inter(
                                        color: Color(0xffE70A0A),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),

                                    const SizedBox(width: 10),

                                    Row(
                                      children: [
                                        FaIcon(
                                          FontAwesomeIcons.coins,
                                          color: Color(0xffFFD700),
                                          size: 15,
                                        ),

                                        SizedBox(width: 3),

                                        Text(
                                          "10/min",
                                          style: GoogleFonts.poppins(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      /// ================= RIGHT SIDE =================
                      Align(
                        alignment: Alignment.topRight,

                        child: Padding(
                          padding: const EdgeInsets.only(top: 80),

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,

                            children: [
                              /// SMALL VIDEO
                              Container(
                                height: 160,
                                width: 115,

                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),

                                  border: Border.all(
                                    color: Colors.white,
                                    width: 2,
                                  ),

                                  image: const DecorationImage(
                                    image: NetworkImage(
                                      "https://images.unsplash.com/photo-1500648767791-00dcc994a43e",
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),

                              const SizedBox(height: 6),

                              Padding(
                                padding: EdgeInsets.only(right: 19),

                                child: Text(
                                  "Samuel",
                                  style: GoogleFonts.nunito(
                                    color: Colors.white,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),

                              const SizedBox(height: 24),

                              /// MIC BUTTON
                              buildButton(
                                isMicOn ? Icons.mic : Icons.mic_off,

                                onTap: () {
                                  setState(() {
                                    isMicOn = !isMicOn;
                                  });
                                },
                              ),

                              const SizedBox(height: 16),

                              /// VIDEO BUTTON
                              buildButton(
                                isVideoOn ? Icons.videocam : Icons.videocam_off,

                                onTap: () {
                                  setState(() {
                                    isVideoOn = !isVideoOn;
                                  });
                                },
                              ),

                              const SizedBox(height: 16),

                              /// SWITCH CAMERA
                              buildButton(Icons.cameraswitch),

                              const SizedBox(height: 16),

                              /// END CALL
                              buildButton(
                                Icons.call_end,
                                bgColor: Colors.red,
                                iconColor: Colors.white,

                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                              const SizedBox(height: 16),

                              /// SWITCH CAMERA
                              buildButton(Icons.card_giftcard),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildButton(
    IconData icon, {
    Color bgColor = Colors.white,
    Color iconColor = Colors.black,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,

      child: Container(
        height: 49,
        width: 49,

        decoration: BoxDecoration(
          color: bgColor,
          shape: BoxShape.circle,

          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(.25), blurRadius: 10),
          ],
        ),

        child: Icon(icon, color: iconColor, size: 28),
      ),
    );
  }
}

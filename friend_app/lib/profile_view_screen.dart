import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileViewScreen extends StatefulWidget {
  const ProfileViewScreen({super.key});

  @override
  State<ProfileViewScreen> createState() => _ProfileViewScreenState();
}

class _ProfileViewScreenState extends State<ProfileViewScreen> {
  final List<Map<String, dynamic>> interests = [
    {"title": "Photography", "icon": Icons.camera_alt_outlined},
    {"title": "Shopping", "icon": Icons.shopping_bag_outlined},
    {"title": "Cooking", "icon": Icons.ramen_dining_outlined},
    {"title": "Video games", "icon": Icons.sports_esports_outlined},
    {"title": "Movie", "icon": Icons.movie_creation_outlined},
    {"title": "Tennis", "icon": Icons.sports_tennis_outlined},
  ];

  final List<Map<String, dynamic>> ratings = [
    {
      "title": "Charming",
      "bg": const Color(0xFFFFD7E5),
      "text": const Color(0xFFC84373),
    },
    {
      "title": "Confident",
      "bg": const Color(0xFFE7DBFF),
      "text": const Color(0xFF7D47C5),
    },
    {
      "title": "Funny",
      "bg": const Color(0xFFFFE8BE),
      "text": const Color(0xFFC48A2A),
    },
    {
      "title": "Ambitious",
      "bg": const Color(0xFFD9EAFF),
      "text": const Color(0xFF4A7BC2),
    },
    {
      "title": "Creative",
      "bg": const Color(0xFFD8F5DF),
      "text": const Color(0xFF2F9F59),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 106,
              width: double.infinity,

              padding: const EdgeInsets.only(top: 45, left: 12, right: 12),

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

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },

                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),

                  Text(
                    "Profile",
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  PopupMenuButton(
                    constraints: const BoxConstraints(
                      minWidth: 140,
                      maxWidth: 160,
                    ),
                    color: Colors.white,

                    icon: const Icon(Icons.more_vert, color: Colors.white),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),

                    itemBuilder: (context) => [
                      PopupMenuItem(
                        child: Row(
                          children: [
                            const Icon(Icons.person_off),

                            const SizedBox(width: 10),

                            Text(
                              "Report",
                              style: GoogleFonts.nunito(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),

                      PopupMenuItem(
                        child: Row(
                          children: [
                            const Icon(Icons.block),

                            const SizedBox(width: 10),

                            Text(
                              "Block",
                              style: GoogleFonts.nunito(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            /// ================= TOP IMAGE SECTION =================
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 300,
                  width: double.infinity,

                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        "https://images.unsplash.com/photo-1494790108377-be9c29b29330",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                /// SMALL IMAGES
                Positioned(
                  bottom: 45,
                  left: 0,
                  right: 120,

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: List.generate(
                      4,
                      (index) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),

                        width: 45,
                        height: 62,

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),

                          // border: Border.all(color: Colors.white, width: 2),
                          image: DecorationImage(
                            image: NetworkImage(
                              "https://picsum.photos/200?random=$index",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                /// FOLLOW BOX
                Positioned(
                  bottom: -22,
                  right: 16,

                  child: Container(
                    width: 200,
                    height: 54,

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

                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(6),
                        topRight: Radius.circular(6),
                        bottomLeft: Radius.circular(6),
                        bottomRight: Radius.circular(6),
                      ),
                      // border: Border.all(color: Color(0xffffff)),
                    ),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "1k",
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                            ),

                            Text(
                              "Follow",
                              style: GoogleFonts.inter(
                                color: Colors.white70,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),

                        Container(width: 1, height: 24, color: Colors.white30),

                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "2k",
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                            ),

                            Text(
                              "Followers",
                              style: GoogleFonts.inter(
                                color: Colors.white70,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 40),

            /// ================= DETAILS SECTION =================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// ================= NAME =================
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          "Stella Ramolla",
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.inter(
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                      ),

                      const SizedBox(width: 6),

                      const Text("🇮🇳", style: TextStyle(fontSize: 22)),
                    ],
                  ),

                  const SizedBox(height: 4),

                  Row(
                    children: [
                      Text(
                        "ID: 12345678",
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      const SizedBox(width: 18),

                      Text(
                        "26y",
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: Colors.black87,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 14),

                  /// ================= TOP TAGS =================
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      topTag(
                        icon: Icons.female,
                        title: "Female",
                        bgColor: const Color(0xFFB58A58),
                      ),

                      topTag(
                        icon: Icons.workspace_premium,
                        title: "Level 6",
                        bgColor: const Color(0xFF7B0C73),
                      ),

                      topTag(
                        icon: Icons.circle,
                        title: "Active",
                        bgColor: const Color(0xFF31C85A),
                        iconSize: 10,
                      ),
                    ],
                  ),

                  const SizedBox(height: 18),

                  /// ================= ACTION CONTAINER =================
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 15,
                    ),

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),

                      border: Border.all(color: Colors.grey.shade300),
                    ),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,

                      children: [
                        actionButton(
                          icon: Icons.person_add_alt_1,
                          title: "Follow",
                          color1: const Color(0xFF5C8FFF),
                          color2: const Color(0xFF3A63F4),
                        ),

                        actionButton(
                          icon: Icons.chat_bubble,
                          title: "Chat",
                          color1: const Color(0xFFFF5EA9),
                          color2: const Color(0xFFD8387C),
                        ),

                        actionButton(
                          icon: Icons.call,
                          title: "Call",
                          color1: const Color(0xFF33D57D),
                          color2: const Color(0xFF0CAA5B),
                        ),

                        actionButton(
                          icon: Icons.videocam,
                          title: "Video",
                          color1: const Color(0xFFA467FF),
                          color2: const Color(0xFF7A3DF0),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 18),

                  /// ================= ABOUT ME =================
                  profileCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "About Me",
                          style: GoogleFonts.inter(
                            fontSize: 21,
                            fontWeight: FontWeight.w700,
                          ),
                        ),

                        const SizedBox(height: 12),

                        Text(
                          "I am single 26 years old. I love fitness, travelling, & going out to play. You can find me in Jakarta.",
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            height: 1.5,
                            color: Colors.black87,
                          ),
                        ),

                        const SizedBox(height: 8),

                        Text(
                          "Read more",
                          style: GoogleFonts.inter(
                            color: Colors.redAccent,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 18),

                  /// ================= INTERESTS =================
                  profileCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Interests",
                          style: GoogleFonts.inter(
                            fontSize: 21,
                            fontWeight: FontWeight.w700,
                          ),
                        ),

                        const SizedBox(height: 16),

                        Wrap(
                          spacing: 12,
                          runSpacing: 12,
                          children: interests
                              .map(
                                (item) => interestContainer(
                                  item['title'],
                                  item['icon'],
                                ),
                              )
                              .toList(),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 18),

                  /// ================= RATING =================
                  profileCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Rating",
                              style: GoogleFonts.inter(
                                fontSize: 21,
                                fontWeight: FontWeight.w700,
                              ),
                            ),

                            const SizedBox(width: 10),

                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),

                              decoration: BoxDecoration(
                                color: const Color(0xFF150B9A),
                                borderRadius: BorderRadius.circular(14),
                              ),

                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 18,
                                  ),

                                  const SizedBox(width: 5),

                                  Text(
                                    "4.5",
                                    style: GoogleFonts.inter(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),

                        Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: ratings
                              .map(
                                (e) =>
                                    ratingTag(e['title'], e['bg'], e['text']),
                              )
                              .toList(),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// ================= PROFILE CARD =================

  Widget profileCard({required Widget child}) {
    return Container(
      width: double.infinity,

      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),

        border: Border.all(color: Colors.grey.shade300),
      ),

      child: child,
    );
  }

  /// ================= TOP TAG =================

  Widget topTag({
    required IconData icon,
    required String title,
    required Color bgColor,
    double iconSize = 15,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),

      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),

      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white, size: iconSize),

          const SizedBox(width: 5),

          Text(
            title,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  /// ================= ACTION BUTTON =================

  Widget actionButton({
    required IconData icon,
    required String title,
    required Color color1,
    required Color color2,
  }) {
    return Column(
      children: [
        Container(
          width: 48,
          height: 48,

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),

            gradient: LinearGradient(colors: [color1, color2]),
          ),

          child: Icon(icon, color: Colors.white, size: 22),
        ),

        const SizedBox(height: 8),

        Text(
          title,
          style: GoogleFonts.inter(
            fontSize: 12,
            color: Colors.black87,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  /// ================= INTEREST CONTAINER =================

  Widget interestContainer(String title, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),

      decoration: BoxDecoration(
        color: const Color(0xFF130C98),
        borderRadius: BorderRadius.circular(12),
      ),

      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white, size: 18),

          const SizedBox(width: 7),

          Text(
            title,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  /// ================= RATING TAG =================

  Widget ratingTag(String title, Color bgColor, Color textColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),

      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(14),
      ),

      child: Text(
        title,
        style: GoogleFonts.inter(
          color: textColor,
          fontSize: 13,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

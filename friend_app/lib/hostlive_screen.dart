import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Hostlivescreen extends StatefulWidget {
  const Hostlivescreen({super.key});

  @override
  State<Hostlivescreen> createState() => _HostlivescreenState();
}

class _HostlivescreenState extends State<Hostlivescreen> {
  int selectedIndex = 1;

  List<Map<String, dynamic>> users = [
    {
      "image": "https://randomuser.me/api/portraits/men/32.jpg",
      "name": "Mike",
      "host": true,
    },
    {
      "image": "https://randomuser.me/api/portraits/women/44.jpg",
      "name": "Ramolla",
      "host": false,
    },
    {
      "image": "https://randomuser.me/api/portraits/women/68.jpg",
      "name": "Emma",
      "host": false,
    },
    {
      "image": "https://randomuser.me/api/portraits/men/21.jpg",
      "name": "Swajan",
      "host": false,
    },
    {
      "image": "https://randomuser.me/api/portraits/men/56.jpg",
      "name": "Sanju",
      "host": false,
    },
    {
      "image": "https://randomuser.me/api/portraits/men/75.jpg",
      "name": "Alex",
      "host": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFEFDEFF), Color(0xFFDBDBF2)],
          ),
        ),

        /// BG
        child: Column(
          children: [
            /// TOP HEADER
            Container(
              height: 110,
              padding: const EdgeInsets.only(left: 12, right: 12, top: 45),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF07038D),
                    Color(0xFF131055),
                    Color(0xFF120F70),
                  ],
                ),
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 18,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),

                  const SizedBox(width: 8),

                  const CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(
                      "https://randomuser.me/api/portraits/women/10.jpg",
                    ),
                  ),

                  const SizedBox(width: 8),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "@Stella Ramolla",
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "ID: 12345678",
                        style: GoogleFonts.inter(
                          color: Colors.white70,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),

                  const Spacer(),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        const FaIcon(
                          FontAwesomeIcons.coins,
                          color: Color(0xffFFD700),
                          size: 15,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          "1,250",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 13,
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

            /// BODY
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 12,
                ),
                child: Column(
                  children: [
                    /// TIME CARD
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        height: 38,
                        width: 156,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.85),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.access_time,
                              color: Colors.blue,
                              size: 20,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              "12:00",
                              style: GoogleFonts.inter(
                                color: Colors.red,
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(width: 15),
                            const Icon(
                              Icons.monetization_on,
                              color: Colors.amber,
                              size: 18,
                            ),
                            Text(
                              "10/min",
                              style: GoogleFonts.inter(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    /// USERS GRID
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: users.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 14,
                            crossAxisSpacing: 12,
                            childAspectRatio: 0.9,
                          ),
                      itemBuilder: (context, index) {
                        final user = users[index];

                        return requestCard(
                          image: user["image"],
                          name: user["name"],
                          isHost: user["host"],
                          isSelected: selectedIndex == index,
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                        );
                      },
                    ),

                    const SizedBox(height: 24),

                    /// COMMENTS
                    commentCard("Jessica", "2m", "Amazing stream! 🔥"),
                    const SizedBox(height: 12),
                    commentCard("David", "1m", "Love the energy here! ⚡"),
                    const SizedBox(height: 12),
                    commentCard(
                      "Luna",
                      "30s",
                      "Can I join the conversation? 💫",
                    ),

                    const Spacer(),

                    /// MESSAGE BAR
                    Container(
                      height: 54,
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          const Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Write your message",
                              ),
                            ),
                          ),
                          const Icon(Icons.photo_camera_outlined),
                          const SizedBox(width: 10),
                          const Icon(Icons.mic_none),
                          const SizedBox(width: 10),
                          const Icon(Icons.send),
                        ],
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

  /// USER CARD
  Widget requestCard({
    required String image,
    required String name,
    bool isHost = false,
    bool isSelected = false,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: isSelected ? 110 : 90,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.75),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: isSelected ? const Color(0xFF07038D) : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: isSelected ? 28 : 22,
              backgroundImage: NetworkImage(image),
            ),
            const SizedBox(height: 10),
            Text(
              name,
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget commentCard(String name, String time, String msg) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.7),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$name • $time",
            style: GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: 13),
          ),
          const SizedBox(height: 6),
          Text(msg),
        ],
      ),
    );
  }
}

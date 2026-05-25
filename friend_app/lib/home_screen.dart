import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:friend_app/audio_screen.dart';
import 'package:friend_app/availablecoins_screen.dart';
import 'package:friend_app/connect_screen.dart';
import 'package:friend_app/profile_screen.dart';
import 'package:friend_app/profile_view_screen.dart';
import 'package:friend_app/search_screen.dart';
import 'package:friend_app/video_call_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, String>> liveHosts = [
    {
      "name": "Emma",

      "username": "@emma_live",
      "image": "https://randomuser.me/api/portraits/women/44.jpg",
    },
    {
      "name": "Luna",

      "username": "@luna_music",
      "image": "https://randomuser.me/api/portraits/women/68.jpg",
    },
    {
      "name": "Emma",

      "username": "@emma_live",
      "image": "https://randomuser.me/api/portraits/women/44.jpg",
    },
    {
      "name": "Luna",

      "username": "@luna_music",
      "image": "https://randomuser.me/api/portraits/women/68.jpg",
    },
    {
      "name": "Emma",

      "username": "@emma_live",
      "image": "https://randomuser.me/api/portraits/women/44.jpg",
    },
    {
      "name": "Luna",

      "username": "@luna_music",
      "image": "https://randomuser.me/api/portraits/women/68.jpg",
    },
    {
      "name": "Yuki",
      "username": "@yuki_art",
      "image": "https://randomuser.me/api/portraits/women/65.jpg",
    },
    {
      "name": "Sofia",
      "username": "@sofia",
      "image": "https://randomuser.me/api/portraits/women/32.jpg",
    },
    {
      "name": "Sonu",
      "username": "@sonu",
      "image": "https://randomuser.me/api/portraits/women/12.jpg",
    },
    {
      "name": "Yuki",
      "username": "@yuki_art",
      "image": "https://randomuser.me/api/portraits/women/65.jpg",
    },
    {
      "name": "Sofia",
      "username": "@sofia",
      "image": "https://randomuser.me/api/portraits/women/32.jpg",
    },
    {
      "name": "Sonu",
      "username": "@sonu",
      "image": "https://randomuser.me/api/portraits/women/12.jpg",
    },
    {
      "name": "Rani",
      "status": "@so_Music",
      "username": "@so_Music",
      "image": "https://randomuser.me/api/portraits/men/45.jpg",
    },
    {
      "name": "Sonu",
      "username": "@sonu",
      "image": "https://randomuser.me/api/portraits/women/12.jpg",
    },
    {
      "name": "Rani",
      "status": "@so_Music",
      "username": "@so_Music",
      "image": "https://randomuser.me/api/portraits/men/45.jpg",
    },
  ];
  final PageController bannerController = PageController();

  int currentBanner = 0;

  final List<String> bannerImages = [
    "https://t4.ftcdn.net/jpg/08/08/69/13/360_F_808691310_B992urupQ6kh1pAw76BE9OfeMypj6f1x.jpg",

    "https://img.freepik.com/free-photo/happy-woman-using-smartphone_23-2149067483.jpg",
    "https://t4.ftcdn.net/jpg/08/08/69/13/360_F_808691310_B992urupQ6kh1pAw76BE9OfeMypj6f1x.jpg",
  ];

  @override
  void initState() {
    super.initState();
    autoScrollBanner();
  }

  void autoScrollBanner() {
    Timer.periodic(const Duration(seconds: 3), (timer) {
      if (bannerController.hasClients) {
        currentBanner++;

        if (currentBanner >= bannerImages.length) {
          currentBanner = 0;
        }

        bannerController.animateToPage(
          currentBanner,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    bannerController.dispose();
    super.dispose();
  }

  int selectedTab = 0;

  int bottomIndex = 0;

  final List<IconData> bottomIcons = [
    Icons.home_outlined,
    Icons.favorite_border,
    Icons.chat_bubble_outline,
    Icons.person_outline,
  ];

  // final List<Widget> screens = [
  //   const HomeScreen(),
  //   const ConnectScreen(),
  //   // const ChatScreen(),
  //   // const ProfileScreen(),
  // ];

  final List<String> bottomLabels = ["Home", "Connect", "Chats", "Profile"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9E2F5),

      bottomNavigationBar: Container(
        height: 75,
        width: 90,

        // margin: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),

        child: Row(
          children: List.generate(bottomIcons.length, (index) {
            bool isSelected = bottomIndex == index;

            return Expanded(
              child: Material(
                color: Colors.transparent,

                child: InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  focusColor: Colors.transparent,

                  // borderRadius: BorderRadius.circular(18),
                  onTap: () {
                    setState(() {
                      bottomIndex = index;
                    });
                  },

                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeInOut,

                    decoration: BoxDecoration(
                      gradient: isSelected
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

                      // borderRadius: BorderRadius.circular(18),
                    ),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          bottomIcons[index],
                          color: isSelected ? Colors.white : Colors.black,
                          size: 24,
                        ),

                        const SizedBox(height: 4),

                        Text(
                          bottomLabels[index],

                          style: GoogleFonts.inter(
                            color: isSelected ? Colors.white : Colors.black87,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),

      body: getBody(),
    );
  }

  Widget getBody() {
    switch (bottomIndex) {
      case 0:
        return homecontent();

      case 1:
        return const ConnectScreen();

      case 2:
        return const Center(child: Text("Chats Screen"));

      case 3:
        return const ProfileScreen();

      default:
        return homecontent();
    }
  }

  Widget homecontent() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          // ================= TOP BLUE SECTION =================
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(
              top: 55,
              left: 20,
              right: 20,
              bottom: 20,
            ),
            decoration: const BoxDecoration(color: Color(0xFF12007B)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AvailablecoinsScreen(),
                          ),
                        );
                      },
                      child: Container(
                        height: 30,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 7,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.white70, width: 1),
                        ),
                        child: Row(
                          children: [
                            FaIcon(
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
                    ),

                    Row(
                      children: [
                        Container(
                          height: 38,
                          width: 38,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SearchScreen(),
                                ),
                              );
                            },

                            child: const Icon(Icons.search),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Stack(
                          children: [
                            Container(
                              height: 38,
                              width: 38,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: const Icon(Icons.notifications),
                            ),
                            Positioned(
                              right: 2,
                              top: 2,
                              child: Container(
                                height: 10,
                                width: 10,
                                decoration: const BoxDecoration(
                                  color: Colors.pink,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfileViewScreen(),
                          ),
                        );
                      },
                      child: Container(
                        height: 32,
                        width: 32,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(
                              "https://i.imgur.com/BoN9kdC.png",
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Good Morning, Santhosh",
                          style: GoogleFonts.manrope(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          "Let's Connect Instantly",
                          style: GoogleFonts.manrope(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          // ================= TABS =================
          Container(
            padding: const EdgeInsets.only(top: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildTab("Explore", 0),
                buildTab("Live Host", 1),
                buildTab("Newest", 2),
                buildTab("Following", 3),
              ],
            ),
          ),

          // ================= CARD =================
          Padding(
            padding: const EdgeInsets.all(18),
            child: Container(
              height: 160,
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                gradient: const LinearGradient(
                  colors: [Color(0xFF1914CD), Color(0xFF4C4848)],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Connect with Friends,\nGet Rewards!",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Join live conversations and earn coins",
                    style: GoogleFonts.poppins(
                      color: Colors.white70,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          "Connect",
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "12,453",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "users online",
                            style: GoogleFonts.poppins(
                              color: Colors.white70,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // ================= GRID =================
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),

            child: StaggeredGrid.count(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,

              children: [
                // ================= FIRST 6 CARDS =================
                ...List.generate(6, (index) {
                  final host = liveHosts[index];

                  return buildHostCard(host);
                }),

                // ================= FULL WIDTH BANNER =================
                StaggeredGridTile.fit(
                  crossAxisCellCount: 3,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 140,
                        child: PageView.builder(
                          controller: bannerController,
                          itemCount: bannerImages.length,

                          onPageChanged: (index) {
                            setState(() {
                              currentBanner = index;
                            });
                          },

                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.symmetric(horizontal: 2),

                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),

                                image: DecorationImage(
                                  image: NetworkImage(bannerImages[index]),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      const SizedBox(height: 10),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: List.generate(bannerImages.length, (index) {
                          bool isActive = currentBanner == index;

                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 300),

                            margin: const EdgeInsets.symmetric(horizontal: 4),

                            height: 8,
                            width: isActive ? 22 : 8,

                            decoration: BoxDecoration(
                              color: isActive
                                  ? const Color(0xFF12007B)
                                  : Colors.grey.shade400,

                              borderRadius: BorderRadius.circular(20),
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),

                // ================= REMAINING CARDS =================
                ...List.generate(liveHosts.length - 6, (index) {
                  final host = liveHosts[index + 6];

                  return buildHostCard(host);
                }),
              ],
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget buildActionButton(IconData icon, Widget screen) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },

      child: Container(
        height: 33,
        width: 33,

        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF1914CD), Color(0xFF4C4848)],
          ),
          shape: BoxShape.circle,
        ),

        child: Icon(icon, color: Colors.white, size: 16),
      ),
    );
  }

  Widget buildTab(String title, int index) {
    bool isActive = selectedTab == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTab = index;
        });
      },

      child: Column(
        children: [
          Text(
            title,
            style: GoogleFonts.inter(
              color: isActive ? const Color(0xFF07038D) : Colors.black87,
              fontSize: 17,
              fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
            ),
          ),

          const SizedBox(height: 10),

          AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            height: 4,
            width: isActive ? 64 : 0,

            decoration: BoxDecoration(
              color: const Color(0xFF07038D),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildHostCard(Map<String, String> host) {
    return Container(
      height: 170,
      padding: const EdgeInsets.all(8),

      decoration: BoxDecoration(
        color: const Color(0xFFF1EEF8),
        borderRadius: BorderRadius.circular(14),
      ),

      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Container(
              height: 8,
              width: 8,
              decoration: const BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
            ),
          ),

          CircleAvatar(
            radius: 23,
            backgroundImage: NetworkImage(host["image"]!),
          ),

          const SizedBox(height: 6),

          Text(
            host["name"]!,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),

          Text(host["username"]!),

          const Spacer(),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildActionButton(Icons.mic, const AudioScreen()),

              const SizedBox(width: 8),

              buildActionButton(Icons.videocam, const VideoCallScreen()),
            ],
          ),
        ],
      ),
    );
  }
}

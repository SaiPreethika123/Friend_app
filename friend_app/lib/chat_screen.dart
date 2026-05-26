import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final chats = [
      {
        "name": "David Wayne",
        "message": "Thanks a bunch! Have a great day! 😊",
        "time": "10:25",
        "count": "5",
        "image": "https://randomuser.me/api/portraits/men/11.jpg",
      },
      {
        "name": "Edward Davidson",
        "message": "Great, thanks so much! 👋",
        "time": "22:20",
        "count": "12",
        "image": "https://randomuser.me/api/portraits/men/12.jpg",
      },
      {
        "name": "Angela Kelly",
        "message": "Appreciate it! See you soon! 🚀",
        "time": "10:45",
        "count": "1",
        "image": "https://randomuser.me/api/portraits/women/11.jpg",
      },
      {
        "name": "Jean Dare",
        "message": "Hooray! 🎉",
        "time": "20:10",
        "count": "0",
        "image": "https://randomuser.me/api/portraits/women/12.jpg",
      },
      {
        "name": "Dennis Borer",
        "message": "Your order has been successfully delivered",
        "time": "17:02",
        "count": "0",
        "image": "https://randomuser.me/api/portraits/men/13.jpg",
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),

      /// BODY
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120,
            width: double.infinity,
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
            child: Stack(
              children: [
                Positioned(
                  bottom: -10,
                  top: 45,
                  left: 10,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),

                Positioned(
                  bottom: 20, // move text downward
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Text(
                      "Chats",
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // const SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "New Chats",
              style: GoogleFonts.inter(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          const SizedBox(height: 20),

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: chats.length,
              itemBuilder: (context, index) {
                final chat = chats[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ChatDetailScreen(
                          name: chat['name'].toString(),
                          image: chat['image'].toString(),
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 22),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 42 / 2,
                          backgroundImage: NetworkImage(
                            chat['image'].toString(),
                          ),
                        ),

                        const SizedBox(width: 14),

                        /// TEXTS
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                chat['name'].toString(),
                                style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 5),

                              Text(
                                chat['message'].toString(),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.inter(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ),
                        ),

                        /// TIME + COUNT
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              chat['time'].toString(),
                              style: GoogleFonts.inter(
                                color: Colors.grey.shade600,
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                              ),
                            ),

                            const SizedBox(height: 8),

                            if (chat['count'] != "0")
                              Container(
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  color: const Color(0xffFADADD),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  chat['count'].toString(),
                                  style: GoogleFonts.nunito(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

/// CHAT DETAILS SCREEN
class ChatDetailScreen extends StatelessWidget {
  final String name;
  final String image;

  const ChatDetailScreen({super.key, required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),

      body: Column(
        children: [
          Container(
            height: 118,
            padding: const EdgeInsets.only(
              top: 60, // safe area replacement for status bar
              left: 16,
              right: 16,
              bottom: 16,
            ),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xff1E1B8F),
                  Color(0xff312E81),
                  Color(0xff4338CA),
                ],
              ),
            ),
            child: Row(
              children: [
                // BACK BUTTON
                InkWell(
                  onTap: () => Navigator.pop(context),
                  borderRadius: BorderRadius.circular(30),
                  child: const Padding(
                    padding: EdgeInsets.all(6),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),

                const SizedBox(width: 10),

                // USER INFO
                Expanded(
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(image),
                      ),

                      const SizedBox(width: 10),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              name,
                              // Lines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),

                            const SizedBox(height: 2),

                            Text(
                              "Online",
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // MORE ICON
                const Icon(Icons.more_vert, color: Colors.white),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: messageBubble(text: "Hi!", isSender: true),
                ),

                const SizedBox(height: 12),

                Align(
                  alignment: Alignment.centerLeft,
                  child: messageBubble(
                    text:
                        "No problem at all! I'll be there in about 15 minutes.",
                    isSender: false,
                  ),
                ),

                const SizedBox(height: 12),

                Align(
                  alignment: Alignment.centerRight,
                  child: messageBubble(text: "Great 😊", isSender: true),
                ),
              ],
            ),
          ),

          /// BOTTOM INPUT
          Container(
            padding: const EdgeInsets.all(12),
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 52,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: const Color(0xffF2F2F2),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Type a message ...",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Icon(Icons.camera_alt),
                        SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            int selectedGiftIndex = -1;

                            final List<Map<String, dynamic>> gifts = [
                              {"emoji": "❤️", "name": "Love", "coins": 20},
                              {"emoji": "🌹", "name": "Rose", "coins": 50},
                              {"emoji": "🎁", "name": "Gift Box", "coins": 100},
                              {"emoji": "🍫", "name": "Chocolate", "coins": 30},
                              {"emoji": "💍", "name": "Ring", "coins": 100},
                              {"emoji": "🐻", "name": "Teddy", "coins": 120},
                              {"emoji": "👑", "name": "Crown", "coins": 100},
                              {"emoji": "🚗", "name": "Car", "coins": 200},
                              {"emoji": "💍", "name": "Ring", "coins": 100},
                              {"emoji": "🐻", "name": "Teddy", "coins": 120},
                              {"emoji": "👑", "name": "Crown", "coins": 100},
                              {"emoji": "🚗", "name": "Car", "coins": 200},
                            ];

                            showModalBottomSheet(
                              context: context,
                              backgroundColor: Colors.transparent,
                              builder: (context) {
                                return StatefulBuilder(
                                  builder: (context, setState) {
                                    return Container(
                                      height: 476,
                                      padding: const EdgeInsets.all(16),
                                      decoration: const BoxDecoration(
                                        color: Color(0xff0E0E0E),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(28),
                                          topRight: Radius.circular(28),
                                        ),
                                      ),
                                      child: Column(
                                        children: [
                                          /// HANDLE
                                          Container(
                                            height: 4,
                                            width: 50,
                                            margin: const EdgeInsets.only(
                                              bottom: 18,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.grey.shade700,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                          ),

                                          /// TOP BAR
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Gifts",
                                                style: GoogleFonts.inter(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      horizontal: 14,
                                                      vertical: 8,
                                                    ),
                                                decoration: BoxDecoration(
                                                  color: const Color(
                                                    0xff1C1C1C,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                ),
                                                child: Row(
                                                  children: [
                                                    FaIcon(
                                                      FontAwesomeIcons.coins,
                                                      color: Color(0xffFFD700),
                                                      size: 15,
                                                    ),
                                                    const SizedBox(width: 6),
                                                    Text(
                                                      "1,250",
                                                      style: GoogleFonts.inter(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                    const SizedBox(width: 10),
                                                    Container(
                                                      height: 22,
                                                      width: 22,
                                                      decoration:
                                                          const BoxDecoration(
                                                            color: Colors.amber,
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                      child: const Icon(
                                                        Icons.add,
                                                        size: 16,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),

                                          const SizedBox(height: 22),

                                          /// GRID
                                          Expanded(
                                            child: GridView.builder(
                                              itemCount: gifts.length,
                                              gridDelegate:
                                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 4,
                                                    mainAxisSpacing: 14,
                                                    crossAxisSpacing: 14,
                                                    childAspectRatio: 0.78,
                                                  ),
                                              itemBuilder: (context, index) {
                                                final isSelected =
                                                    selectedGiftIndex == index;

                                                return GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      selectedGiftIndex = index;
                                                    });
                                                  },
                                                  child: AnimatedContainer(
                                                    height: 80,
                                                    duration: const Duration(
                                                      milliseconds: 200,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: const Color(
                                                        0xff16233B,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            16,
                                                          ),
                                                      border: Border.all(
                                                        color: isSelected
                                                            ? Colors.amber
                                                            : Colors
                                                                  .transparent,
                                                        width: 1.8,
                                                      ),
                                                    ),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        /// EMOJI
                                                        Text(
                                                          gifts[index]["emoji"]
                                                              .toString(),
                                                          style:
                                                              const TextStyle(
                                                                fontSize: 28,
                                                              ),
                                                        ),

                                                        const SizedBox(
                                                          height: 8,
                                                        ),

                                                        /// NAME
                                                        Text(
                                                          gifts[index]["name"]
                                                              .toString(),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style:
                                                              GoogleFonts.inter(
                                                                color: Colors
                                                                    .white70,
                                                                fontSize: 11,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),

                                                        const SizedBox(
                                                          height: 10,
                                                        ),

                                                        /// COINS
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            FaIcon(
                                                              FontAwesomeIcons
                                                                  .coins,
                                                              color: Color(
                                                                0xffFFD700,
                                                              ),
                                                              size: 15,
                                                            ),
                                                            const SizedBox(
                                                              width: 4,
                                                            ),
                                                            Text(
                                                              gifts[index]["coins"]
                                                                  .toString(),
                                                              style: GoogleFonts.inter(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 13,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                            );
                          },

                          /// ICON BUTTON
                          child: ShaderMask(
                            shaderCallback: (bounds) => const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xFF000000), Color(0xFF000000)],
                            ).createShader(bounds),
                            child: const Icon(
                              Icons.card_giftcard,
                              size: 26,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(width: 12),

                Container(
                  height: 52,
                  width: 52,
                  decoration: const BoxDecoration(
                    color: Color(0xff15127C),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.send, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget messageBubble({required String text, required bool isSender}) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 280),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: isSender ? const Color(0xffFDEEF4) : Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Text(text, style: GoogleFonts.inter(fontSize: 15)),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:friend_app/recharge_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class AvailablecoinsScreen extends StatefulWidget {
  const AvailablecoinsScreen({super.key});

  @override
  State<AvailablecoinsScreen> createState() => _AvailablecoinsScreenState();
}

class _AvailablecoinsScreenState extends State<AvailablecoinsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Map<String, dynamic>> callHistory = [
    {
      "image": "https://images.unsplash.com/photo-1494790108377-be9c29b29330",
      "name": "Sarah",
      "time": "Today, 2:45 PM",
      "duration": "12 mins",
      "amount": "-450",
      "type": "video",
    },

    {
      "image": "https://images.unsplash.com/photo-1544005313-94ddf0286df2",
      "name": "Emma Williams",
      "time": "Yesterday, 6:15 PM",
      "duration": "5 mins",
      "amount": "-400",
      "type": "audio",
    },

    {
      "image": "https://images.unsplash.com/photo-1500648767791-00dcc994a43e",
      "name": "Martinez",
      "time": "Yesterday, 3:30 PM",
      "duration": "8 mins",
      "amount": "-500",
      "type": "video",
    },

    {
      "image": "https://images.unsplash.com/photo-1438761681033-6461ffad8d80",
      "name": "Olivia",
      "time": "Yesterday, 1:20 PM",
      "duration": "Missed",
      "amount": "",
      "type": "audio",
    },
  ];

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),

      body: Column(
        children: [
          /// TOP BAR
          Container(
            height: 117,
            width: double.infinity,

            padding: const EdgeInsets.only(top: 50, left: 18, right: 18),

            decoration: const BoxDecoration(color: Color(0xff12008F)),

            child: Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 18,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      "Available Coins",
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 20),
              ],
            ),
          ),

          /// COIN CARD
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),

            height: 117,
            width: double.infinity,

            decoration: BoxDecoration(
              color: const Color(0xff1B1096),
              borderRadius: BorderRadius.circular(14),
            ),

            child: Stack(
              children: [
                Positioned(top: -10, right: -10, child: bubble(35)),

                Positioned(top: 12, left: 14, child: bubble(18)),

                Positioned(bottom: -10, left: -10, child: bubble(35)),

                Positioned(top: 28, right: 20, child: bubble(12)),

                Row(
                  children: [
                    const SizedBox(width: 20),

                    FaIcon(
                      FontAwesomeIcons.coins,
                      color: Color(0xffFFD700),
                      size: 34,
                    ),

                    const SizedBox(width: 18),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,

                      crossAxisAlignment: CrossAxisAlignment.center,

                      children: [
                        Text(
                          "Available Coins",
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        const SizedBox(height: 6),

                        Text(
                          "500 Coins",
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          /// RECHARGE BUTTON
          GestureDetector(
            onTap: () {
              // Handle button tap
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RechargeScreen()),
              );
            },
            child: Container(
              height: 50,
              width: 254,

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),

                border: Border.all(color: Colors.grey.shade300),
              ),

              child: Center(
                child: Text(
                  "Recharge",
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 22),

          /// TAB BAR + CALENDAR
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),

            child: Row(
              children: [
                Expanded(
                  child: TabBar(
                    controller: _tabController,

                    indicatorColor: const Color(0xff12008F),

                    labelColor: const Color(0xff12008F),

                    unselectedLabelColor: Colors.grey,

                    labelStyle: GoogleFonts.inter(fontWeight: FontWeight.w600),

                    tabs: const [
                      Tab(text: "Transaction History"),

                      Tab(text: "Call History"),
                    ],
                  ),
                ),

                const SizedBox(width: 10),

                Container(
                  height: 36,
                  width: 36,

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),

                    border: Border.all(color: Colors.grey.shade300),
                  ),

                  child: const Icon(Icons.calendar_today_outlined, size: 18),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          /// TAB VIEW
          Expanded(
            child: TabBarView(
              controller: _tabController,

              children: [
                /// TRANSACTION HISTORY
                ListView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),

                  children: [
                    transactionTile(
                      amount: "+450",
                      date: "Dec 28, 2024 • 10:30 AM",
                    ),

                    transactionTile(
                      amount: "+250",
                      date: "Dec 27, 2024 • 08:15 PM",
                    ),

                    transactionTile(
                      amount: "+450",
                      date: "Dec 26, 2024 • 03:45 PM",
                    ),
                  ],
                ),

                /// CALL HISTORY
                ListView.builder(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),

                  itemCount: callHistory.length,

                  itemBuilder: (context, index) {
                    final item = callHistory[index];

                    return callTile(item);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// TRANSACTION TILE
  Widget transactionTile({required String amount, required String date}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),

      padding: const EdgeInsets.all(14),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),

      child: Row(
        children: [
          Container(
            height: 42,
            width: 42,

            decoration: BoxDecoration(
              color: Colors.green.shade100,
              borderRadius: BorderRadius.circular(12),
            ),

            child: const Icon(Icons.arrow_upward, color: Colors.green),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  "Recharge Successfully",
                  style: GoogleFonts.inter(fontWeight: FontWeight.w600),
                ),

                const SizedBox(height: 4),

                Text(
                  date,
                  style: GoogleFonts.inter(
                    color: Colors.grey.shade600,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),

          Container(
            height: 32,
            width: 86,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),

              border: Border.all(color: Colors.grey.shade300),

              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.monetization_on,
                  color: Colors.yellow,
                  size: 20,
                ),

                Text(
                  amount,
                  style: GoogleFonts.inter(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// CALL TILE
  Widget callTile(Map<String, dynamic> item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),

      padding: const EdgeInsets.all(12),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),

      child: Row(
        children: [
          /// PROFILE IMAGE
          Stack(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundImage: NetworkImage(item["image"].toString()),
              ),

              Positioned(
                bottom: 0,
                right: 0,

                child: Container(
                  height: 16,
                  width: 16,

                  decoration: BoxDecoration(
                    shape: BoxShape.circle,

                    color: item["duration"] == "Missed"
                        ? Colors.red
                        : Colors.green,

                    border: Border.all(color: Colors.white, width: 2),
                  ),

                  child: Icon(Icons.call, color: Colors.white, size: 8),
                ),
              ),
            ],
          ),

          const SizedBox(width: 12),

          /// DETAILS
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        item["name"].toString(),

                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,

                          fontSize: 16,

                          color: const Color(0xff111827),
                        ),
                      ),
                    ),

                    item["amount"].toString().isNotEmpty
                        ? Container(
                            height: 32,

                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 6,
                            ),

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),

                              border: Border.all(color: Colors.grey.shade300),

                              color: Colors.white,
                            ),

                            child: Row(
                              mainAxisSize: MainAxisSize.min,

                              children: [
                                const Icon(
                                  Icons.monetization_on,

                                  color: Colors.amber,
                                  size: 18,
                                ),

                                const SizedBox(width: 4),

                                Text(
                                  item["amount"].toString(),

                                  style: GoogleFonts.inter(
                                    color: Colors.red,

                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container(
                            height: 42,
                            width: 42,

                            decoration: BoxDecoration(
                              color: Colors.white,

                              shape: BoxShape.circle,

                              border: Border.all(color: Colors.grey.shade300),
                            ),

                            child: const Icon(Icons.call, color: Colors.green),
                          ),
                  ],
                ),

                const SizedBox(height: 4),

                Row(
                  children: [
                    Icon(
                      item["type"] == "video" ? Icons.videocam : Icons.call,

                      color: const Color(0xffA855F7),

                      size: 14,
                    ),

                    const SizedBox(width: 4),

                    Text(
                      item["time"].toString(),

                      style: GoogleFonts.inter(
                        fontSize: 11,
                        color: const Color(0xff6B7280),
                      ),
                    ),

                    const Text("  •  "),

                    Text(
                      item["duration"].toString(),

                      style: GoogleFonts.inter(
                        fontSize: 11,

                        color: item["duration"] == "Missed"
                            ? Colors.red
                            : const Color(0xff6B7280),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget bubble(double size) {
    return Container(
      width: size,
      height: size,

      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.18),
        shape: BoxShape.circle,
      ),
    );
  }
}

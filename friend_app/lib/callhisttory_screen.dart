import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CallhisttoryScreen extends StatefulWidget {
  @override
  State<CallhisttoryScreen> createState() => _CallhisttoryScreenState();
}

class _CallhisttoryScreenState extends State<CallhisttoryScreen> {
  bool isMissedSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      body: Column(
        children: [
          // 🔥 CUSTOM TOP BAR (NOT APPBAR)
          Container(
            height: 118,
            padding: EdgeInsets.only(top: 70, left: 16, right: 16, bottom: 16),
            decoration: BoxDecoration(
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
                    size: 20,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(width: 12),

                Expanded(
                  child: Text(
                    "Call History",
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  // padding: EdgeInsets.all(8),
                  child: Icon(Icons.search, size: 19),
                ),
                SizedBox(width: 10),

                Container(
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    shape: BoxShape.circle,
                  ),
                  padding: EdgeInsets.all(8),
                  child: Icon(Icons.more_vert, color: Colors.white, size: 18),
                ),
              ],
            ),
          ),
          SizedBox(height: 12),
          // 🔥 TABS
          Container(
            height: 52,
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                tabItem("All Calls", !isMissedSelected),
                SizedBox(width: 20),
                tabItem("Missed Call", isMissedSelected),
              ],
            ),
          ),

          SizedBox(height: 8),

          // 🔥 LIST
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 12),
              children: isMissedSelected
                  ? allCallData
                        .where((e) => e["duration"] == "Missed")
                        .map(callTile)
                        .toList()
                  : allCallData.map(callTile).toList(),
            ),
          ),
        ],
      ),
    );
  }

  // 🔹 TAB ITEM
  Widget tabItem(String title, bool selected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isMissedSelected = title == "Missed Call";
        });
      },
      child: Column(
        children: [
          SizedBox(height: 12),
          Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: selected ? Colors.black : Colors.grey,
            ),
          ),
          SizedBox(height: 6),
          Container(
            height: 2,
            width: 70,
            color: selected ? Color(0xff07038D) : Colors.transparent,
          ),
        ],
      ),
    );
  }

  // 🔹 ALL CALLS LIST
  final List<Map<String, dynamic>> allCallData = [
    {
      "name": "Sarah Johnson",
      "time": "Today, 2:45 PM",
      "type": "audio",
      "duration": "12 mins",
      "image": "https://i.pravatar.cc/150?img=1",
      "amount": "-450",
      "status": "incoming",
    },
    {
      "name": "Michael Chen",
      "time": "Today, 11:20 AM",
      "type": "audio",
      "duration": "Missed",
      "image": "https://i.pravatar.cc/150?img=2",
      "amount": "",
      "status": "missed",
    },
    {
      "name": "Michael Chen",
      "time": "Today, 11:20 AM",
      "type": "audio",
      "duration": "Missed",
      "image": "https://i.pravatar.cc/150?img=2",
      "amount": "",
      "status": "missed",
    },
    {
      "name": "Sarah Johnson",
      "time": "Today, 2:45 PM",
      "type": "audio",
      "duration": "12 mins",
      "image": "https://i.pravatar.cc/150?img=1",
      "amount": "-450",
      "status": "incoming",
    },
    {
      "name": "Michael Chen",
      "time": "Today, 11:20 AM",
      "type": "audio",
      "duration": "Missed",
      "image": "https://i.pravatar.cc/150?img=2",
      "amount": "",
      "status": "missed",
    },
    {
      "name": "Michael Chen",
      "time": "Today, 11:20 AM",
      "type": "audio",
      "duration": "Missed",
      "image": "https://i.pravatar.cc/150?img=2",
      "amount": "",
      "status": "missed",
    },
    {
      "name": "Sarah Johnson",
      "time": "Today, 2:45 PM",
      "type": "audio",
      "duration": "12 mins",
      "image": "https://i.pravatar.cc/150?img=1",
      "amount": "-450",
      "status": "incoming",
    },
    {
      "name": "Michael Chen",
      "time": "Today, 11:20 AM",
      "type": "audio",
      "duration": "Missed",
      "image": "https://i.pravatar.cc/150?img=2",
      "amount": "",
      "status": "missed",
    },
    {
      "name": "Michael Chen",
      "time": "Today, 11:20 AM",
      "type": "audio",
      "duration": "Missed",
      "image": "https://i.pravatar.cc/150?img=2",
      "amount": "",
      "status": "missed",
    },
    {
      "name": "Sarah Johnson",
      "time": "Today, 2:45 PM",
      "type": "audio",
      "duration": "12 mins",
      "image": "https://i.pravatar.cc/150?img=1",
      "amount": "-450",
      "status": "incoming",
    },
    {
      "name": "Michael Chen",
      "time": "Today, 11:20 AM",
      "type": "audio",
      "duration": "Missed",
      "image": "https://i.pravatar.cc/150?img=2",
      "amount": "",
      "status": "missed",
    },
    {
      "name": "Michael Chen",
      "time": "Today, 11:20 AM",
      "type": "audio",
      "duration": "Missed",
      "image": "https://i.pravatar.cc/150?img=2",
      "amount": "",
      "status": "missed",
    },
    {
      "name": "Michael Chen",
      "time": "Today, 11:20 AM",
      "type": "audio",
      "duration": "Missed",
      "image": "https://i.pravatar.cc/150?img=2",
      "amount": "",
      "status": "missed",
    },
    {
      "name": "Sarah Johnson",
      "time": "Today, 2:45 PM",
      "type": "audio",
      "duration": "12 mins",
      "image": "https://i.pravatar.cc/150?img=1",
      "amount": "-450",
      "status": "incoming",
    },
    {
      "name": "Michael Chen",
      "time": "Today, 11:20 AM",
      "type": "audio",
      "duration": "Missed",
      "image": "https://i.pravatar.cc/150?img=2",
      "amount": "",
      "status": "missed",
    },
  ];

  // 🔹 CALL TILE
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
}

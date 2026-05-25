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
            padding: EdgeInsets.only(top: 50, left: 16, right: 16, bottom: 16),
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
                Icon(Icons.arrow_back, color: Colors.white),
                SizedBox(width: 12),

                Expanded(
                  child: Text(
                    "Call History",
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  padding: EdgeInsets.all(8),
                  child: Icon(Icons.search, size: 18),
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

          // 🔥 TABS
          Container(
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
                  ? missedCalls()
                  : allCalls(),
            ),
          )
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
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: selected ? Colors.black : Colors.grey,
            ),
          ),
          SizedBox(height: 6),
          Container(
            height: 2,
            width: 70,
            color: selected ? Colors.indigo : Colors.transparent,
          )
        ],
      ),
    );
  }

  // 🔹 ALL CALLS LIST
  List<Widget> allCalls() {
    return [
      callTile("Sarah Johnson", "Today, 2:45 PM", false, true),
      callTile("Michael Chen", "Today, 11:20 AM", true, false),
      callTile("Emma Williams", "Yesterday, 6:15 PM", false, true),
      callTile("David Martinez", "Yesterday, 3:30 PM", false, true),
      callTile("Lisa Anderson", "Dec 28, 10:45 AM", false, true),
      callTile("James Wilson", "Dec 27, 8:00 PM", true, false),
    ];
  }

  // 🔹 MISSED CALLS LIST
  List<Widget> missedCalls() {
    return [
      callTile("Michael Chen", "Today, 11:20 AM", true, false),
      callTile("Michael Chen", "Today, 11:20 AM", true, false),
      callTile("James Wilson", "Dec 27, 8:00 PM", true, false),
      callTile("James Wilson", "Dec 27, 8:00 PM", true, false),
    ];
  }

  // 🔹 CALL TILE
  Widget callTile(
      String name, String time, bool isMissed, bool isOutgoing) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          CircleAvatar(radius: 22),

          SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4),

                Row(
                  children: [
                    Icon(
                      isMissed ? Icons.call_received : Icons.call_made,
                      size: 14,
                      color: isMissed ? Colors.red : Colors.green,
                    ),
                    SizedBox(width: 4),

                    Text(
                      time,
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),

                    if (isMissed)
                      Text(
                        "  •  Missed",
                        style: TextStyle(color: Colors.red, fontSize: 12),
                      ),
                  ],
                )
              ],
            ),
          ),

          // 🔥 CALL BUTTON
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: isMissed ? Colors.red : Colors.green,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.call, color: Colors.white, size: 18),
          )
        ],
      ),
    );
  }
}
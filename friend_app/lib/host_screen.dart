import 'package:flutter/material.dart';
import 'package:friend_app/Hostlive_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class HostScreen extends StatefulWidget {
  const HostScreen({super.key});

  @override
  State<HostScreen> createState() => _HostScreenState();
}

class _HostScreenState extends State<HostScreen> {
  String selectedTopic = "Other";

  final List<String> topics = [
    "Movie",
    "Serial",
    "Music",
    "Game",
    "Love",
    "News",
    "Other",
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
        child: Column(
          children: [
            /// HEADER (UNCHANGED)
            Container(
              height: 110,
              width: double.infinity,
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
              child: Stack(
                children: [
                  Positioned(
                    top: 45,
                    left: 10,
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 45),
                      child: Text(
                        "Host Create",
                        style: TextStyle(
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

            /// BODY CONTENT (NO BUTTON HERE)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 12,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Select Topic",
                        style: GoogleFonts.inter(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      const SizedBox(height: 12),

                      /// TOPICS (UNCHANGED)
                      Wrap(
                        spacing: 8,
                        runSpacing: 10,
                        children: topics.map((topic) {
                          final isSelected = selectedTopic == topic;

                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedTopic = topic;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: isSelected
                                    ? const Color(0xFF07038D)
                                    : Colors.white,
                                border: Border.all(color: Colors.black),
                              ),
                              child: Text(
                                topic,
                                style: GoogleFonts.inter(
                                  color: isSelected
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),

                      const SizedBox(height: 18),

                      /// Topic Name
                      Text(
                        "Topic Name",
                        style: GoogleFonts.inter(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      const SizedBox(height: 8),

                      Container(
                        height: 46,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 14,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 18),

                      /// Language
                      Text(
                        "Language",
                        style: GoogleFonts.inter(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      const SizedBox(height: 8),

                      Container(
                        height: 50,
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: "Select Language",
                            items:
                                [
                                  "Select Language",
                                  "English",
                                  "Hindi",
                                  "Telugu",
                                ].map((e) {
                                  return DropdownMenuItem(
                                    value: e,
                                    child: Text(e),
                                  );
                                }).toList(),
                            onChanged: (v) {},
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      /// 🔥 FIXED BOTTOM BAR
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(14),
          // alignment: Alignment.center, // 🔥 IMPORTANT
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Hostlivescreen()),
              );
            },
            child: Container(
              width: 254, // ✅ fixed width works now
              height: 52,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF07038D),
                    Color(0xFF131055),
                    Color(0xFF120F70),
                  ],
                ),
              ),
              child: const Center(
                child: Text(
                  "Submit Request",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

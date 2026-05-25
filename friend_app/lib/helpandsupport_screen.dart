import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HelpandsupportScreen extends StatefulWidget {
  const HelpandsupportScreen({super.key});

  @override
  State<HelpandsupportScreen> createState() => _HelpSupportScreenState();
}

class _HelpSupportScreenState extends State<HelpandsupportScreen> {
  String? selectedIssue;

  final List<String> issues = [
    "Account Issue",
    "Payment Issue",
    "Call Issue",
    "Technical Issue",
  ];

  final TextEditingController subjectController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // HEADER
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
                        "Help & Support",
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

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                children: [
                  // ICON
                  Container(
                    height: 54,
                    width: 54,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
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
                    child: const Icon(
                      Icons.headset_mic,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),

                  const SizedBox(height: 14),

                  Text(
                    "We’re here to help you quickly",
                    style: GoogleFonts.inter(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xff262626),
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 10),

                  Text(
                    "Select your issue and we'll guide you to the best solution",
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff262626),
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 30),

                  // ISSUE
                  alignLabel("Issue"),

                  const SizedBox(height: 8),

                  Container(
                    height: 48,
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xffD1D5DB)),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: selectedIssue,
                        hint: Text(
                          "Select an Issue",
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            color: const Color(0xff6B7280),
                          ),
                        ),
                        isExpanded: true,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: issues.map((String item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text(
                              item,
                              style: GoogleFonts.inter(fontSize: 13),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedIssue = value;
                          });
                        },
                      ),
                    ),
                  ),

                  const SizedBox(height: 18),

                  // SUBJECT
                  alignLabel("Subject"),

                  const SizedBox(height: 8),

                  Container(
                    height: 56,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xffD1D5DB)),
                    ),
                    child: TextField(
                      controller: subjectController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Ex: Account an Issue .......",
                        hintStyle: GoogleFonts.inter(
                          fontSize: 12,
                          color: const Color(0xff9CA3AF),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 18),

                  // ATTACH
                  alignLabel("Attach your Image or Screenshot (Optional)"),

                  const SizedBox(height: 10),

                  Container(
                    height: 56,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: const Color(0xffC4C4C4),
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Browse",
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 42),

                  // BUTTON
                  Container(
                    height: 46,
                    width: 296,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
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
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 4,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        "Submit Request",
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget alignLabel(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: GoogleFonts.inter(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ApplanguageScreen extends StatefulWidget {
  @override
  _AppLanguageScreenState createState() => _AppLanguageScreenState();
}

class _AppLanguageScreenState extends State<ApplanguageScreen> {
  String selectedLanguage = "Arabic";

  final List<Map<String, String>> languages = [
    {"name": "Arabic", "flag": "🇦🇪"},
    {"name": "Spanish", "flag": "🇪🇸"},
    {"name": "French", "flag": "🇫🇷"},
    {"name": "German", "flag": "🇩🇪"},
    {"name": "Hindi", "flag": "🇮🇳"},
    {"name": "Korean", "flag": "🇰🇷"},
    {"name": "Vietnamese", "flag": "🇻🇳"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Column(
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
                      "App Language",
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
          SizedBox(height: 10),

          // 🔹 All Languages title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "All Languages",
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),

          SizedBox(height: 10),

          // 🔹 Search Box
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              height: 45,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
          ),

          SizedBox(height: 12),

          // 🔹 Language List Container
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ListView.builder(
                  itemCount: languages.length,
                  itemBuilder: (context, index) {
                    final lang = languages[index];
                    final isSelected = selectedLanguage == lang["name"];

                    return Column(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              selectedLanguage = lang["name"]!;
                            });
                          },
                          child: Container(
                            
                            decoration: BoxDecoration(
                              gradient: isSelected
                                  ? LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      stops: [0.0, 0.5, 1.0],
                                      colors: [
                                        Color(0xFF07038D), // TOP
                                        Color(0xFF131055), // MIDDLE
                                        Color(0xFF120F70), // BOTTOM
                                      ],
                                    )
                                  : null,
                              color: isSelected ? null : Colors.transparent,
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 14,
                            ),
                            child: Row(
                              children: [
                                // Flag
                                Text(
                                  lang["flag"]!,
                                  style: GoogleFonts.inter(fontSize: 22),
                                ),
                                SizedBox(width: 12),

                                // Language Name
                                Expanded(
                                  child: Text(
                                    lang["name"]!,
                                    style: GoogleFonts.inter(
                                      color: isSelected
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),

                                // Radio Icon
                                Icon(
                                  isSelected
                                      ? Icons.check_circle
                                      : Icons.radio_button_unchecked,
                                  color: isSelected
                                      ? Colors.white
                                      : Colors.grey,
                                ),
                              ],
                            ),
                          ),
                        ),

                        // Divider
                        if (index != languages.length - 1) Divider(height: 1),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

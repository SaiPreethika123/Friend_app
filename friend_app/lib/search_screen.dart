import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final List<Map<String, String>> users = [
    {
      "name": "Jessica Drew",
      "id": "234Y87878",
      "image": "https://randomuser.me/api/portraits/women/44.jpg",
    },
    {
      "name": "Aiko",
      "id": "65456568",
      "image": "https://randomuser.me/api/portraits/women/65.jpg",
    },
    {
      "name": "Greg James",
      "id": "98977697",
      "image": "https://randomuser.me/api/portraits/men/32.jpg",
    },
    {
      "name": "Emily Dorson",
      "id": "987453367",
      "image": "https://randomuser.me/api/portraits/women/68.jpg",
    },
    {
      "name": "Olimit",
      "id": "523438678",
      "image": "https://randomuser.me/api/portraits/women/12.jpg",
    },
    {
      "name": "Anu",
      "id": "23Y487878",
      "image": "https://randomuser.me/api/portraits/women/22.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F3F3),

      body: Column(
        children: [
          // ================= TOP BAR =================
          Container(
            height: 130,
            padding: const EdgeInsets.only(
              top: 50,
              left: 14,
              right: 14,
              bottom: 14,
            ),

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
              children: [
                IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 18,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),

                const SizedBox(width: 8),

                // ================= SEARCH =================
                Expanded(
                  child: Container(
                    height: 42,
                    width: 255,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.white, width: 1),
                    ),

                    child: Row(
                      children: [
                        const SizedBox(width: 12),

                        const Icon(
                          Icons.search,
                          color: Colors.white70,
                          size: 20,
                        ),

                        const SizedBox(width: 8),

                        Expanded(
                          child: Center(
                            child: TextField(
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),

                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Search for profiles",

                                hintStyle: GoogleFonts.poppins(
                                  color: Colors.white70,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(width: 12),

                Container(
                  height: 38,
                  width: 38,

                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),

                  child: const Icon(Icons.tune, size: 22),
                ),
              ],
            ),
          ),

          // ================= RECENT SEARCHES =================
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Recent Searches",
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  Expanded(
                    child: ListView.builder(
                      itemCount: users.length,

                      itemBuilder: (context, index) {
                        final user = users[index];

                        return Padding(
                          padding: const EdgeInsets.only(bottom: 18),

                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 58 / 2,
                                backgroundImage: NetworkImage(user["image"]!),
                              ),

                              const SizedBox(width: 14),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    user["name"]!,
                                    style: GoogleFonts.inter(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),

                                  const SizedBox(height: 2),

                                  Text(
                                    "ID: ${user["id"]}",
                                    style: GoogleFonts.inter(
                                      color: Color(0xff25254F),
                                      fontSize: 13,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

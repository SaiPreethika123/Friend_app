import 'package:flutter/material.dart';
import 'package:friend_app/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController bioController = TextEditingController();

  String? selectedGender;
  String? selectedCountry;
  String? selectedLanguage;

  bool isHobbiesScreen = false;

  List<String> selectedHobbies = [];

  final List<Map<String, dynamic>> interests = [
    {"name": "Photography", "icon": Icons.camera_alt_outlined},
    {"name": "Shopping", "icon": Icons.shopping_bag_outlined},
    {"name": "Cooking", "icon": Icons.soup_kitchen_outlined},
    {"name": "Video games", "icon": Icons.sports_esports_outlined},
    {"name": "Movie", "icon": Icons.movie_outlined},
    {"name": "Tennis", "icon": Icons.sports_tennis_outlined},
    {"name": "Art", "icon": Icons.palette_outlined},
    {"name": "Swimming", "icon": Icons.pool_outlined},
    {"name": "Music", "icon": Icons.music_note_outlined},
    {"name": "Painting", "icon": Icons.format_paint_outlined},
    {"name": "Drink", "icon": Icons.local_bar_outlined},
    {"name": "Flying", "icon": Icons.flight_takeoff_outlined},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: !isHobbiesScreen
                ? _buildIdentityScreen()
                : _buildInterestsScreen(),
          ),
        ),
      ),
    );
  }

  // ================= IDENTITY SCREEN =================

  Widget _buildIdentityScreen() {
    return Column(
      key: const ValueKey(1),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 25),

        Row(
          children: [
            const Icon(Icons.arrow_back_ios, size: 18, color: Colors.black87),

            const SizedBox(width: 8),

            Text(
              "Identify Your Self",
              style: GoogleFonts.inter(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),

        const SizedBox(height: 14),

        Center(
          child: Text(
            "Introduce Yourself fill out the details so\nPeople know about you",
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              color: Colors.black87,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              height: 1.5,
            ),
          ),
        ),

        const SizedBox(height: 35),

        buildInputField(
          label: "Full Name",
          hintText: "Enter Full Name",
          controller: nameController,
          isRequired: true,
        ),

        const SizedBox(height: 24),

        buildDropdownField(
          label: "Gender",
          hint: "Select Your Gender",
          value: selectedGender,
          items: ["Male", "Female", "Other"],
          isRequired: true,
          onChanged: (value) {
            setState(() {
              selectedGender = value;
            });
          },
        ),

        const SizedBox(height: 24),

        buildInputField(
          label: "DOB",
          hintText: "DD/MM/YY",
          controller: dobController,
          icon: Icons.calendar_today_outlined,
          isRequired: true,
        ),

        const SizedBox(height: 24),

        buildDropdownField(
          label: "Country",
          hint: "Select Country",
          value: selectedCountry,
          items: ["India", "USA", "UK"],
          isRequired: true,
          onChanged: (value) {
            setState(() {
              selectedCountry = value;
            });
          },
        ),

        const SizedBox(height: 24),

        buildDropdownField(
          label: "Language",
          hint: "Select Language",
          value: selectedLanguage,
          items: ["English", "Hindi", "Telugu"],
          isRequired: true,
          onChanged: (value) {
            setState(() {
              selectedLanguage = value;
            });
          },
        ),

        const SizedBox(height: 24),

        buildBioField(),

        const SizedBox(height: 40),

        Center(
          child: GestureDetector(
            onTap: () {
              setState(() {
                isHobbiesScreen = true;
              });
            },
          
            child: Container(
              height: 55,
              width: 269,
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
              child: Center(
                child: Text(
                  'Continue',
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ),

        const SizedBox(height: 30),
      ],
    );
  }

  // ================= INTEREST SCREEN =================

  Widget _buildInterestsScreen() {
    return Column(
      key: const ValueKey(2),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),

        Center(
          child: Row(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.black),
                onPressed: () {
                  setState(() {
                    isHobbiesScreen = false;
                  });
                },
              ),
              Text(
                "Select Your Interests",
                style: GoogleFonts.inter(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 12),

        Center(
          child: Text(
            "Select a few of your interests and let everyone know what you're passionate about.",
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              color: Colors.black87,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              height: 1.5,
            ),
          ),
        ),

        const SizedBox(height: 40),

        Wrap(
          spacing: 12,
          runSpacing: 16,
          children: interests.map((interestMap) {
            String interest = interestMap["name"];
            IconData icon = interestMap["icon"];

            bool isSelected = selectedHobbies.contains(interest);

            return GestureDetector(
              onTap: () {
                setState(() {
                  if (isSelected) {
                    selectedHobbies.remove(interest);
                  } else {
                    selectedHobbies.add(interest);
                  }
                });
              },

              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),

                decoration: BoxDecoration(
                  color: isSelected ? const Color(0xFF0B105C) : Colors.white,

                  borderRadius: BorderRadius.circular(30),

                  border: Border.all(
                    color: isSelected
                        ? const Color(0xFF0B105C)
                        : Colors.black87,
                  ),
                ),

                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      icon,
                      color: isSelected ? Colors.white : Colors.black,
                      size: 18,
                    ),

                    const SizedBox(width: 8),

                    Text(
                      interest,
                      style: GoogleFonts.inter(
                        color: isSelected ? Colors.white : Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),

        const SizedBox(height: 160),

        Center(
          child: GestureDetector(
            onTap: () {
              // Handle submit action here
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
          
            child: Container(
              height: 55,
              width: 269,
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
              child: Center(
                child: Text(
                  'Submit',
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ),

        const SizedBox(height: 30),
      ],
    );
  }

  // ================= TEXT FIELD =================

  Widget buildInputField({
    required String label,
    required String hintText,
    required TextEditingController controller,
    bool isRequired = false,
    IconData? icon,
  }) {
    return Stack(
      children: [
        Container(
          height: 58,
          margin: const EdgeInsets.only(top: 10),

          child: TextField(
            controller: controller,

            style: GoogleFonts.inter(color: Colors.black87, fontSize: 15),

            decoration: InputDecoration(
              hintText: hintText,

              hintStyle: GoogleFonts.inter(color: Colors.black45, fontSize: 15),

              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 24,
              ),

              suffixIcon: icon != null
                  ? Icon(icon, color: Colors.black45, size: 20)
                  : null,

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(22),

                borderSide: const BorderSide(color: Colors.black54, width: 1.2),
              ),

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(22),

                borderSide: const BorderSide(color: Colors.black87, width: 1.5),
              ),
            ),
          ),
        ),

        Positioned(
          left: 18,
          top: 0,

          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            color: Colors.white,

            child: RichText(
              text: TextSpan(
                text: label,

                style: GoogleFonts.inter(
                  color: Colors.black87,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),

                children: isRequired
                    ? [
                        TextSpan(
                          text: ' *',
                          style: GoogleFonts.inter(
                            color: Colors.red,
                            fontSize: 14,
                          ),
                        ),
                      ]
                    : [],
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ================= DROPDOWN =================

  Widget buildDropdownField({
    required String label,
    required String hint,
    required String? value,
    required List<String> items,
    required Function(String?) onChanged,
    bool isRequired = false,
  }) {
    return Stack(
      children: [
        Container(
          height: 58,
          margin: const EdgeInsets.only(top: 10),

          child: DropdownButtonFormField<String>(
            value: value,

            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(22),

                borderSide: const BorderSide(color: Colors.black54, width: 1.2),
              ),

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(22),

                borderSide: const BorderSide(color: Colors.black87, width: 1.5),
              ),
            ),

            hint: Text(
              hint,
              style: GoogleFonts.inter(color: Colors.black45, fontSize: 15),
            ),

            icon: const Icon(Icons.keyboard_arrow_down_rounded),

            items: items.map((item) {
              return DropdownMenuItem(
                value: item,
                child: Text(item, style: GoogleFonts.inter()),
              );
            }).toList(),

            onChanged: onChanged,
          ),
        ),

        Positioned(
          left: 18,
          top: 0,

          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            color: Colors.white,

            child: RichText(
              text: TextSpan(
                text: label,

                style: GoogleFonts.inter(
                  color: Colors.black87,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),

                children: isRequired
                    ? [
                        TextSpan(
                          text: ' *',
                          style: GoogleFonts.inter(
                            color: Colors.red,
                            fontSize: 14,
                          ),
                        ),
                      ]
                    : [],
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ================= BIO FIELD =================

  Widget buildBioField() {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10),

          child: TextField(
            controller: bioController,
            maxLines: 4,

            style: GoogleFonts.inter(color: Colors.black87, fontSize: 15),

            decoration: InputDecoration(
              hintText: "Ex: I'm a beautiful person",

              hintStyle: GoogleFonts.inter(color: Colors.black45, fontSize: 15),

              contentPadding: const EdgeInsets.all(20),

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(22),

                borderSide: const BorderSide(color: Colors.black54, width: 1.2),
              ),

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(22),

                borderSide: const BorderSide(color: Colors.black87, width: 1.5),
              ),
            ),
          ),
        ),

        Positioned(
          left: 18,
          top: 0,

          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            color: Colors.white,

            child: RichText(
              text: TextSpan(
                text: "Bio",

                style: GoogleFonts.inter(
                  color: Colors.black87,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),

                children: [
                  TextSpan(
                    text: ' *',
                    style: GoogleFonts.inter(color: Colors.red, fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Privacypolicyscreen extends StatefulWidget {
  const Privacypolicyscreen({super.key});

  @override
  State<Privacypolicyscreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<Privacypolicyscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
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
                      "Privacy Policy",
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
      
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  normalText(
                    "Welcome to Our App. Your privacy is important to us. This Privacy Policy explains how we collect, use, store, and protect your information when you use our mobile application and services.",
                  ),
      
                  const SizedBox(height: 22),
      
                  headingText("1. Information We Collect"),
      
                  const SizedBox(height: 12),
      
                  subHeadingText("a. We may collect:"),
      
                  bulletText("Name, username, profile details"),
      
                  bulletText("Email address and phone number"),
      
                  bulletText("Profile photos and uploaded content"),
      
                  const SizedBox(height: 10),
      
                  subHeadingText("b. Account & Usage Data"),
      
                  bulletText("User ID and account activity"),
      
                  bulletText("Chat, audio, and video interaction data"),
      
                  bulletText("Preferences, interests, and filters"),
      
                  const SizedBox(height: 10),
      
                  subHeadingText("c. Payment & Coins Data"),
      
                  bulletText(
                    "Transaction details (coin purchases, usage, withdrawals)",
                  ),
      
                  bulletText("Payment method information"),
      
                  const SizedBox(height: 10),
      
                  subHeadingText("d. Device & Technical Data"),
      
                  bulletText("Device type, OS version"),
      
                  bulletText("IP address and location"),
      
                  bulletText("App usage logs and crash reports"),
      
                  const SizedBox(height: 26),
      
                  headingText("2. How We Use Your Information"),
      
                  const SizedBox(height: 12),
      
                  normalText("We use your data to:"),
      
                  const SizedBox(height: 8),
      
                  bulletText("Create and manage your account"),
      
                  bulletText("Enable chat, audio, and video call features"),
      
                  bulletText("Process payments, coins, and withdrawals"),
      
                  bulletText("Improve user experience and app performance"),
      
                  bulletText("Personalize matches and recommendations"),
      
                  bulletText("Detect fraud, abuse, or suspicious activity"),
      
                  bulletText("Provide customer support"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget headingText(String text) {
    return Text(
      text,
      style: GoogleFonts.inter(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        color: Colors.black,
      ),
    );
  }

  Widget subHeadingText(String text) {
    return Text(
      text,
      style: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
    );
  }

  Widget normalText(String text) {
    return Text(
      text,
      style: GoogleFonts.inter(
        fontSize: 14,
        height: 1.7,
        color: const Color(0xff262626),
      ),
    );
  }

  Widget bulletText(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 6),
            child: Text(
              "•",
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
          ),

          const SizedBox(width: 8),

          Expanded(
            child: Text(
              text,
              style: GoogleFonts.inter(
                fontSize: 14,
                height: 1.6,
                color: const Color(0xff262626),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

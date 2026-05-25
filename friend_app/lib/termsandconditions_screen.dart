import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TermsandconditionsScreen extends StatefulWidget {
  const TermsandconditionsScreen({super.key});

  @override
  State<TermsandconditionsScreen> createState() =>
      _TermsandconditionsScreenState();
}

class _TermsandconditionsScreenState
    extends State<TermsandconditionsScreen> {
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
                      "Terms & Conditions",
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
                  headingText("Acceptance of Terms"),
      
                  const SizedBox(height: 10),
      
                  bodyText(
                    "By accessing or using this app, you agree to be bound by these Terms and Conditions and our Privacy Policy. If you do not agree, you may not use the app.",
                  ),
      
                  const SizedBox(height: 24),
      
                  headingText("Eligibility"),
      
                  const SizedBox(height: 10),
      
                  bulletText(
                    "You must be at least 18 years old.",
                  ),
      
                  bulletText(
                    "You must not be prohibited by law from using our services.",
                  ),
      
                  bulletText(
                    "You agree that your account represents a real person and not a bot or fake identity.",
                  ),
      
                  const SizedBox(height: 24),
      
                  headingText("Account Registration"),
      
                  const SizedBox(height: 10),
      
                  bulletText(
                    "You are responsible for maintaining the confidentiality of your login credentials.",
                  ),
      
                  bulletText(
                    "You agree to provide accurate and updated information.",
                  ),
      
                  bulletText(
                    "We reserve the right to suspend or terminate accounts that violate our policies.",
                  ),
      
                  const SizedBox(height: 24),
      
                  headingText("User Conduct"),
      
                  const SizedBox(height: 10),
      
                  bodyText("You agree not to:"),
      
                  const SizedBox(height: 10),
      
                  bulletText(
                    "Use the app for illegal or harmful purposes.",
                  ),
      
                  bulletText(
                    "Harass, abuse, or send explicit content without consent.",
                  ),
      
                  bulletText(
                    "Post or transmit spam, scams, or misleading content.",
                  ),
      
                  bulletText(
                    "Impersonate others or misrepresent your identity.",
                  ),
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
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: Colors.black,
      ),
    );
  }

  Widget bodyText(String text) {
    return Text(
      text,
      style: GoogleFonts.inter(
        fontSize: 14,
        height: 1.8,
        color: const Color(0xff262626),
      ),
    );
  }

  Widget bulletText(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 6),
            child: Text(
              "•",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ),

          const SizedBox(width: 8),

          Expanded(
            child: Text(
              text,
              style: GoogleFonts.inter(
                fontSize: 14,
                height: 1.7,
                color: const Color(0xff262626),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isOtpScreen = false;

  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();
  final FocusNode focusNode3 = FocusNode();
  final FocusNode focusNode4 = FocusNode();

  int seconds = 60;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (seconds == 0) {
        t.cancel();
      } else {
        setState(() {
          seconds--;
        });
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  // ADD THIS VARIABLE INSIDE _LoginScreenState

  List<String> topImages = [
    "assets/images/Loginimage1.png",
    "assets/images/loginimage2.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,

        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFF07038D),
              const Color(0xFF131055),
              const Color(0xFF120F70),
            ],
          ),
        ),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              // TOP SECTION
              Container(
                height: MediaQuery.of(context).size.height * 0.52,
                width: double.infinity,
                padding: const EdgeInsets.only(top: 60, left: 24, right: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (isOtpScreen)
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isOtpScreen = false;
                          });
                        },
                        child: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    const Spacer(),

                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 400),

                      child: Container(
                        key: ValueKey(isOtpScreen),

                        height: 300,
                        width: double.infinity,

                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              isOtpScreen ? topImages[1] : topImages[0],
                            ),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Center(
                      child: Text(
                        isOtpScreen
                            ? 'Match • Connect • Talk'
                            : 'Connect Instantly. Talk Freely.',
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),

              // BOTTOM LOGIN SECTION
              // BOTTOM LOGIN SECTION
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 355,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 30,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: !isOtpScreen
                          ? _buildLoginPhoneScreen()
                          : _buildOtpScreen(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoginPhoneScreen() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      key: const ValueKey(1),
      children: [
        // QUICK LOGIN BUTTON
        Container(
          height: 46,
          width: 216,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.black,
          ),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.flash_on, color: Colors.yellow, size: 20),
                const SizedBox(width: 8),
                Text(
                  'Quick Log In',
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 20),

        // OR LINE
        Row(
          children: [
            Expanded(child: Divider(color: Colors.grey.withOpacity(0.3))),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                'or',
                style: GoogleFonts.inter(color: Colors.grey, fontSize: 14),
              ),
            ),
            Expanded(child: Divider(color: Colors.grey.withOpacity(0.3))),
          ],
        ),

        const SizedBox(height: 20),

        // PHONE FIELD
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          height: 55,
          width:269,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.withOpacity(0.4)),
            color: Colors.white,
          ),
          child: Row(
            children: [
              Row(
                children: [
                  Text(
                    '🇮🇳 +91',
                    style: GoogleFonts.inter(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Icon(
                    Icons.keyboard_arrow_down,
                    size: 18,
                    color: Colors.grey,
                  ),
                ],
              ),
              const SizedBox(width: 10),
              Container(
                height: 25,
                width: 1,
                color: Colors.grey.withOpacity(0.4),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  style: GoogleFonts.inter(color: Colors.black),
                  decoration: InputDecoration(
                    counterText: "",
                    border: InputBorder.none,
                    hintText: 'Enter Phone Number',
                    hintStyle: GoogleFonts.inter(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 20),

        /// CONTINUE BUTTON
        GestureDetector(
          onTap: () {
            setState(() {
              isOtpScreen = true;
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

        const SizedBox(height: 20),
        Text(
          "By continuing, you agree to our Terms of\nServices & Privacy Policy",
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(color: Colors.grey, fontSize: 11),
        ),
        // const SizedBox(height: 10),
      ],
    );
  }

  Widget _buildOtpScreen() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      key: const ValueKey(2),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Enter Verification Code",
          style: GoogleFonts.inter(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "Enter the 4-digit verification code sent to this\nxxxxx26542 to proceed",
          style: GoogleFonts.inter(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 30),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            otpBox(focusNode: focusNode1, nextFocus: focusNode2),
            otpBox(
              focusNode: focusNode2,
              nextFocus: focusNode3,
              previousFocus: focusNode1,
            ),
            otpBox(
              focusNode: focusNode3,
              nextFocus: focusNode4,
              previousFocus: focusNode2,
            ),
            otpBox(focusNode: focusNode4, previousFocus: focusNode3),
          ],
        ),

        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Resend OTP",
              style: GoogleFonts.inter(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              seconds == 0
                  ? "00:00 Min"
                  : "00:${seconds.toString().padLeft(2, '0')} Min",
              style: GoogleFonts.inter(
                color: Color(0xffF94747),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),

        Center(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RegisterScreen()),
              );
            },
            child: Container(
              height: 44,
              width: 254,
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
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget otpBox({
    required FocusNode focusNode,
    FocusNode? nextFocus,
    FocusNode? previousFocus,
  }) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey.withOpacity(0.4)),
        color: Colors.transparent,
      ),
      child: Center(
        child: TextField(
          focusNode: focusNode,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          maxLength: 1,
          style: GoogleFonts.inter(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
          decoration: const InputDecoration(
            counterText: "",
            border: InputBorder.none,
          ),
          onChanged: (value) {
            if (value.length == 1 && nextFocus != null) {
              FocusScope.of(context).requestFocus(nextFocus);
            }
            if (value.isEmpty && previousFocus != null) {
              FocusScope.of(context).requestFocus(previousFocus);
            }
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),

      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),

        child: Column(
          children: [
            /// ================= TOP SECTION =================
            Container(
              width: double.infinity,
              height: 289,

              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,

                  stops: [0.0, 0.5, 1.0],

                  colors: [
                    Color(0xFF07038D),
                    Color(0xFF131055),
                    Color(0xFF120F70),
                  ],
                ),

                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(28),
                  bottomRight: Radius.circular(28),
                ),
              ),

              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),

                child: Column(
                  children: [
                    const SizedBox(height: 30),

                    /// TOP BAR
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 18,
                        ),

                        Container(
                          height: 42,
                          width: 42,

                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(.20),
                            shape: BoxShape.circle,
                          ),

                          child: const Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 6),

                    /// PROFILE IMAGE
                    Stack(
                      children: [
                        Container(
                          height: 92,
                          width: 96,

                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 3),

                            image: const DecorationImage(
                              image: NetworkImage(
                                "https://images.unsplash.com/photo-1494790108377-be9c29b29330",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        Positioned(
                          bottom: 0,
                          right: 0,

                          child: Container(
                            height: 24,
                            width: 24,

                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Color(0xff120B84),
                                width: 2,
                              ),
                            ),

                            child: const Icon(
                              Icons.camera_alt,
                              size: 13,
                              color: Color(0xff120B84),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    /// NAME
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Stella",
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),

                        const SizedBox(width: 8),

                        Container(
                          height: 26,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 3,
                          ),

                          decoration: BoxDecoration(
                            color: const Color(0xffB83AF3),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white),
                          ),

                          child: Row(
                            children: [
                              const Icon(
                                Icons.favorite_border,
                                color: Colors.white,
                                size: 12,
                              ),

                              const SizedBox(width: 4),

                              Text(
                                "Level 6",
                                style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    /// ID BOX
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 8,
                      ),

                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.12),
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: Colors.white.withOpacity(.15),
                        ),
                      ),

                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "ID: 2847563",
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),

                          const SizedBox(width: 6),

                          const Icon(Icons.copy, color: Colors.white, size: 14),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 14),

            /// ================= WALLET CARD =================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),

              child: Container(
                width: double.infinity,
                height: 120,

                padding: const EdgeInsets.symmetric(horizontal: 18),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),

                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xff7E6450), Color(0xffE7AA7C)],
                  ),
                ),

                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text(
                          "My Wallet",
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        const SizedBox(height: 4),

                        Text(
                          "2,450",
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),

                        Text(
                          "Coins",
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),

                    const Spacer(),

                    const Icon(
                      Icons.account_balance_wallet_rounded,
                      color: Colors.white,
                      size: 48,
                    ),

                    const SizedBox(width: 12),

                    const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 22,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 14),

            /// ================= MENU =================
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 18),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),

              child: Column(
                children: [
                  buildMenuItem(
                    icon: Icons.star,
                    title: "Host Create",
                    iconBg: const Color(0xff2D1BB3),
                  ),

                  buildMenuItem(icon: Icons.history, title: "Call History"),

                  buildMenuItem(icon: Icons.language, title: "Language"),

                  buildMenuItem(icon: Icons.people, title: "Followers"),

                  buildMenuItem(icon: Icons.photo_library, title: "My Gallery"),

                  buildMenuItem(icon: Icons.block, title: "Blocked Users"),

                  buildMenuItem(
                    icon: Icons.support_agent,
                    title: "Help & Support",
                  ),

                  buildMenuItem(icon: Icons.settings, title: "Settings"),
                ],
              ),
            ),

            const SizedBox(height: 18),

            /// DELETE ACCOUNT
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: const Color(0xFF1D1678),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                children: [
                  // Delete Account
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 18,
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 34,
                          width: 34,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(
                            Icons.delete,
                            color: Color(0xFF1D1678),
                            size: 18,
                          ),
                        ),

                        const SizedBox(width: 14),

                        Expanded(
                          child: Text(
                            "Delete Account",
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),

                        const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                          size: 16,
                        ),
                      ],
                    ),
                  ),

                  Container(height: 1, color: Colors.white24),

                  // Log Out
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 18,
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 34,
                          width: 34,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(
                            Icons.logout,
                            color: Color(0xFF1D1678),
                            size: 18,
                          ),
                        ),

                        const SizedBox(width: 14),

                        Expanded(
                          child: Text(
                            "Log Out",
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),

                        const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  /// ================= REUSABLE MENU WIDGET =================
  Widget buildMenuItem({
    required IconData icon,
    required String title,
    Color iconBg = const Color(0xffEFEFEF),
  }) {
    return Container(
      height: 74,
      padding: const EdgeInsets.symmetric(horizontal: 14),

      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),

      child: Row(
        children: [
          Container(
            height: 32,
            width: 32,

            decoration: BoxDecoration(
              color: iconBg,
              borderRadius: BorderRadius.circular(10),
            ),

            child: Icon(
              icon,
              color: iconBg == const Color(0xff2D1BB3)
                  ? Colors.white
                  : Colors.grey.shade700,
              size: 18,
            ),
          ),

          const SizedBox(width: 14),

          Text(
            title,
            style: GoogleFonts.inter(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),

          const Spacer(),

          Icon(Icons.arrow_forward_ios, color: Colors.grey.shade400, size: 14),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RechargeScreen extends StatelessWidget {
  const RechargeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Column(
        children: [
          /// TOP BAR
          Container(
            height: 118,
            width: double.infinity,

            decoration: const BoxDecoration(color: Color(0xff0E008F)),

            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),

                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 18,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),

                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          Text(
                            "Recharge",
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          // Transform.translate(
                          //   offset: const Offset(0, -2),

                          // child: Text(
                          //   "More Packs",
                          //   style: GoogleFonts.inter(
                          //     color: const Color(0xffFFD400),
                          //     fontSize: 26,
                          //     fontWeight: FontWeight.w700,
                          //   ),
                          // ),
                          // ),
                        ],
                      ),
                    ),

                    /// COIN COUNT
                    Container(
                      height: 28,

                      padding: const EdgeInsets.symmetric(horizontal: 8),

                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(20),
                      ),

                      child: Row(
                        children: [
                          FaIcon(
                            FontAwesomeIcons.coins,
                            color: Color(0xffFFD700),
                            size: 15,
                          ),

                          const SizedBox(width: 3),

                          Text(
                            "1,250",
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          /// BODY
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),

              child: Column(
                children: [
                  /// GRID
                  GridView.count(
                    crossAxisCount: 3,
                    shrinkWrap: true,

                    physics: const NeverScrollableScrollPhysics(),

                    crossAxisSpacing: 10,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.70,

                    children: [
                      buildPackCard(coins: "50 Coins", price: "₹199"),

                      buildPackCard(coins: "70 Coins", price: "₹299"),

                      buildPackCard(coins: "80 Coins", price: "₹599"),

                      buildPackCard(coins: "90 Coins", price: "₹799"),

                      buildPackCard(coins: "100 Coins", price: "₹899"),

                      buildPackCard(coins: "150 Coins", price: "₹999"),
                    ],
                  ),

                  const SizedBox(height: 24),

                  /// PREMIUM TITLE
                  Text(
                    "Premium Packages",
                    style: GoogleFonts.inter(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                    ),
                  ),

                  const SizedBox(height: 14),

                  /// PREMIUM CARD
                  Container(
                    height: 235,
                    width: double.infinity,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),

                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xff000000),
                          Color(0xff151515),
                          Color(0xff2B1A00),
                        ],
                      ),
                    ),

                    child: Stack(
                      children: [
                        /// CROWN
                        Positioned(
                          top: 10,
                          left: 0,
                          right: 0,

                          child: Center(
                            child: Icon(
                              Icons.workspace_premium,
                              size: 70,
                              color: Colors.amber.shade400,
                            ),
                          ),
                        ),

                        /// GOLD LINE
                        Positioned(
                          top: 72,
                          left: 25,
                          right: 25,

                          child: Container(
                            height: 2,

                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.transparent,
                                  Color(0xffFFD700),
                                  Colors.transparent,
                                ],
                              ),
                            ),
                          ),
                        ),

                        /// LEFT BOX
                        Positioned(
                          left: 20,
                          bottom: 30,

                          child: Container(
                            width: 120,
                            height: 110,

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),

                              border: Border.all(
                                color: const Color(0xffFFB800),
                                width: 2,
                              ),
                            ),

                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,

                              children: [
                                Text(
                                  "1000\nCoins",
                                  textAlign: TextAlign.center,

                                  style: GoogleFonts.inter(
                                    color: Colors.white,

                                    fontSize: 28,

                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                const SizedBox(height: 8),

                                Text(
                                  "₹1299",
                                  style: GoogleFonts.inter(
                                    color: Colors.white70,

                                    fontSize: 18,

                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        /// RIGHT PRICE
                        Positioned(
                          right: 20,
                          bottom: 55,

                          child: Column(
                            children: [
                              const Icon(
                                Icons.monetization_on,
                                color: Colors.amber,
                                size: 36,
                              ),

                              const SizedBox(height: 4),

                              Text(
                                "₹1199",
                                style: GoogleFonts.inter(
                                  color: Colors.amber,

                                  fontSize: 32,

                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 4),

                              Text(
                                "Save ₹300",
                                style: GoogleFonts.inter(
                                  color: Colors.yellow,

                                  fontSize: 14,

                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),

                        /// RED RIBBON
                        Positioned(
                          left: 0,
                          bottom: 0,

                          child: Container(
                            width: 80,
                            height: 70,

                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xff7A0000), Color(0xffD10000)],
                              ),

                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(60),
                                bottomLeft: Radius.circular(16),
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
          ),
        ],
      ),
    );
  }

  /// SMALL RECHARGE CARDS
  /// SMALL RECHARGE CARDS
  Widget buildPackCard({required String coins, required String price}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),

        /// IMAGE AS FULL BACKGROUND
        image: const DecorationImage(
          image: AssetImage("assets/images/rechargebackground.png"),
          fit: BoxFit.cover,
        ),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.18),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),

      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),

          /// DARK OVERLAY
          color: Colors.black.withOpacity(0.15),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 8),

            /// COIN ICON
            FaIcon(FontAwesomeIcons.coins, color: Color(0xffFFD700), size: 34),

            const SizedBox(height: 8),

            /// COIN TEXT
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),

              decoration: BoxDecoration(
                color: const Color(0xffFFD400),
                borderRadius: BorderRadius.circular(20),
              ),

              child: Text(
                coins,
                style: GoogleFonts.inter(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ),

            const SizedBox(height: 8),

            /// PRICE
            Text(
              price,
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// GOLD DOT
  Widget dot() {
    return Container(
      height: 4,
      width: 4,

      decoration: const BoxDecoration(
        color: Colors.amber,
        shape: BoxShape.circle,
      ),
    );
  }
}

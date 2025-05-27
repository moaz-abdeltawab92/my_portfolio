import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/Responsive/responsive.dart';
import 'dart:ui';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.isMobile(context) ? 20 : 80,
      ),
      child: Column(
        children: [
          Text(
            "About Me",
            style: GoogleFonts.poppins(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white,
                  Colors.grey.shade50,
                ],
              ),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.grey.shade200,
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 15,
                  offset: const Offset(0, 3),
                ),
                BoxShadow(
                  color: Colors.grey.withOpacity(0.05),
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "I'm Moaz Ayman, a Flutter developer passionate about building smooth, user-friendly, and high-performance mobile applications.",
                        style: GoogleFonts.cairo(
                          fontSize: Responsive.isMobile(context) ? 16 : 18,
                          height: 1.6,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "I specialize in Flutter, Dart, Firebase, API integration, UI/UX design, and state management, with a focus on writing clean code and delivering great user experiences.",
                        style: GoogleFonts.cairo(
                          fontSize: Responsive.isMobile(context) ? 16 : 18,
                          height: 1.6,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "I'm always eager to learn, grow, and collaborate on exciting projects.  I'm currently open to internships, part-time roles, and freelance projects in mobile app development.",
                        style: GoogleFonts.cairo(
                          fontSize: Responsive.isMobile(context) ? 16 : 18,
                          height: 1.6,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Thanks for visiting and feel free to explore my work and reach out if you'd like to connect or collaborate",
                        style: GoogleFonts.cairo(
                          fontSize: Responsive.isMobile(context) ? 16 : 18,
                          height: 1.6,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

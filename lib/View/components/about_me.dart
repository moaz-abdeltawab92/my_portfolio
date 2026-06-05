import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/Responsive/responsive.dart';
import 'package:portfolio_website/models/project_model.dart';
import 'dart:ui';
import 'package:animate_do/animate_do.dart';
import 'package:visibility_detector/visibility_detector.dart';

class AboutMe extends StatefulWidget {
  const AboutMe({super.key});

  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key('about-me-section'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.3 && !_isVisible) {
          setState(() {
            _isVisible = true;
          });
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Responsive.isMobile(context) ? 20 : 80,
        ),
        child: Column(
          children: [
            FadeInDown(
              animate: _isVisible,
              duration: const Duration(milliseconds: 800),
              child: Text(
                "About Me",
                style: GoogleFonts.poppins(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 30),
            FadeInUp(
              animate: _isVisible,
              delay: const Duration(milliseconds: 300),
              duration: const Duration(milliseconds: 1000),
              child: Container(
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
                          FadeInLeft(
                            animate: _isVisible,
                            delay: const Duration(milliseconds: 500),
                            child: Text(
                              "I'm Moaz Ayman, a Flutter developer passionate about building smooth, user-friendly, and high-performance mobile applications.",
                              style: GoogleFonts.cairo(
                                fontSize:
                                    Responsive.isMobile(context) ? 16 : 18,
                                height: 1.6,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          FadeInLeft(
                            animate: _isVisible,
                            delay: const Duration(milliseconds: 700),
                            child: Text(
                              "With around 1.5 years of hands-on experience, I've worked on a wide range of freelance projects — restaurant systems, booking apps, POS dashboards, education platforms, and more. So far, I've published $playStoreAppsCount apps on Google Play and $appStoreAppsCount on the Apple App Store, with ${projects.length}+ projects in my portfolio.",
                              style: GoogleFonts.cairo(
                                fontSize:
                                    Responsive.isMobile(context) ? 16 : 18,
                                height: 1.6,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          FadeInLeft(
                            animate: _isVisible,
                            delay: const Duration(milliseconds: 900),
                            child: Text(
                              "My core stack includes Flutter & Dart (Responsive & Adaptive UI), BLoC/Provider state management, Clean Architecture & MVVM, API integration with Dio/HTTP, and Firebase (Authentication, Firestore, FCM). I also work with Hive & Shared Preferences, follow OOP & SOLID principles, and build multilingual apps (Arabic & English) with Material Design, animations, and dark mode.",
                              style: GoogleFonts.cairo(
                                fontSize:
                                    Responsive.isMobile(context) ? 16 : 18,
                                height: 1.6,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          FadeInLeft(
                            animate: _isVisible,
                            delay: const Duration(milliseconds: 1100),
                            child: Text(
                              "I handle Android & iOS app publishing, release management, OTA updates with Shorebird, and production monitoring with Sentry. I'm also experienced with Flutter DevTools, Git/GitHub, and collaboration tools like Trello, Slack, and Jira.",
                              style: GoogleFonts.cairo(
                                fontSize:
                                    Responsive.isMobile(context) ? 16 : 18,
                                height: 1.6,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          FadeInLeft(
                            animate: _isVisible,
                            delay: const Duration(milliseconds: 1300),
                            child: Text(
                              "I'm always eager to learn, grow, and collaborate on exciting projects. I'm currently open to internships, part-time roles, and freelance projects in mobile app development.",
                              style: GoogleFonts.cairo(
                                fontSize:
                                    Responsive.isMobile(context) ? 16 : 18,
                                height: 1.6,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          FadeInLeft(
                            animate: _isVisible,
                            delay: const Duration(milliseconds: 1500),
                            child: Text(
                              "Thanks for visiting — feel free to explore my work and reach out if you'd like to connect or collaborate.",
                              style: GoogleFonts.cairo(
                                fontSize:
                                    Responsive.isMobile(context) ? 16 : 18,
                                height: 1.6,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

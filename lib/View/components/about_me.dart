import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/Responsive/responsive.dart';
import 'package:portfolio_website/Utils/colors.dart';
import 'package:portfolio_website/models/project_model.dart';
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
    final isMobile = Responsive.isMobile(context);

    return VisibilityDetector(
      key: const Key('about-me-section'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.2 && !_isVisible) {
          setState(() {
            _isVisible = true;
          });
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 20 : 60,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section Title
            FadeInDown(
              animate: _isVisible,
              duration: const Duration(milliseconds: 600),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      "About Me",
                      style: GoogleFonts.poppins(
                        fontSize: isMobile ? 26 : 34,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Container(
                      width: 50,
                      height: 4,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),

            // Open Storyline Layout (2 Columns on Desktop, 1 Column on Mobile)
            LayoutBuilder(
              builder: (context, constraints) {
                if (isMobile) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildNarrativeSection(isMobile),
                      const SizedBox(height: 35),
                      _buildHighlightsSection(isMobile),
                    ],
                  );
                }

                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 6,
                      child: _buildNarrativeSection(isMobile),
                    ),
                    const SizedBox(width: 50),
                    Expanded(
                      flex: 5,
                      child: _buildHighlightsSection(isMobile),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNarrativeSection(bool isMobile) {
    return FadeInLeft(
      animate: _isVisible,
      duration: const Duration(milliseconds: 700),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Sub-heading
          Text(
            "Passionate Mobile Engineer Crafting Production Apps",
            style: GoogleFonts.poppins(
              fontSize: isMobile ? 20 : 24,
              fontWeight: FontWeight.bold,
              color: textColor,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 16),

          // Open Accent Narrative Line
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Vertical Gradient Accent Line
              Container(
                width: 4,
                height: 160,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      primaryColor,
                      secondaryColor,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "I'm Moaz Ayman, a dedicated Flutter Developer with around 2 years of hands-on experience building high-performance, user-friendly mobile applications.",
                      style: GoogleFonts.nunito(
                        fontSize: isMobile ? 15 : 16,
                        height: 1.6,
                        fontWeight: FontWeight.w600,
                        color: textColor.withOpacity(0.85),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "My core focus is on Clean Architecture, BLoC/Cubit state management, RESTful APIs, and smooth UI animations. I've successfully published $playStoreAppsCount apps on Google Play and $appStoreAppsCount apps on App Store.",
                      style: GoogleFonts.nunito(
                        fontSize: isMobile ? 15 : 16,
                        height: 1.6,
                        fontWeight: FontWeight.w600,
                        color: textColor.withOpacity(0.85),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 28),

          // Minimal Quick Facts Badges (Unboxed Floating Pills)
          Text(
            "Quick Overview",
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          const SizedBox(height: 12),
          const Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              _MinimalPill(
                icon: Icons.school_outlined,
                label: "B.Sc. in Information Technology",
                color: Color(0xFF8B5CF6),
              ),
              _MinimalPill(
                icon: Icons.verified_user_outlined,
                label: "Military: Exempted",
                color: Color(0xFF2563EB),
              ),
              _MinimalPill(
                icon: Icons.location_on_outlined,
                label: "Cairo, Egypt",
              ),
              _MinimalPill(
                icon: Icons.work_outline_rounded,
                label: "2+ Years Exp.",
              ),
              _MinimalPill(
                icon: Icons.language_rounded,
                label: "Arabic & English",
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHighlightsSection(bool isMobile) {
    return FadeInRight(
      animate: _isVisible,
      duration: const Duration(milliseconds: 700),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Engineering Strengths",
            style: GoogleFonts.poppins(
              fontSize: isMobile ? 20 : 22,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          const SizedBox(height: 16),
          const _UnboxedBulletItem(
            icon: Icons.storefront_rounded,
            iconColor: Color(0xFF10B981),
            title: "Live Production Apps",
            description:
                "Published & actively managing production apps on Google Play & App Store.",
          ),
          const SizedBox(height: 16),
          const _UnboxedBulletItem(
            icon: Icons.layers_outlined,
            iconColor: primaryColor,
            title: "Clean Architecture & Scalability",
            description:
                "Decoupled, testable codebases built with BLoC/Cubit, MVVM, and SOLID principles.",
          ),
          const SizedBox(height: 16),
          const _UnboxedBulletItem(
            icon: Icons.offline_bolt_outlined,
            iconColor: Color(0xFFF59E0B),
            title: "Instant OTA & Crash Tracking",
            description:
                "Shorebird live code push patches and Sentry real-time production error monitoring.",
          ),
          const SizedBox(height: 16),
          const _UnboxedBulletItem(
            icon: Icons.groups_outlined,
            iconColor: Color(0xFF3B82F6),
            title: "Agile & Team Collaboration",
            description:
                "Collaborative workflow with Git/GitHub, Jira, Trello, and Slack.",
          ),
        ],
      ),
    );
  }
}

class _MinimalPill extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color? color;

  const _MinimalPill({
    required this.icon,
    required this.label,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final activeColor = color ?? primaryColor;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: activeColor.withOpacity(0.08),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: activeColor.withOpacity(0.25),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 15,
            color: activeColor,
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: GoogleFonts.nunito(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}

class _UnboxedBulletItem extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String description;

  const _UnboxedBulletItem({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: iconColor.withOpacity(0.12),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            color: iconColor,
            size: 22,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: GoogleFonts.nunito(
                  fontSize: 14,
                  height: 1.5,
                  fontWeight: FontWeight.w600,
                  color: textColor.withOpacity(0.7),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}



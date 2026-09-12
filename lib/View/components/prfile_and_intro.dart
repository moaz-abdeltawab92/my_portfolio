import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/Responsive/responsive.dart';
import 'package:portfolio_website/Utils/colors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class ProfileAndIntro extends StatefulWidget {
  const ProfileAndIntro({super.key});

  @override
  State<ProfileAndIntro> createState() => _ProfileAndIntroState();
}

class _ProfileAndIntroState extends State<ProfileAndIntro>
    with SingleTickerProviderStateMixin {
  late AnimationController _gradientController;
  bool _isCvHovered = false;

  @override
  void initState() {
    super.initState();
    _gradientController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();
  }

  @override
  void dispose() {
    _gradientController.dispose();
    super.dispose();
  }

  void _launchURL() async {
    final Uri url = Uri.parse(
        "https://drive.google.com/file/d/17AMbacPQ9w8uZ2i8676NN6_TzCCJtbQK/view");
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw "Could not launch $url";
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Padding(
      padding: EdgeInsets.only(
        top: isMobile ? 30 : 60,
        left: isMobile ? 16 : 40,
        right: isMobile ? 16 : 40,
      ),
      child: Column(
        children: [
          // Main Hero Section
          Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 50,
            runSpacing: 30,
            children: [
              // Intro Content Box
              FadeInLeft(
                duration: const Duration(milliseconds: 1000),
                child: SizedBox(
                  width: isMobile
                      ? Responsive.widthOfScreen(context)
                      : Responsive.widthOfScreen(context) * 0.48,
                  child: Column(
                    crossAxisAlignment: isMobile
                        ? CrossAxisAlignment.center
                        : CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Status Badges
                      FadeInDown(
                        delay: const Duration(milliseconds: 200),
                        child: Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          alignment: isMobile
                              ? WrapAlignment.center
                              : WrapAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              decoration: BoxDecoration(
                                color: primaryColor.withOpacity(0.12),
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                  color: primaryColor.withOpacity(0.3),
                                  width: 1,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: 10,
                                    height: 10,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF10B981),
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0xFF10B981),
                                          blurRadius: 6,
                                          spreadRadius: 1,
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    "Available for Freelance, Part-Time & Full-Time",
                                    style: GoogleFonts.nunito(
                                      fontSize: isMobile ? 12 : 14,
                                      fontWeight: FontWeight.w700,
                                      color: textColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              decoration: BoxDecoration(
                                color:
                                    const Color(0xFF2563EB).withOpacity(0.12),
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                  color:
                                      const Color(0xFF2563EB).withOpacity(0.3),
                                  width: 1,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(
                                    Icons.verified_user_rounded,
                                    size: 16,
                                    color: Color(0xFF2563EB),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    "Military Status: Exempted",
                                    style: GoogleFonts.nunito(
                                      fontSize: isMobile ? 12 : 14,
                                      fontWeight: FontWeight.w700,
                                      color: textColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              decoration: BoxDecoration(
                                color:
                                    const Color(0xFF8B5CF6).withOpacity(0.12),
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                  color:
                                      const Color(0xFF8B5CF6).withOpacity(0.3),
                                  width: 1,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(
                                    Icons.school_rounded,
                                    size: 16,
                                    color: Color(0xFF8B5CF6),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    "B.Sc. in Information Technology",
                                    style: GoogleFonts.nunito(
                                      fontSize: isMobile ? 12 : 14,
                                      fontWeight: FontWeight.w700,
                                      color: textColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Main Title
                      FadeInDown(
                        delay: const Duration(milliseconds: 300),
                        child: Text(
                          "Hello, I'm Moaz Ayman 👋",
                          textAlign:
                              isMobile ? TextAlign.center : TextAlign.start,
                          style: GoogleFonts.poppins(
                            fontSize: isMobile ? 32 : 46,
                            fontWeight: FontWeight.bold,
                            color: textColor,
                            height: 1.2,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),

                      // Dynamic Role Title
                      FadeInUp(
                        delay: const Duration(milliseconds: 500),
                        child: AnimatedTextKit(
                          animatedTexts: [
                            TypewriterAnimatedText(
                              "Flutter & Mobile Application Developer",
                              textStyle: GoogleFonts.nunito(
                                fontSize: isMobile ? 20 : 26,
                                fontWeight: FontWeight.w800,
                                color: primaryColor,
                              ),
                              speed: const Duration(milliseconds: 60),
                            ),
                            TypewriterAnimatedText(
                              "2+ Years Building Real Production Apps",
                              textStyle: GoogleFonts.nunito(
                                fontSize: isMobile ? 20 : 26,
                                fontWeight: FontWeight.w800,
                                color: primaryColor,
                              ),
                              speed: const Duration(milliseconds: 60),
                            ),
                            TypewriterAnimatedText(
                              "Published on Google Play & App Store",
                              textStyle: GoogleFonts.nunito(
                                fontSize: isMobile ? 20 : 26,
                                fontWeight: FontWeight.w800,
                                color: primaryColor,
                              ),
                              speed: const Duration(milliseconds: 60),
                            ),
                          ],
                          repeatForever: true,
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Sub-description
                      FadeInUp(
                        delay: const Duration(milliseconds: 700),
                        child: Text(
                          "Passionate about creating modern, high-performance cross-platform mobile apps with Clean Architecture, state management (Cubit/Bloc), and smooth UI/UX design.",
                          textAlign:
                              isMobile ? TextAlign.center : TextAlign.start,
                          style: GoogleFonts.cairo(
                            fontSize: isMobile ? 15 : 17,
                            color: textColor.withOpacity(0.8),
                            height: 1.6,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(height: 28),

                      // Action Buttons
                      FadeInUp(
                        delay: const Duration(milliseconds: 900),
                        child: Wrap(
                          spacing: 16,
                          runSpacing: 12,
                          alignment: isMobile
                              ? WrapAlignment.center
                              : WrapAlignment.start,
                          children: [
                            MouseRegion(
                              onEnter: (_) =>
                                  setState(() => _isCvHovered = true),
                              onExit: (_) =>
                                  setState(() => _isCvHovered = false),
                              child: AnimatedScale(
                                scale: _isCvHovered ? 1.04 : 1.0,
                                duration: const Duration(milliseconds: 200),
                                child: ElevatedButton.icon(
                                  onPressed: _launchURL,
                                  icon: const Icon(Icons.description_outlined,
                                      size: 22),
                                  label: Text(
                                    "Download / View CV",
                                    style: GoogleFonts.nunito(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: primaryColor,
                                    foregroundColor: Colors.white,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 28, vertical: 18),
                                    elevation: _isCvHovered ? 8 : 4,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
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

              // Profile Avatar Card
              FadeInRight(
                duration: const Duration(milliseconds: 1000),
                child: SizedBox(
                  width:
                      isMobile ? Responsive.widthOfScreen(context) * 0.8 : 360,
                  height:
                      isMobile ? Responsive.widthOfScreen(context) * 0.8 : 360,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Rotating Gradient Ring
                      AnimatedBuilder(
                        animation: _gradientController,
                        builder: (context, child) {
                          return Container(
                            width: double.infinity,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: SweepGradient(
                                colors: const [
                                  primaryColor,
                                  secondaryColor,
                                  primaryColor,
                                ],
                                stops: const [0.0, 0.5, 1.0],
                                transform: GradientRotation(
                                    _gradientController.value * 2 * 3.14159),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: primaryColor.withOpacity(0.35),
                                  blurRadius: 20,
                                  spreadRadius: 4,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      // Inner Frame & Image
                      Container(
                        margin: const EdgeInsets.all(6),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: cardColor,
                        ),
                        padding: const EdgeInsets.all(6),
                        child: ClipOval(
                          child: Image.asset(
                            "asset/images/3.jpg",
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 50),

          // Quick Stats Counter Section
          FadeInUp(
            delay: const Duration(milliseconds: 1000),
            child: Container(
              width: isMobile ? double.infinity : 850,
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: shadoColor.withOpacity(0.3),
                    blurRadius: 16,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: const Wrap(
                alignment: WrapAlignment.spaceAround,
                spacing: 30,
                runSpacing: 20,
                children: [
                  _StatItem(
                    number: "2+",
                    label: "Years Experience",
                    icon: Icons.work_history_outlined,
                  ),
                  _StatItem(
                    number: "10+",
                    label: "Projects Completed",
                    icon: Icons.apps_rounded,
                  ),
                  _StatItem(
                    number: "9+",
                    label: "Live Store Apps",
                    icon: Icons.storefront_rounded,
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

class _StatItem extends StatelessWidget {
  final String number;
  final String label;
  final IconData icon;

  const _StatItem({
    required this.number,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: primaryColor.withOpacity(0.12),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            color: primaryColor,
            size: 28,
          ),
        ),
        const SizedBox(width: 14),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              number,
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            Text(
              label,
              style: GoogleFonts.nunito(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: textColor.withOpacity(0.7),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

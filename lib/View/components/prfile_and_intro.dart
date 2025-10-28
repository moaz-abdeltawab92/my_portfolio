import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/Responsive/responsive.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:shimmer/shimmer.dart';

class ProfileAndIntro extends StatefulWidget {
  const ProfileAndIntro({super.key});

  @override
  State<ProfileAndIntro> createState() => _ProfileAndIntroState();
}

class _ProfileAndIntroState extends State<ProfileAndIntro>
    with SingleTickerProviderStateMixin {
  late AnimationController _gradientController;
  bool _isButtonHovered = false;

  @override
  void initState() {
    super.initState();
    _gradientController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
  }

  @override
  void dispose() {
    _gradientController.dispose();
    super.dispose();
  }

  void _launchURL() async {
    final Uri url = Uri.parse(
        "https://drive.google.com/file/d/1JMOrh2ipQp0ksjfpHTvcrJu0UlVub5-p/view?usp=sharing");
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw "Could not launch $url";
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 70,
        ),
        child: Column(
          children: [
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 50,
              runSpacing: 20,
              children: [
                // Intro Card with animations
                FadeInLeft(
                  duration: const Duration(milliseconds: 1000),
                  child: SizedBox(
                    width: Responsive.isMobile(context)
                        ? Responsive.widthOfScreen(context)
                        : Responsive.widthOfScreen(context) / 2,
                    child: Center(
                      child: SizedBox(
                        height: 300,
                        width: Responsive.isMobile(context)
                            ? Responsive.widthOfScreen(context) * 0.85
                            : 450,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 8,
                                spreadRadius: 5,
                              ),
                            ],
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                FadeInDown(
                                  delay: const Duration(milliseconds: 300),
                                  child: Text(
                                    "Hello!",
                                    style: TextStyle(
                                      fontSize: Responsive.isMobile(context)
                                          ? 36
                                          : 40,
                                      color: const Color(0xffAF8F6F),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                FadeInUp(
                                  delay: const Duration(milliseconds: 500),
                                  child: AnimatedTextKit(
                                    animatedTexts: [
                                      TypewriterAnimatedText(
                                        "I'm Moaz Ayman,\na Passionate Mobile App Developer,\nSpecializing in Flutter App Development.",
                                        textStyle: GoogleFonts.cairo(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        speed: const Duration(milliseconds: 50),
                                      ),
                                    ],
                                    totalRepeatCount: 1,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                FadeInUp(
                                  delay: const Duration(milliseconds: 1500),
                                  child: Center(
                                    child: MouseRegion(
                                      onEnter: (_) => setState(
                                          () => _isButtonHovered = true),
                                      onExit: (_) => setState(
                                          () => _isButtonHovered = false),
                                      child: AnimatedScale(
                                        scale: _isButtonHovered ? 1.05 : 1.0,
                                        duration:
                                            const Duration(milliseconds: 200),
                                        child: InkWell(
                                          onTap: _launchURL,
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 15, horizontal: 30),
                                            decoration: BoxDecoration(
                                              gradient: _isButtonHovered
                                                  ? const LinearGradient(
                                                      colors: [
                                                        Color(0xffAF8F6F),
                                                        Color(0xffC1BAA1),
                                                      ],
                                                    )
                                                  : null,
                                              color: _isButtonHovered
                                                  ? null
                                                  : const Color(0xffAF8F6F),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              boxShadow: _isButtonHovered
                                                  ? [
                                                      BoxShadow(
                                                        color: const Color(
                                                                0xffAF8F6F)
                                                            .withOpacity(0.5),
                                                        blurRadius: 15,
                                                        spreadRadius: 2,
                                                      ),
                                                    ]
                                                  : [],
                                            ),
                                            child: _isButtonHovered
                                                ? Shimmer.fromColors(
                                                    baseColor: Colors.white,
                                                    highlightColor:
                                                        Colors.white70,
                                                    child: const Text(
                                                      "Check Out My CV",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                  )
                                                : const Text(
                                                    "Check Out My CV",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                          ),
                                        ),
                                      ),
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
                ),
                // Profile Image with animations
                FadeInRight(
                  duration: const Duration(milliseconds: 1000),
                  child: ZoomIn(
                    delay: const Duration(milliseconds: 500),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: AnimatedBuilder(
                        animation: _gradientController,
                        builder: (context, child) {
                          return Container(
                            width: Responsive.isMobile(context)
                                ? Responsive.widthOfScreen(context) * 0.8
                                : Responsive.widthOfScreen(context) / 3,
                            height: Responsive.isMobile(context)
                                ? Responsive.widthOfScreen(context) * 0.8
                                : Responsive.widthOfScreen(context) / 3,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: SweepGradient(
                                colors: const [
                                  Color(0xffAF8F6F),
                                  Color(0xffC1BAA1),
                                  Color(0xffAF8F6F),
                                ],
                                stops: const [0.0, 0.5, 1.0],
                                transform: GradientRotation(
                                    _gradientController.value * 2 * 3.14159),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      const Color(0xffAF8F6F).withOpacity(0.3),
                                  blurRadius: 15,
                                  spreadRadius: 2,
                                ),
                              ],
                            ),
                            padding: const EdgeInsets.all(3),
                            child: Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              padding: const EdgeInsets.all(3),
                              child: ClipOval(
                                child: Image.asset(
                                  "asset/images/aa.jpg",
                                  fit: BoxFit.contain,
                                  width: double.infinity,
                                  height: double.infinity,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

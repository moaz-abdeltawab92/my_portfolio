import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/Responsive/responsive.dart';
import 'package:portfolio_website/Utils/colors.dart';
import 'package:portfolio_website/Utils/section_keys.dart';

class TopBar extends StatelessWidget {
  final PortfolioSectionKeys sectionKeys;
  const TopBar({super.key, required this.sectionKeys});

  @override
  Widget build(BuildContext context) {
    bool isMobile = Responsive.isMobile(context);
    return isMobile
        ? Column(
            children: _topBarData(context, isMobile: true),
          )
        : Row(
            children: _topBarData(context),
          );
  }

  void _navigateToSection(BuildContext context, GlobalKey sectionKey) {
    final isMobile = Responsive.isMobile(context);
    if (isMobile) {
      Navigator.pop(context);
      sectionKeys.scrollTo(sectionKey, afterFrame: true);
    } else {
      sectionKeys.scrollTo(sectionKey);
    }
  }

  List<Widget> _topBarData(BuildContext context, {bool isMobile = false}) {
    return [
      _navButton(
        context,
        label: 'About Me',
        sectionKey: sectionKeys.aboutKey,
        isMobile: isMobile,
      ),
      _navButton(
        context,
        label: 'Skills',
        sectionKey: sectionKeys.skillsKey,
        isMobile: isMobile,
      ),
      _navButton(
        context,
        label: 'Projects',
        sectionKey: sectionKeys.projectsKey,
        isMobile: isMobile,
      ),
      _navButton(
        context,
        label: 'Contact Me',
        sectionKey: sectionKeys.contactKey,
        isMobile: isMobile,
      ),
    ];
  }

  Widget _navButton(
    BuildContext context, {
    required String label,
    required GlobalKey sectionKey,
    required bool isMobile,
  }) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: 10, vertical: isMobile ? 20 : 0),
      child: TextButton(
        onPressed: () => _navigateToSection(context, sectionKey),
        child: Text(
          label,
          style: GoogleFonts.nunito(
            fontSize: 22,
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

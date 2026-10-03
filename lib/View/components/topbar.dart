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
      _NavButton(
        label: 'Home',
        onTap: () => _navigateToSection(context, sectionKeys.homeKey),
        isMobile: isMobile,
      ),
      _NavButton(
        label: 'About Me',
        onTap: () => _navigateToSection(context, sectionKeys.aboutKey),
        isMobile: isMobile,
      ),
      _NavButton(
        label: 'Skills',
        onTap: () => _navigateToSection(context, sectionKeys.skillsKey),
        isMobile: isMobile,
      ),
      _NavButton(
        label: 'Projects',
        onTap: () => _navigateToSection(context, sectionKeys.projectsKey),
        isMobile: isMobile,
      ),
      _NavButton(
        label: 'Contact Me',
        onTap: () => _navigateToSection(context, sectionKeys.contactKey),
        isMobile: isMobile,
      ),
    ];
  }
}

class _NavButton extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  final bool isMobile;

  const _NavButton({
    required this.label,
    required this.onTap,
    required this.isMobile,
  });

  @override
  State<_NavButton> createState() => _NavButtonState();
}

class _NavButtonState extends State<_NavButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: widget.isMobile ? 0 : 4,
        vertical: widget.isMobile ? 12 : 0,
      ),
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        cursor: SystemMouseCursors.click,
        child: InkWell(
          onTap: widget.onTap,
          borderRadius: BorderRadius.circular(8),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: _isHovered ? primaryColor.withOpacity(0.12) : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              widget.label,
              style: GoogleFonts.poppins(
                fontSize: widget.isMobile ? 18 : 15,
                color: _isHovered ? primaryColor : textColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

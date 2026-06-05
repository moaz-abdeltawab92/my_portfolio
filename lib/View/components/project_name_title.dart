import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class ProjectNameTitle extends StatelessWidget {
  final String projectName;
  final String? tagline;
  final double nameFontSize;
  final double taglineFontSize;
  final Color nameColor;
  final FontWeight nameWeight;
  final TextAlign textAlign;

  const ProjectNameTitle({
    super.key,
    required this.projectName,
    this.tagline,
    required this.nameFontSize,
    this.taglineFontSize = 16,
    this.nameColor = Colors.black,
    this.nameWeight = FontWeight.bold,
    this.textAlign = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    if (tagline == null || tagline!.isEmpty) {
      return Text(
        projectName,
        textAlign: textAlign,
        style: TextStyle(
          fontSize: nameFontSize,
          fontWeight: nameWeight,
          color: nameColor,
        ),
      );
    }

    return Text.rich(
      textAlign: textAlign,
      TextSpan(
        children: [
          TextSpan(
            text: projectName,
            style: TextStyle(
              fontSize: nameFontSize,
              fontWeight: nameWeight,
              color: nameColor,
            ),
          ),
          TextSpan(
            text: ' — $tagline',
            style: GoogleFonts.cairo(
              fontSize: taglineFontSize,
              fontWeight: nameWeight,
              color: nameColor,
            ),
          ),
        ],
      ),
    );
  }
}

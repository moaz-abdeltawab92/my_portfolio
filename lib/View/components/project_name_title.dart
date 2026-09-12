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
  final String? fontFamily;

  const ProjectNameTitle({
    super.key,
    required this.projectName,
    this.tagline,
    required this.nameFontSize,
    this.taglineFontSize = 16,
    this.nameColor = Colors.black,
    this.nameWeight = FontWeight.bold,
    this.textAlign = TextAlign.center,
    this.fontFamily,
  });

  @override
  Widget build(BuildContext context) {
    if (tagline == null || tagline!.isEmpty) {
      return Text(
        projectName,
        textAlign: textAlign,
        style: TextStyle(
          fontFamily: fontFamily,
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
              fontFamily: fontFamily,
              fontSize: nameFontSize,
              fontWeight: nameWeight,
              color: nameColor,
            ),
          ),
          TextSpan(
            text: ' — $tagline',
            style: fontFamily != null
                ? TextStyle(
                    fontFamily: fontFamily,
                    fontSize: taglineFontSize,
                    fontWeight: nameWeight,
                    color: nameColor,
                  )
                : GoogleFonts.cairo(
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

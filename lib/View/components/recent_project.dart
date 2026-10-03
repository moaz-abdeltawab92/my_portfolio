import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/Responsive/responsive.dart';
import 'package:portfolio_website/Utils/colors.dart';
import 'package:portfolio_website/View/screens/project_details_page.dart';
import 'package:portfolio_website/models/project_model.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:animate_do/animate_do.dart';
import 'package:visibility_detector/visibility_detector.dart';

class RecentProject extends StatefulWidget {
  const RecentProject({super.key});

  @override
  State<RecentProject> createState() => _RecentProjectState();
}

class _RecentProjectState extends State<RecentProject> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return VisibilityDetector(
      key: const Key('recent-projects-section'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.15 && !_isVisible) {
          setState(() {
            _isVisible = true;
          });
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 16 : 40,
        ),
        child: Column(
          children: [
            // Section Title Header
            FadeInDown(
              animate: _isVisible,
              duration: const Duration(milliseconds: 600),
              child: Column(
                children: [
                  Text(
                    "Featured Mobile Projects",
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
            const SizedBox(height: 40),

            // Projects Grid Showcase
            AnimationLimiter(
              child: Wrap(
                spacing: 24,
                runSpacing: 28,
                alignment: WrapAlignment.center,
                children: List.generate(
                  projects.length,
                  (index) => AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 600),
                    child: SlideAnimation(
                      verticalOffset: 40.0,
                      child: FadeInAnimation(
                        child: ProjectCard(
                          projectModel: projects[index],
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
    );
  }
}

class ProjectCard extends StatefulWidget {
  final ProjectModel projectModel;

  const ProjectCard({
    super.key,
    required this.projectModel,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;

  bool _isArabic(String text) {
    final arabicRegExp = RegExp(r'[\u0600-\u06FF]');
    return arabicRegExp.hasMatch(text);
  }

  void _openDetails(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            ProjectDetailsPage(project: widget.projectModel),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.easeInOutCubic;
          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 350),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final cardWidth = isMobile
        ? Responsive.widthOfScreen(context) * 0.92
        : 360.0;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => _openDetails(context),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          width: cardWidth,
          transform: Matrix4.translationValues(0, _isHovered ? -8 : 0, 0),
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: _isHovered
                  ? primaryColor.withOpacity(0.5)
                  : textColor.withOpacity(0.12),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: _isHovered
                    ? primaryColor.withOpacity(0.22)
                    : Colors.black.withOpacity(0.06),
                blurRadius: _isHovered ? 20 : 10,
                offset: Offset(0, _isHovered ? 8 : 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Cover Image Showcase Frame
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(16)),
                child: Container(
                  height: 190,
                  width: double.infinity,
                  color: const Color(0xFFF3F1EA),
                  child: Stack(
                    children: [
                      Center(
                        child: AnimatedScale(
                          scale: _isHovered ? 1.05 : 1.0,
                          duration: const Duration(milliseconds: 250),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              widget.projectModel.images.first,
                              fit: BoxFit.contain,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
                        ),
                      ),
                      // Top Badges Overlay
                      Positioned(
                        top: 10,
                        right: 10,
                        child: Wrap(
                          spacing: 6,
                          children: [
                            if (widget.projectModel.downloadCount != null)
                              _CardBadge(
                                label:
                                    '${widget.projectModel.downloadCount}+ Downloads',
                                color: const Color(0xFF10B981),
                              ),
                            if (widget.projectModel.playStoreLink != null)
                              const _CardBadge(
                                label: 'Google Play',
                                color: Color(0xFF2563EB),
                              ),
                            if (widget.projectModel.appStoreLink != null)
                              const _CardBadge(
                                label: 'App Store',
                                color: Color(0xFF8B5CF6),
                              ),
                            if (widget.projectModel.isPrivate)
                              const _CardBadge(
                                label: 'Private Repo',
                                color: Color(0xFFEF4444),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Card Content Body
              Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header: Logo Avatar + Title & Tagline
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            widget.projectModel.imgURL,
                            width: 42,
                            height: 42,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.projectModel.projectName,
                                style: GoogleFonts.poppins(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: textColor,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              if (widget.projectModel.tagline != null)
                                Text(
                                  widget.projectModel.tagline!,
                                  style: GoogleFonts.nunito(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: primaryColor,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    // Short Description Snippet
                    Text(
                      widget.projectModel.description ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: _isArabic(widget.projectModel.description ?? '')
                          ? GoogleFonts.cairo(
                              fontSize: 13.5,
                              height: 1.45,
                              color: textColor.withOpacity(0.8),
                              fontWeight: FontWeight.w500,
                            )
                          : GoogleFonts.nunito(
                              fontSize: 13.5,
                              height: 1.45,
                              color: textColor.withOpacity(0.8),
                              fontWeight: FontWeight.w600,
                            ),
                      textDirection:
                          _isArabic(widget.projectModel.description ?? '')
                              ? TextDirection.rtl
                              : TextDirection.ltr,
                    ),
                    const SizedBox(height: 14),

                    // Skill Pills Tech Stack preview
                    if (widget.projectModel.skills != null &&
                        widget.projectModel.skills!.isNotEmpty)
                      Wrap(
                        spacing: 6,
                        runSpacing: 6,
                        children: widget.projectModel.skills!
                            .take(3)
                            .map(
                              (skill) => Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 9, vertical: 4),
                                decoration: BoxDecoration(
                                  color: primaryColor.withOpacity(0.08),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: primaryColor.withOpacity(0.2),
                                  ),
                                ),
                                child: Text(
                                  skill,
                                  style: GoogleFonts.nunito(
                                    fontSize: 11.5,
                                    fontWeight: FontWeight.w700,
                                    color: textColor.withOpacity(0.85),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    const SizedBox(height: 16),

                    // Footer Action Link
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "View Project Details",
                          style: GoogleFonts.nunito(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: _isHovered
                                ? primaryColor
                                : textColor.withOpacity(0.7),
                          ),
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          transform: Matrix4.translationValues(
                              _isHovered ? 4 : 0, 0, 0),
                          child: Icon(
                            Icons.arrow_forward_rounded,
                            size: 18,
                            color: _isHovered
                                ? primaryColor
                                : textColor.withOpacity(0.7),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CardBadge extends StatelessWidget {
  final String label;
  final Color color;

  const _CardBadge({
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.9),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.3),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        label,
        style: GoogleFonts.nunito(
          fontSize: 10.5,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}

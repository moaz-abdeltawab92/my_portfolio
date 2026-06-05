import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/Responsive/responsive.dart';
import 'package:portfolio_website/Utils/colors.dart';
import 'package:portfolio_website/View/components/project_name_title.dart';
import 'package:portfolio_website/View/screens/project_details_page.dart';
import 'package:portfolio_website/models/project_model.dart';
import 'package:url_launcher/url_launcher.dart';
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
    return VisibilityDetector(
      key: const Key('recent-projects-section'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.2 && !_isVisible) {
          setState(() {
            _isVisible = true;
          });
        }
      },
      child: Column(
        children: [
          FadeInDown(
            animate: _isVisible,
            duration: const Duration(milliseconds: 800),
            child: Text(
              "Some of My Recent Projects",
              style: GoogleFonts.poppins(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          AnimationLimiter(
            child: Wrap(
              children: List.generate(
                projects.length > 9 ? 9 : projects.length,
                (index) => AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(milliseconds: 600),
                  child: SlideAnimation(
                    verticalOffset: 50.0,
                    child: FadeInAnimation(
                      child: ProjectCard(
                        buttonText: "Details",
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
    );
  }
}

class ProjectCard extends StatefulWidget {
  final ProjectModel projectModel;
  final String? url;
  final String buttonText;
  const ProjectCard({
    super.key,
    required this.projectModel,
    this.url,
    required this.buttonText,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;
  bool _isFlipped = false;

  bool _isArabic(String text) {
    // Check if the text contains a significant number of Arabic characters
    final arabicRegExp = RegExp(r'[\u0600-\u06FF]');
    return arabicRegExp.hasMatch(text);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateY(_isFlipped ? 3.14159 : 0)
            ..scale(_isHovered ? 1.03 : 1.0),
          transformAlignment: Alignment.center,
          child: DecoratedBox(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: _isHovered
                      ? primaryColor.withOpacity(0.4)
                      : Colors.grey,
                  blurRadius: _isHovered ? 20 : 4,
                  spreadRadius: _isHovered ? 8 : 3,
                ),
              ],
              borderRadius: BorderRadius.circular(10),
              gradient: _isHovered
                  ? LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.white,
                        secondaryColor.withOpacity(0.1),
                      ],
                    )
                  : null,
              color: _isHovered ? null : Colors.white,
              border: _isHovered
                  ? Border.all(
                      color: primaryColor.withOpacity(0.3),
                      width: 2,
                    )
                  : null,
            ),
            child: SizedBox(
              width: Responsive.isMobile(context)
                  ? Responsive.widthOfScreen(context) * 0.9
                  : Responsive.widthOfScreen(context) / 4,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: 100,
                      width: 100,
                      transform: Matrix4.identity()
                        ..scale(_isHovered ? 1.1 : 1.0),
                      child: Image.asset(
                        widget.projectModel.imgURL,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  ProjectNameTitle(
                    projectName: widget.projectModel.projectName,
                    tagline: widget.projectModel.tagline,
                    nameFontSize: 21,
                    taglineFontSize: 15,
                    nameColor:
                        _isHovered ? primaryColor : Colors.black,
                  ),
                  if (widget.projectModel.playStoreLink != null ||
                      widget.projectModel.appStoreLink != null ||
                      widget.projectModel.downloadCount != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Wrap(
                        spacing: 6,
                        runSpacing: 6,
                        alignment: WrapAlignment.center,
                        children: [
                          if (widget.projectModel.downloadCount != null)
                            AnimatedDownloadsBadge(
                              downloadCount: widget.projectModel.downloadCount!,
                            ),
                          if (widget.projectModel.playStoreLink != null)
                            const StoreStatusBadge(
                              label: 'Live on Play Store',
                              icon: Icons.android,
                            ),
                          if (widget.projectModel.appStoreLink != null)
                            const StoreStatusBadge(
                              label: 'Live on App Store',
                              icon: Icons.apple,
                            ),
                        ],
                      ),
                    ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      widget.projectModel.description!,
                      maxLines: 10,
                      style: const TextStyle(
                        fontSize: 16,
                        overflow: TextOverflow.ellipsis,
                      ),
                      textDirection: _isArabic(widget.projectModel.description!)
                          ? TextDirection.rtl
                          : TextDirection.ltr,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 15,
                      bottom: 6,
                    ),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        gradient: _isHovered
                            ? const LinearGradient(
                                colors: [
                                  primaryColor,
                                  secondaryColor,
                                ],
                              )
                            : null,
                      ),
                      child: TextButton(
                        onPressed: () {
                          if (widget.url != null) {
                            launchUrl(
                              Uri.parse(widget.url!),
                            );
                          } else {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        ProjectDetailsPage(
                                  project: widget.projectModel,
                                ),
                                transitionsBuilder: (context, animation,
                                    secondaryAnimation, child) {
                                  const begin = Offset(1.0, 0.0);
                                  const end = Offset.zero;
                                  const curve = Curves.easeInOutCubic;
                                  var tween = Tween(begin: begin, end: end)
                                      .chain(CurveTween(curve: curve));
                                  var offsetAnimation = animation.drive(tween);
                                  return SlideTransition(
                                    position: offsetAnimation,
                                    child: child,
                                  );
                                },
                                transitionDuration:
                                    const Duration(milliseconds: 400),
                              ),
                            );
                          }
                        },
                        child: Text(
                          widget.buttonText,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: _isHovered ? Colors.white : Colors.blue,
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
    );
  }
}

class AnimatedDownloadsBadge extends StatefulWidget {
  final int downloadCount;

  const AnimatedDownloadsBadge({super.key, required this.downloadCount});

  @override
  State<AnimatedDownloadsBadge> createState() => _AnimatedDownloadsBadgeState();
}

class _AnimatedDownloadsBadgeState extends State<AnimatedDownloadsBadge>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<int> _countAnimation;
  bool _hasAnimated = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1800),
      vsync: this,
    );
    _countAnimation = IntTween(begin: 0, end: widget.downloadCount).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startAnimation() {
    if (!_hasAnimated) {
      _hasAnimated = true;
      _controller.forward();
    }
  }

  String _formatCount(int count) {
    final text = count >= 1000
        ? '${count ~/ 1000},${(count % 1000).toString().padLeft(3, '0')}'
        : '$count';
    return '$text+ Downloads';
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key('downloads-badge-${widget.downloadCount}'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.4) _startAnimation();
      },
      child: AnimatedBuilder(
        animation: _countAnimation,
        builder: (context, child) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFF2E7D32).withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: const Color(0xFF2E7D32).withOpacity(0.35),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.trending_up_rounded,
                  size: 14,
                  color: Color(0xFF2E7D32),
                ),
                const SizedBox(width: 4),
                Text(
                  _formatCount(_countAnimation.value),
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF2E7D32),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class StoreStatusBadge extends StatelessWidget {
  final String label;
  final IconData icon;

  const StoreStatusBadge({
    super.key,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: primaryColor.withOpacity(0.12),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: primaryColor.withOpacity(0.35)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: primaryColor),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/Responsive/responsive.dart';
import 'package:portfolio_website/models/project_model.dart';
import 'package:portfolio_website/Utils/colors.dart';
import 'package:portfolio_website/View/components/project_name_title.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectDetailsPage extends StatefulWidget {
  final ProjectModel project;

  const ProjectDetailsPage({super.key, required this.project});

  @override
  State<ProjectDetailsPage> createState() => _ProjectDetailsPageState();
}

class _ProjectDetailsPageState extends State<ProjectDetailsPage> {
  final PageController _pageController = PageController();
  Timer? _timer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < widget.project.images.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  bool _isArabic(String text) {
    final arabicRegExp = RegExp(r'[\u0600-\u06FF]');
    return arabicRegExp.hasMatch(text);
  }

  String _getCleanDescription(String? rawDescription, String projectName) {
    if (rawDescription == null || rawDescription.isEmpty) {
      return 'No description available.';
    }
    final lines = rawDescription.trim().split('\n');
    if (lines.isNotEmpty &&
        (lines.first.contains(projectName) ||
            lines.first.contains('—') ||
            lines.first.contains('-'))) {
      return lines.sublist(1).join('\n').trim();
    }
    return rawDescription.trim();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _openImageLightbox(BuildContext context, int initialIndex) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.9),
      builder: (context) {
        final PageController lightboxController =
            PageController(initialPage: initialIndex);
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.all(16),
          child: Stack(
            alignment: Alignment.center,
            children: [
              PageView.builder(
                controller: lightboxController,
                itemCount: widget.project.images.length,
                itemBuilder: (context, index) {
                  return InteractiveViewer(
                    minScale: 0.5,
                    maxScale: 4.0,
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          widget.project.images[index],
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  );
                },
              ),
              Positioned(
                top: 10,
                right: 10,
                child: CircleAvatar(
                  backgroundColor: Colors.black54,
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.close_rounded,
                      color: Colors.white,
                      size: 24,
                    ),
                    tooltip: 'Close',
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: ProjectNameTitle(
          projectName: widget.project.projectName,
          tagline: widget.project.tagline,
          nameFontSize: Responsive.isMobile(context) ? 20 : 24,
          taglineFontSize: Responsive.isMobile(context) ? 14 : 16,
          nameColor: textColor,
        ),
        backgroundColor: appBarColor,
        elevation: 4,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Center(
              child: SizedBox(
                width: Responsive.isDesktop(context)
                    ? MediaQuery.of(context).size.width * 0.9
                    : Responsive.isTablet(context)
                        ? MediaQuery.of(context).size.width * 0.9
                        : MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: Responsive.isMobile(context) ? 220 : 550,
                      width: MediaQuery.of(context).size.width,
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: widget.project.images.length,
                        onPageChanged: (index) {
                          setState(() {
                            _currentPage = index;
                          });
                        },
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: Responsive.isDesktop(context)
                                ? EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width *
                                            0.15)
                                : EdgeInsets.zero,
                            child: MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: () => _openImageLightbox(context, index),
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.asset(
                                        widget.project.images[index],
                                        fit: BoxFit.fill,
                                        width: double.infinity,
                                        height: double.infinity,
                                      ),
                                    ),
                                    Positioned(
                                      right: 12,
                                      bottom: 12,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 6),
                                        decoration: BoxDecoration(
                                          color: Colors.black.withOpacity(0.65),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const Icon(
                                              Icons.zoom_in_rounded,
                                              color: Colors.white,
                                              size: 16,
                                            ),
                                            const SizedBox(width: 4),
                                            Text(
                                              "Tap to Zoom",
                                              style: GoogleFonts.nunito(
                                                fontSize: 12,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    Center(
                      child: SmoothPageIndicator(
                        controller: _pageController,
                        count: widget.project.images.length,
                        effect: const WormEffect(
                          dotHeight: 8,
                          dotWidth: 8,
                          activeDotColor: primaryColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Store Badges & Action Buttons directly below image slider
                    Center(
                      child: Wrap(
                        spacing: 15,
                        runSpacing: 15,
                        alignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          if (widget.project.isPrivate)
                            Chip(
                              label: Text(
                                'Private Repository',
                                style: GoogleFonts.nunito(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700),
                              ),
                              avatar: const Icon(
                                Icons.lock,
                                color: Colors.white,
                                size: 20,
                              ),
                              backgroundColor: const Color(0xFFC62828),
                            ),
                          if (!widget.project.isPrivate &&
                              widget.project.playStoreLink != null)
                            StoreBadgeButton(
                              imageUrl: 'asset/images/play_store_badge.png',
                              linkUrl: widget.project.playStoreLink!,
                            ),
                          if (!widget.project.isPrivate &&
                              widget.project.appStoreLink != null)
                            StoreBadgeButton(
                              imageUrl: 'asset/images/app_store_badge.png',
                              linkUrl: widget.project.appStoreLink!,
                            ),
                          if (!widget.project.isPrivate &&
                              widget.project.githubLink != null)
                            ElevatedButton.icon(
                              onPressed: () {
                                if (widget.project.githubLink != null) {
                                  launchUrl(
                                      Uri.parse(widget.project.githubLink!));
                                }
                              },
                              icon: const Icon(Icons.link, size: 22),
                              label: Text(
                                (widget.project.githubLink != null
                                    ? 'GitHub'
                                    : 'Demo'),
                                style: GoogleFonts.nunito(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: primaryColor,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24, vertical: 16),
                              ),
                            ),
                          if (!widget.project.isPrivate &&
                              widget.project.downloadLink != null)
                            ElevatedButton.icon(
                              onPressed: () {
                                if (widget.project.downloadLink != null) {
                                  launchUrl(
                                      Uri.parse(widget.project.downloadLink!));
                                }
                              },
                              icon: const Icon(Icons.download, size: 22),
                              label: Text(
                                (widget.project.downloadLink != null
                                    ? 'Download'
                                    : 'Demo'),
                                style: GoogleFonts.nunito(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: primaryColor,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24, vertical: 16),
                              ),
                            ),
                          if (!widget.project.isPrivate &&
                              widget.project.demoLink != null)
                            ElevatedButton.icon(
                              onPressed: () {
                                if (widget.project.demoLink != null) {
                                  launchUrl(
                                      Uri.parse(widget.project.demoLink!));
                                }
                              },
                              icon: const Icon(Icons.link, size: 22),
                              label: Text(
                                (widget.project.demoLink != null
                                    ? 'Demo'
                                    : 'Download'),
                                style: GoogleFonts.nunito(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: primaryColor,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24, vertical: 16),
                              ),
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 25),

                    // Detailed Description Card
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Card(
                        elevation: 6,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        color: cardColor,
                        child: Padding(
                          padding: const EdgeInsets.all(25),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ProjectNameTitle(
                                projectName: widget.project.projectName,
                                tagline: widget.project.tagline,
                                fontFamily: 'Zain',
                                nameFontSize:
                                    Responsive.isMobile(context) ? 26 : 38,
                                taglineFontSize:
                                    Responsive.isMobile(context) ? 18 : 24,
                                nameColor: textColor,
                                textAlign: TextAlign.start,
                              ),
                              const SizedBox(height: 15),
                              Text(
                                _getCleanDescription(
                                    widget.project.detailedDescription,
                                    widget.project.projectName),
                                style: TextStyle(
                                  fontFamily: 'Zain',
                                  fontSize:
                                      Responsive.isMobile(context) ? 19 : 19,
                                  color: Colors.black87,
                                  height: 1.5,
                                ),
                                textDirection: _isArabic(
                                        widget.project.detailedDescription ??
                                            '')
                                    ? TextDirection.rtl
                                    : TextDirection.ltr,
                              ),
                              const SizedBox(height: 25),
                              if (widget.project.skills != null &&
                                  widget.project.skills!.isNotEmpty)
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Technologies Used:",
                                      style: TextStyle(
                                        fontFamily: 'Zain',
                                        fontSize: Responsive.isMobile(context)
                                            ? 20
                                            : 24,
                                        fontWeight: FontWeight.bold,
                                        color: textColor,
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    Wrap(
                                      spacing: 10.0,
                                      runSpacing: 8.0,
                                      children: widget.project.skills!
                                          .map((skill) => Chip(
                                                label: Text(skill),
                                                backgroundColor: secondaryColor
                                                    .withOpacity(0.3),
                                                labelStyle: GoogleFonts.nunito(
                                                    color: textColor,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ))
                                          .toList(),
                                    ),
                                  ],
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StoreBadgeButton extends StatefulWidget {
  final String imageUrl;
  final String linkUrl;

  const StoreBadgeButton({
    super.key,
    required this.imageUrl,
    required this.linkUrl,
  });

  @override
  State<StoreBadgeButton> createState() => _StoreBadgeButtonState();
}

class _StoreBadgeButtonState extends State<StoreBadgeButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedScale(
        scale: _isHovered ? 1.05 : 1.0,
        duration: const Duration(milliseconds: 200),
        child: InkWell(
          onTap: () {
            launchUrl(Uri.parse(widget.linkUrl));
          },
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            widget.imageUrl,
            height: 55,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}

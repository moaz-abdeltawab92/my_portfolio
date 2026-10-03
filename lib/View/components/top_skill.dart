import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/Responsive/responsive.dart';
import 'package:portfolio_website/Utils/colors.dart';
import 'package:animate_do/animate_do.dart';

class TopSkills extends StatefulWidget {
  const TopSkills({super.key});

  @override
  State<TopSkills> createState() => _TopSkillsState();
}

class _TopSkillsState extends State<TopSkills> {
  int _selectedFilterIndex = 0;

  static const List<String> _filters = [
    'All Skills',
    'Architecture & Core',
    'Backend & Storage',
    'Production & OTA',
    'Tools & Workflow',
  ];

  static const List<SkillCategory> _categories = [
    SkillCategory(
      id: 1,
      title: 'Programming & Architecture',
      accentColor: primaryColor,
      skills: [
        SkillItem(
          name: 'Flutter & Dart',
          subtitle: 'Responsive UI',
        ),
        SkillItem(
          name: 'OOP & SOLID',
          subtitle: 'Clean Design',
        ),
        SkillItem(
          name: 'Clean Architecture',
          subtitle: 'Layered & MVVM',
        ),
        SkillItem(
          name: 'BLoC & Cubit',
          subtitle: 'Reactive State',
        ),
      ],
    ),
    SkillCategory(
      id: 2,
      title: 'Backend, APIs & Storage',
      accentColor: Color(0xFF2563EB),
      skills: [
        SkillItem(
          name: 'RESTful APIs',
          subtitle: 'Dio / HTTP & Postman',
        ),
        SkillItem(
          name: 'Firebase Suite',
          subtitle: 'Auth, Firestore & FCM',
        ),
        SkillItem(
          name: 'Local Storage',
          subtitle: 'Hive & Shared Prefs',
        ),
        SkillItem(
          name: 'Cloud Media',
          subtitle: 'Cloudinary Assets',
        ),
      ],
    ),
    SkillCategory(
      id: 3,
      title: 'App Deployment & Production',
      accentColor: Color(0xFF10B981),
      skills: [
        SkillItem(
          name: 'Play Console & App Store',
          subtitle: 'Publishing & Release',
        ),
        SkillItem(
          name: 'Shorebird OTA',
          subtitle: 'Instant Code Push',
        ),
        SkillItem(
          name: 'Sentry Monitoring',
          subtitle: 'Error & Crash Tracking',
        ),
        SkillItem(
          name: 'Release Management',
          subtitle: 'Production Staging',
        ),
      ],
    ),
    SkillCategory(
      id: 4,
      title: 'Engineering Tools & UX',
      accentColor: Color(0xFF8B5CF6),
      skills: [
        SkillItem(
          name: 'Flutter DevTools',
          subtitle: 'Profiling & Memory',
        ),
        SkillItem(
          name: 'Git & GitHub',
          subtitle: 'Version Control',
        ),
        SkillItem(
          name: 'Project Management',
          subtitle: 'Jira, Trello & Slack',
        ),
        SkillItem(
          name: 'UI/UX & Motion',
          subtitle: 'Material Design',
        ),
      ],
    ),
  ];

  List<SkillCategory> get _filteredCategories {
    if (_selectedFilterIndex == 0) return _categories;
    return _categories
        .where((category) => category.id == _selectedFilterIndex)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final displayedCategories = _filteredCategories;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 60,
      ),
      child: Column(
        children: [
          // Section Title
          FadeInDown(
            duration: const Duration(milliseconds: 600),
            child: Column(
              children: [
                Text(
                  "Technical Skills & Expertise",
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
          const SizedBox(height: 25),

          // Category Filter Tabs
          FadeInUp(
            duration: const Duration(milliseconds: 700),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _filters.length,
                  (index) {
                    final isSelected = _selectedFilterIndex == index;
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            _selectedFilterIndex = index;
                          });
                        },
                        borderRadius: BorderRadius.circular(25),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: EdgeInsets.symmetric(
                            horizontal: isMobile ? 18 : 24,
                            vertical: isMobile ? 10 : 12,
                          ),
                          decoration: BoxDecoration(
                            color: isSelected ? primaryColor : cardColor,
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                              color: isSelected
                                  ? primaryColor
                                  : textColor.withOpacity(0.18),
                              width: 1.5,
                            ),
                            boxShadow: isSelected
                                ? [
                                    BoxShadow(
                                      color: primaryColor.withOpacity(0.3),
                                      blurRadius: 10,
                                      offset: const Offset(0, 4),
                                    )
                                  ]
                                : [],
                          ),
                          child: Text(
                            _filters[index],
                            style: GoogleFonts.nunito(
                              fontWeight: FontWeight.w700,
                              fontSize: isMobile ? 13 : 15,
                              color: isSelected ? Colors.white : textColor,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 35),

          // Open Categories Tech Cloud Layout (No Boxed Cards)
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 400),
            child: Column(
              key: ValueKey<int>(_selectedFilterIndex),
              children: displayedCategories
                  .map(
                    (category) => Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: FadeInUp(
                        duration: const Duration(milliseconds: 500),
                        child: _OpenSkillCategorySection(category: category),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class SkillCategory {
  final int id;
  final String title;
  final Color accentColor;
  final List<SkillItem> skills;

  const SkillCategory({
    required this.id,
    required this.title,
    this.accentColor = primaryColor,
    required this.skills,
  });
}

class SkillItem {
  final String name;
  final String subtitle;

  const SkillItem({
    required this.name,
    required this.subtitle,
  });
}

class _OpenSkillCategorySection extends StatelessWidget {
  final SkillCategory category;

  const _OpenSkillCategorySection({required this.category});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Category Header (Clean Glowing Dot Indicator)
        Row(
          children: [
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: category.accentColor,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: category.accentColor.withOpacity(0.4),
                    blurRadius: 6,
                    spreadRadius: 1,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Text(
              category.title,
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),

        // Floating Tech Chips Cloud
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: category.skills
              .map((skill) => _FloatingTechChip(skill: skill))
              .toList(),
        ),
      ],
    );
  }
}

class _FloatingTechChip extends StatefulWidget {
  final SkillItem skill;

  const _FloatingTechChip({required this.skill});

  @override
  State<_FloatingTechChip> createState() => _FloatingTechChipState();
}

class _FloatingTechChipState extends State<_FloatingTechChip> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedScale(
        scale: _isHovered ? 1.04 : 1.0,
        duration: const Duration(milliseconds: 180),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: _isHovered
                ? primaryColor.withOpacity(0.12)
                : secondaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: _isHovered
                  ? primaryColor
                  : primaryColor.withOpacity(0.18),
              width: 1,
            ),
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: primaryColor.withOpacity(0.15),
                      blurRadius: 12,
                      offset: const Offset(0, 3),
                    )
                  ]
                : [],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.skill.name,
                style: GoogleFonts.nunito(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                widget.skill.subtitle,
                style: GoogleFonts.nunito(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: textColor.withOpacity(0.65),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




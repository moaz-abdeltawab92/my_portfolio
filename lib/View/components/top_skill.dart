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
      icon: Icons.architecture_rounded,
      skills: [
        SkillItem(
          name: 'Flutter & Dart',
          subtitle: 'Responsive UI',
          icon: Icons.flutter_dash,
        ),
        SkillItem(
          name: 'OOP & SOLID',
          subtitle: 'Clean Design',
          icon: Icons.code_rounded,
        ),
        SkillItem(
          name: 'Clean Architecture',
          subtitle: 'Layered & MVVM',
          icon: Icons.layers_outlined,
        ),
        SkillItem(
          name: 'BLoC & Cubit',
          subtitle: 'Reactive State',
          icon: Icons.account_tree_outlined,
        ),
      ],
    ),
    SkillCategory(
      id: 2,
      title: 'Backend, APIs & Storage',
      icon: Icons.cloud_done_rounded,
      skills: [
        SkillItem(
          name: 'RESTful APIs',
          subtitle: 'Dio / HTTP & Postman',
          icon: Icons.api_rounded,
        ),
        SkillItem(
          name: 'Firebase Suite',
          subtitle: 'Auth, Firestore & FCM',
          icon: Icons.local_fire_department_rounded,
        ),
        SkillItem(
          name: 'Local Storage',
          subtitle: 'Hive & Shared Prefs',
          icon: Icons.sd_storage_rounded,
        ),
        SkillItem(
          name: 'Cloud Media',
          subtitle: 'Cloudinary Assets',
          icon: Icons.cloud_upload_outlined,
        ),
      ],
    ),
    SkillCategory(
      id: 3,
      title: 'App Deployment & Production',
      icon: Icons.rocket_launch_rounded,
      skills: [
        SkillItem(
          name: 'Play Console & App Store',
          subtitle: 'Publishing & Release',
          icon: Icons.shop_two_rounded,
        ),
        SkillItem(
          name: 'Shorebird OTA',
          subtitle: 'Instant Code Push',
          icon: Icons.offline_bolt_rounded,
        ),
        SkillItem(
          name: 'Sentry Monitoring',
          subtitle: 'Error & Crash Tracking',
          icon: Icons.bug_report_rounded,
        ),
        SkillItem(
          name: 'Release Management',
          subtitle: 'Production Staging',
          icon: Icons.published_with_changes_rounded,
        ),
      ],
    ),
    SkillCategory(
      id: 4,
      title: 'Engineering Tools & UX',
      icon: Icons.handyman_rounded,
      skills: [
        SkillItem(
          name: 'Flutter DevTools',
          subtitle: 'Profiling & Memory',
          icon: Icons.speed_rounded,
        ),
        SkillItem(
          name: 'Git & GitHub',
          subtitle: 'Version Control',
          icon: Icons.terminal_rounded,
        ),
        SkillItem(
          name: 'Project Management',
          subtitle: 'Jira, Trello & Slack',
          icon: Icons.task_alt_rounded,
        ),
        SkillItem(
          name: 'UI/UX & Motion',
          subtitle: 'Material Design',
          icon: Icons.palette_rounded,
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
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: ChoiceChip(
                      label: Text(_filters[index]),
                      selected: _selectedFilterIndex == index,
                      onSelected: (selected) {
                        if (selected) {
                          setState(() {
                            _selectedFilterIndex = index;
                          });
                        }
                      },
                      selectedColor: primaryColor,
                      backgroundColor: Colors.transparent,
                      labelStyle: GoogleFonts.nunito(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: _selectedFilterIndex == index
                            ? Colors.white
                            : textColor.withOpacity(0.8),
                      ),
                      elevation: _selectedFilterIndex == index ? 2 : 0,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(
                          color: _selectedFilterIndex == index
                              ? primaryColor
                              : Colors.grey.shade300,
                        ),
                      ),
                    ),
                  ),
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
  final IconData icon;
  final List<SkillItem> skills;

  const SkillCategory({
    required this.id,
    required this.title,
    required this.icon,
    required this.skills,
  });
}

class SkillItem {
  final String name;
  final String subtitle;
  final IconData icon;

  const SkillItem({
    required this.name,
    required this.subtitle,
    required this.icon,
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
        // Category Header (Unboxed, Clean Typography)
        Row(
          children: [
            Icon(
              category.icon,
              color: primaryColor,
              size: 22,
            ),
            const SizedBox(width: 10),
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
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                widget.skill.icon,
                size: 18,
                color: primaryColor,
              ),
              const SizedBox(width: 10),
              Column(
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
            ],
          ),
        ),
      ),
    );
  }
}




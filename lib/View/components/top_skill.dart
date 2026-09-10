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
    'State & Backend',
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
            subtitle: 'Responsive & Adaptive UI',
            icon: Icons.flutter_dash,
            isHighlight: true),
        SkillItem(
            name: 'OOP & SOLID',
            subtitle: 'Clean Design Patterns',
            icon: Icons.code_rounded),
        SkillItem(
            name: 'Clean Architecture',
            subtitle: 'Layered & MVVM',
            icon: Icons.layers_outlined,
            isHighlight: true),
        SkillItem(
            name: 'BLoC & Cubit',
            subtitle: 'Reactive State Management',
            icon: Icons.account_tree_outlined,
            isHighlight: true),
        SkillItem(
            name: 'Provider',
            subtitle: 'State Management',
            icon: Icons.alt_route_rounded),
      ],
    ),
    SkillCategory(
      id: 2,
      title: 'Backend, APIs & Storage',
      icon: Icons.cloud_done_rounded,
      skills: [
        SkillItem(
            name: 'RESTful APIs',
            subtitle: 'Dio / HTTP & Postman Testing',
            icon: Icons.api_rounded,
            isHighlight: true),
        SkillItem(
            name: 'Firebase Suite',
            subtitle: 'Auth, Firestore & FCM Push',
            icon: Icons.local_fire_department_rounded,
            isHighlight: true),
        SkillItem(
            name: 'Local Storage',
            subtitle: 'Hive & Shared Preferences',
            icon: Icons.sd_storage_rounded),
      ],
    ),
    SkillCategory(
      id: 3,
      title: 'App Deployment & Production',
      icon: Icons.rocket_launch_rounded,
      skills: [
        SkillItem(
            name: 'App Store & Play Console',
            subtitle: 'iOS & Android Release',
            icon: Icons.shop_two_rounded,
            isHighlight: true),
        SkillItem(
            name: 'Shorebird OTA',
            subtitle: 'Instant Code Push Updates',
            icon: Icons.offline_bolt_rounded,
            isHighlight: true),
        SkillItem(
            name: 'Sentry Monitoring',
            subtitle: 'Real-time Error Tracking',
            icon: Icons.bug_report_rounded,
            isHighlight: true),
        SkillItem(
            name: 'Release Management',
            subtitle: 'Production & OTA Staging',
            icon: Icons.published_with_changes_rounded),
      ],
    ),
    SkillCategory(
      id: 4,
      title: 'Engineering Tools & Workflow',
      icon: Icons.handyman_rounded,
      skills: [
        SkillItem(
            name: 'Flutter DevTools',
            subtitle: 'Performance & Profiling',
            icon: Icons.speed_rounded),
        SkillItem(
            name: 'Git & GitHub',
            subtitle: 'Version Control & Flow',
            icon: Icons.terminal_rounded),
        SkillItem(
            name: 'Project Management',
            subtitle: 'Jira, Trello & Slack',
            icon: Icons.task_alt_rounded),
        SkillItem(
            name: 'UI/UX & Animations',
            subtitle: 'Material Design & Motion',
            icon: Icons.auto_awesome_rounded),
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

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 40,
      ),
      child: Column(
        children: [
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
                const SizedBox(height: 8),
                Text(
                  "Core technologies, production monitoring, architecture & engineering practices from my production experience",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.nunito(
                    fontSize: isMobile ? 14 : 16,
                    color: textColor.withOpacity(0.7),
                    fontWeight: FontWeight.w600,
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
                      backgroundColor: cardColor,
                      labelStyle: GoogleFonts.nunito(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: _selectedFilterIndex == index
                            ? Colors.white
                            : textColor.withOpacity(0.8),
                      ),
                      elevation: _selectedFilterIndex == index ? 4 : 1,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
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

          // Categories Grid
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 400),
            child: Wrap(
              key: ValueKey<int>(_selectedFilterIndex),
              spacing: 24,
              runSpacing: 24,
              alignment: WrapAlignment.center,
              children: _filteredCategories
                  .map(
                    (category) => FadeInUp(
                      duration: const Duration(milliseconds: 600),
                      child: _SkillCategoryCard(category: category),
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
  final bool isHighlight;

  const SkillItem({
    required this.name,
    required this.subtitle,
    required this.icon,
    this.isHighlight = false,
  });
}

class _SkillCategoryCard extends StatelessWidget {
  final SkillCategory category;

  const _SkillCategoryCard({required this.category});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Container(
      width: isMobile ? double.infinity : 380,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: shadoColor.withOpacity(0.2),
            blurRadius: 15,
            spreadRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(
          color: primaryColor.withOpacity(0.15),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: primaryColor.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  category.icon,
                  color: primaryColor,
                  size: 24,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  category.title,
                  style: GoogleFonts.poppins(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Column(
            children: category.skills
                .map((skill) => Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: _SkillTile(skill: skill),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _SkillTile extends StatefulWidget {
  final SkillItem skill;

  const _SkillTile({required this.skill});

  @override
  State<_SkillTile> createState() => _SkillTileState();
}

class _SkillTileState extends State<_SkillTile> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: _isHovered
              ? primaryColor.withOpacity(0.1)
              : (widget.skill.isHighlight
                  ? primaryColor.withOpacity(0.05)
                  : secondaryColor.withOpacity(0.12)),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: _isHovered
                ? primaryColor
                : (widget.skill.isHighlight
                    ? primaryColor.withOpacity(0.3)
                    : Colors.transparent),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: widget.skill.isHighlight
                    ? primaryColor.withOpacity(0.15)
                    : Colors.grey.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                widget.skill.icon,
                size: 18,
                color: widget.skill.isHighlight ? primaryColor : textColor,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: textColor.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
            ),
            if (widget.skill.isHighlight)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "PRO",
                  style: GoogleFonts.nunito(
                    fontSize: 9,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}


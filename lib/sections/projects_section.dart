import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';
import '../widgets/common_widgets.dart';

class ProjectData {
  final String title;
  final IconData icon;
  final Color color;
  final String description;
  final List<String> tags;
  final String liveDemoUrl;
  final String githubUrl;

  const ProjectData({
    required this.title,
    required this.icon,
    required this.color,
    required this.description,
    required this.tags,
    required this.liveDemoUrl,
    required this.githubUrl,
  });
}

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  static const _projects = [
    ProjectData(
      title: 'Healthcare Shift Management',
      icon: Icons.medical_services_rounded,
      color: AppColors.primary,
      description:
          'Cross-platform app for healthcare professionals to manage shifts, schedules and notifications.',
      tags: ['Flutter', 'Firebase', 'GoRouter'],
      liveDemoUrl: 'https://example.com/healthcare-demo',
      githubUrl: 'https://github.com/prabhu-tiwary',
    ),
    ProjectData(
      title: 'AI Recruitment Platform',
      icon: Icons.psychology_alt_rounded,
      color: AppColors.accent,
      description:
          'AI-powered recruitment platform with resume parsing, candidate matching and real-time analytics.',
      tags: ['Flutter', 'Node.js', 'MongoDB'],
      liveDemoUrl: 'https://example.com/ai-recruitment-demo',
      githubUrl: 'https://github.com/prabhu-tiwary',
    ),
    ProjectData(
      title: 'Chat Application',
      icon: Icons.chat_bubble_rounded,
      color: AppColors.secondary,
      description:
          'Real-time chat application with push notifications, image sharing and more.',
      tags: ['Flutter', 'Firebase', 'GetX'],
      liveDemoUrl: 'https://example.com/chat-app-demo',
      githubUrl: 'https://github.com/prabhu-tiwary',
    ),
  ];

  Future<void> _open(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, webOnlyWindowName: '_blank');
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final columns = isMobile(width) ? 1 : (isTablet(width) ? 2 : 3);

    return Section(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const RevealOnScroll(child: SectionLabel('Featured Projects')),
              RevealOnScroll(
                delay: const Duration(milliseconds: 100),
                child: TextButton.icon(
                  onPressed: () => _open('https://github.com/prabhu-tiwary'),
                  icon: const Icon(Icons.arrow_forward_rounded, size: 16, color: AppColors.primary),
                  label: Text(
                    'View All Projects',
                    style: GoogleFonts.inter(color: AppColors.primary, fontWeight: FontWeight.w600, fontSize: 13),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          LayoutBuilder(
            builder: (context, constraints) {
              const spacing = 20.0;
              final cardWidth = (constraints.maxWidth - spacing * (columns - 1)) / columns;
              return Wrap(
                spacing: spacing,
                runSpacing: spacing,
                children: [
                  for (int i = 0; i < _projects.length; i++)
                    RevealOnScroll(
                      delay: Duration(milliseconds: 100 * i),
                      child: SizedBox(
                        width: cardWidth,
                        child: _ProjectCard(project: _projects[i], onOpenDemo: _open, onOpenGithub: _open),
                      ),
                    ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final ProjectData project;
  final Future<void> Function(String) onOpenDemo;
  final Future<void> Function(String) onOpenGithub;

  const _ProjectCard({
    required this.project,
    required this.onOpenDemo,
    required this.onOpenGithub,
  });

  @override
  Widget build(BuildContext context) {
    return HoverScale(
      scale: 1.015,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: project.color.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(project.icon, color: project.color, size: 20),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    project.title,
                    style: GoogleFonts.spaceGrotesk(
                      color: AppColors.textPrimary,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Text(
              project.description,
              style: AppText.body.copyWith(fontSize: 13.5),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [for (final tag in project.tags) TagChip(label: tag)],
            ),
            const SizedBox(height: 18),
            Row(
              children: [
                InkWell(
                  onTap: () => onOpenDemo(project.liveDemoUrl),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Live Demo',
                          style: GoogleFonts.inter(
                              color: AppColors.secondary, fontSize: 12.5, fontWeight: FontWeight.w600)),
                      const SizedBox(width: 4),
                      const Icon(Icons.open_in_new_rounded, size: 13, color: AppColors.secondary),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                InkWell(
                  onTap: () => onOpenGithub(project.githubUrl),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('GitHub',
                          style: GoogleFonts.inter(
                              color: AppColors.textSecondary, fontSize: 12.5, fontWeight: FontWeight.w600)),
                      const SizedBox(width: 4),
                      const Icon(Icons.code_rounded, size: 13, color: AppColors.textSecondary),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

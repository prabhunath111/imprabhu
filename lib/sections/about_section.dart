import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/common_widgets.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final mobile = isMobile(width);

    const stats = [
      _StatData(Icons.calendar_month_rounded, AppColors.primary, '7+', 'Years Experience'),
      _StatData(Icons.rocket_launch_rounded, AppColors.secondary, '10+', 'Apps Deployed'),
      _StatData(Icons.verified_rounded, AppColors.accent, '100%', 'Client Satisfaction'),
      _StatData(Icons.play_arrow_rounded, AppColors.success, '10+', 'Apps on Play Store'),
      _StatData(Icons.apple_rounded, AppColors.warning, '10+', 'Apps on App Store'),
    ];

    final textColumn = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const RevealOnScroll(child: SectionLabel('About Me')),
        const SizedBox(height: 14),
        RevealOnScroll(
          delay: const Duration(milliseconds: 80),
          child: Text(
            // 'Building digital experiences that\nmake impact.',
            'Building scalable apps that create impact.',
            style: AppText.heading.copyWith(fontSize: mobile ? 26 : 32),
          ),
        ),
        const SizedBox(height: 16),
        RevealOnScroll(
          delay: const Duration(milliseconds: 140),
          /*child: Text(
            "I'm a Associate Lead Software Engineer with 7+ years of experience in "
            'building cross-platform mobile and web applications. I specialize '
            'in clean architecture, state management, and delivering exceptional '
            'user experiences.',
            style: AppText.body.copyWith(fontSize: 15.5),
          ),*/
          child: Text(
            "I'm an Associate Lead Software Engineer with 6+ years of experience building scalable, high-quality cross-platform applications using Flutter and Dart. I specialize in mobile and web development, with a focus on clean architecture, state management, performance, and maintainable code. I've contributed to and led applications across Android, iOS, and the web, taking ownership from architecture and development to testing, deployment, and production support. I enjoy solving complex technical challenges, mentoring developers, and building products that create real value.",
            style: AppText.body.copyWith(fontSize: 15.5),
          ),
        ),
      ],
    );

    final statsGrid = RevealOnScroll(
      delay: const Duration(milliseconds: 200),
      child: Wrap(
        spacing: 16,
        runSpacing: 16,
        children: [
          for (final s in stats)
            StatCard(
              icon: s.icon,
              iconColor: s.color,
              value: s.value,
              label: s.label,
              width: mobile ? (width - 40 - 16) / 2 : 220,
            ),
        ],
      ),
    );

    return Section(
      child: mobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textColumn,
                const SizedBox(height: 32),
                statsGrid,
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 5, child: textColumn),
                const SizedBox(width: 40),
                Expanded(flex: 6, child: statsGrid),
              ],
            ),
    );
  }
}

class _StatData {
  final IconData icon;
  final Color color;
  final String value;
  final String label;
  const _StatData(this.icon, this.color, this.value, this.label);
}

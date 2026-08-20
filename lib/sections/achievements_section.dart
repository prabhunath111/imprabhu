import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/common_widgets.dart';

class AchievementsSection extends StatelessWidget {
  const AchievementsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final mobile = isMobile(width);

    final achievements = [
      StatCard(
        icon: Icons.emoji_events_rounded,
        iconColor: AppColors.warning,
        value: '10+',
        label: 'Apps Published',
        width: mobile ? (width - 40 - 14) / 2 : 210,
      ),
      StatCard(
        icon: Icons.star_rounded,
        iconColor: AppColors.warning,
        // value: '4.8 ★',
        // value: '🤖/ ',
        value: "Hybrid",
        label: 'Android/iOS/Web',
        width: mobile ? (width - 40 - 14) / 2 : 210,
      ),
      StatCard(
        icon: Icons.trending_up_rounded,
        iconColor: AppColors.success,
        value: '80%',
        // label: 'Performance Improvement',
        label: 'Performance Impr...',
        width: mobile ? (width - 40 - 14) / 2 : 210,
      ),
      StatCard(
        icon: Icons.integration_instructions_rounded,
        iconColor: AppColors.secondary,
        value: 'CI/CD',
        label: 'Automation',
        width: mobile ? (width - 40 - 14) / 2 : 210,
      ),
      StatCard(
        icon: Icons.groups_rounded,
        iconColor: AppColors.primary,
        value: 'Team Lead',
        label: 'Mentored 20+ Developers',
        width: mobile ? (width - 40 - 14) : 210,
      ),
    ];

    return Section(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const RevealOnScroll(child: SectionLabel('Achievements')),
          const SizedBox(height: 24),
          RevealOnScroll(
            delay: const Duration(milliseconds: 100),
            child: Wrap(
              spacing: 14,
              runSpacing: 14,
              children: achievements,
            ),
          ),
        ],
      ),
    );
  }
}

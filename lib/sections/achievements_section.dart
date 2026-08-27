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
        // icon: Icons.emoji_events_rounded,
        icon: Icons.workspace_premium_outlined,
        iconColor: AppColors.warning,
        value: '10+',
        label: 'Apps Published',
        width: mobile ? (width - 40 - 14) / 2 : 210,
      ),
      StatCard(
        // icon: Icons.star_rounded,
        icon: Icons.devices_other_outlined,
        iconColor: AppColors.warning,
        value: "3+",
        label: "Mobile • Web",
        // label: "Android•iOS•Web",
        // label: "Android • iOS • Web",
        width: mobile ? (width - 40 - 14) / 2 : 210,
      ),
      StatCard(
        icon: Icons.rocket_launch_outlined,
        iconColor: AppColors.success,
        value: 'CI/CD',
        label: 'Auto Deploy',
        width: mobile ? (width - 40 - 14) / 2 : 210,
      ),
      StatCard(
        icon: Icons.system_update_alt_outlined,
        iconColor: AppColors.secondary,
        value: 'OTA',
        label: 'Hotfix Delivery',
        width: mobile ? (width - 40 - 14) / 2 : 210,
      ),
      StatCard(
        icon: Icons.groups_outlined,
        iconColor: AppColors.primary,
        value: '20+',
        label: 'Devs Mentored',
        width: mobile ? (width - 40 - 14) : 210,
      ),
      StatCard(
        // icon: Icons.groups_rounded,
        icon: Icons.account_tree_outlined,
        iconColor: AppColors.primary,
        value: 'E2E',
        label: 'Build to Production',
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

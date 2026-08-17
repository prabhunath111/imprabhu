import 'package:flutter/material.dart';
import '../widgets/common_widgets.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  static const _skills = [
    _Skill(Icons.flutter_dash, Color(0xFF54C5F8), 'Flutter'),
    _Skill(Icons.circle, Color(0xFF13B9FD), 'Dart'),
    _Skill(Icons.local_fire_department, Color(0xFFFFA000), 'Firebase'),
    _Skill(Icons.water_drop_rounded, Color(0xFF40C4FF), 'Riverpod'),
    _Skill(Icons.alt_route_rounded, Color(0xFF34D399), 'GoRouter'),
    _Skill(Icons.api_rounded, Color(0xFFB388FF), 'REST API'),
    _Skill(Icons.eco_rounded, Color(0xFF6CC24A), 'Node.js'),
    _Skill(Icons.storage_rounded, Color(0xFF4DB33D), 'MongoDB'),
    _Skill(Icons.cloud_rounded, Color(0xFFFF9900), 'AWS'),
    _Skill(Icons.merge_type_rounded, Color(0xFFF05033), 'Git'),
    _Skill(Icons.developer_board_rounded, Color(0xFF2496ED), 'Docker'),
    _Skill(Icons.code_rounded, Color(0xFF6D5DF4), 'CI/CD'),
    _Skill(Icons.flight, Color(0xFFFF5722), 'Shorebird'), 

  ];

  @override
  Widget build(BuildContext context) {
    return Section(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const RevealOnScroll(child: SectionLabel('Skills & Technologies')),
          const SizedBox(height: 24),
          RevealOnScroll(
            delay: const Duration(milliseconds: 100),
            child: Wrap(
              spacing: 14,
              runSpacing: 14,
              children: [
                for (final s in _skills) SkillChip(icon: s.icon, color: s.color, label: s.label),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Skill {
  final IconData icon;
  final Color color;
  final String label;
  const _Skill(this.icon, this.color, this.label);
}

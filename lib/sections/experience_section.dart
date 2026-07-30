import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../widgets/common_widgets.dart';

class _Job {
  final String period;
  final String title;
  final String company;
  final String description;
  final IconData icon;
  final bool current;
  const _Job(this.period, this.title, this.company, this.description, this.icon, {this.current = false});
}

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  static const _jobs = [
    _Job('2025 — Present', 'Senior Software Engineer', 'Dsaas.ai',
        'Leading Flutter development and building scalable enterprise applications used by thousands of users.',
        Icons.workspace_premium_rounded,
        current: true),
    _Job('2022 — 2025', 'Software Engineer', 'Dsaas.ai',
        'Developed multiple cross-platform apps and contributed to architecture and performance improvements.',
        Icons.code_rounded),
    _Job('2020 — 2022', 'Flutter Developer', 'Agira Technologies',
        'Built and maintained Flutter applications for clients across different domains.',
        Icons.bolt_rounded),
  ];

  @override
  Widget build(BuildContext context) {
    return Section(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const RevealOnScroll(child: SectionLabel('Experience')),
          const SizedBox(height: 28),
          for (int i = 0; i < _jobs.length; i++)
            RevealOnScroll(
              delay: Duration(milliseconds: 100 * i),
              child: _TimelineTile(job: _jobs[i], isLast: i == _jobs.length - 1),
            ),
        ],
      ),
    );
  }
}

class _TimelineTile extends StatelessWidget {
  final _Job job;
  final bool isLast;
  const _TimelineTile({required this.job, required this.isLast});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final mobile = isMobile(width);

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  gradient: job.current ? AppColors.primaryGradient : null,
                  color: job.current ? null : AppColors.surfaceLight,
                  shape: BoxShape.circle,
                  border: Border.all(color: job.current ? Colors.transparent : AppColors.border),
                ),
                child: Icon(job.icon, size: 18, color: job.current ? Colors.white : AppColors.textSecondary),
              ),
              if (!isLast)
                Expanded(
                  child: Container(width: 2, color: AppColors.border, margin: const EdgeInsets.symmetric(vertical: 6)),
                ),
            ],
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : 32),
              child: Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: AppColors.border),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      spacing: 10,
                      runSpacing: 6,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text(job.period,
                            style: GoogleFonts.inter(
                                color: AppColors.textMuted, fontSize: 12.5, fontWeight: FontWeight.w600)),
                        if (job.current)
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(
                              color: AppColors.success.withValues(alpha: 0.15),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text('Current',
                                style: GoogleFonts.inter(
                                    color: AppColors.success, fontSize: 10.5, fontWeight: FontWeight.w700)),
                          ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(job.title,
                        style: GoogleFonts.spaceGrotesk(
                            color: AppColors.textPrimary, fontSize: mobile ? 16 : 18, fontWeight: FontWeight.w700)),
                    const SizedBox(height: 4),
                    Text(job.company,
                        style: GoogleFonts.inter(
                            color: AppColors.secondary, fontSize: 13.5, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 10),
                    Text(job.description, style: AppText.body.copyWith(fontSize: 13.5)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

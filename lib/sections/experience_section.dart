import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../widgets/common_widgets.dart';

class _Job {
  final String period;
  final String title;
  final String company;
  final List<String> points;
  final IconData icon;
  final bool current;
  const _Job(this.period, this.title, this.company, this.points, this.icon, {this.current = false});
}

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  static const _jobs = [
    _Job('Jan 2026 - Present', 'Associate Lead Software Engineer', 'Simplify (Software Engineer → Senior Software Engineer → Associate Lead Software Engineer)',
        // ['Leading Flutter development for scalable, enterprise-grade applications across Android, iOS, and web', 'Driving technical decisions, application architecture, code quality, and maintainable engineering practices', 'Mentoring developers and supporting the team in delivering reliable, high-quality products'],
        ['Led a team of 4 Flutter engineers shipping Shift Management to users; cut release time from a day to few minutes with Fastlane + Bitbucket Pipelines.',
          'Spearheaded mobile engineering initiatives(Migrated from GetX to Riverpod + Clean Architecture), driving technical decisions, ensuring code quality, scalability, maintainability, and delivering user-focused solutions in collaboration with cross-functional teams.',
          'Progressed through two promotions from Software Engineer to Senior Software Engineer and Associate Lead Software Engineer, taking on increasing ownership of mobile development, technical leadership, and team responsibilities.',
        ],
        Icons.workspace_premium_rounded,
        current: true),
/*    _Job('Feb 2024 - Dec 2025', 'Senior Software Engineer', 'Simplify',
        ['Led the development and delivery of multiple cross-platform applications from architecture and development to deployment and production support', 'Improved application performance, maintainability, and code quality through better architecture and engineering practices', 'Took ownership of key features and releases across Android, iOS, and web'],
        Icons.workspace_premium_rounded, current: false),
    _Job('Jun 2022 - Jan 2024', 'Software Engineer', 'Simplify',
        ['Built and maintained Flutter applications for multiple products and business domains', 'Developed features, integrated APIs, created reusable components, and resolved production issues', 'Contributed to application releases and the continuous improvement of the codebase'],
        Icons.code_rounded),*/
    _Job('Mar 2021 - Jun 2022', 'Software Engineer', 'LightningLogistics/Micelio',
        /*['Developed and maintained cross-platform Flutter applications for business and logistics-related use cases',
          'Integrated backend APIs and collaborated with cross-functional teams to deliver new features',
          'Supported applications throughout development, testing, release, and maintenance'],*/
        [
          'Took end-to-end ownership of mobile engineering as the sole mobile developer, independently driving technical decisions, architecture, development, release management, and ongoing maintenance across multiple applications.',
          'Developed Flutter applications integrating REST APIs, Firebase, Google Maps, location services etc.',
          'Implemented mobile capabilities for EV charging station discovery, employee task management, multilingual communication, and video recording.',
          'Integrated third-party Flutter packages and backend services to support application functionality.'
        ],
        Icons.code_rounded),
    _Job('Jul 2019 - Feb 2021', 'Software Engineer', 'Aponiar Solutions',
        /*['Built Flutter applications and developed a strong foundation in cross-platform mobile development',
          'Worked on UI development, API integration, and reusable application components',
          'Contributed to feature development, bug fixing, and application maintenance'],*/
        [
          'Took end-to-end ownership of mobile engineering as the sole mobile developer, independently driving technical decisions, architecture, development, release management, and ongoing maintenance across multiple applications.',
        'Developed Flutter and React.js applications for mobile and web-based workflows.',
          'Integrated camera functionality, REST APIs, Google Maps, cloud storage, notifications, and authentication services.'
        ],
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
    final iconSize = mobile ? 34.0 : 40.0;
    final spacing = mobile ? 12.0 : 20.0;

    return Stack(
      children: [
        if (!isLast)
          Positioned(
            top: iconSize,
            bottom: 0,
            left: (iconSize / 2) - 1,
            child: Container(
              width: 2,
              color: AppColors.border,
            ),
          ),
        Padding(
          padding: EdgeInsets.only(bottom: isLast ? 0 : (mobile ? 20 : 32)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: iconSize,
                height: iconSize,
                decoration: BoxDecoration(
                  gradient: job.current ? AppColors.primaryGradient : null,
                  color: job.current ? null : AppColors.surfaceLight,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: job.current ? Colors.transparent : AppColors.border,
                  ),
                ),
                child: Icon(
                  job.icon,
                  size: mobile ? 16 : 18,
                  color: job.current ? Colors.white : AppColors.textSecondary,
                ),
              ),
              SizedBox(width: spacing),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(mobile ? 14 : 18),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Wrap(
                        spacing: 8,
                        runSpacing: 6,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Text(
                            job.period,
                            style: GoogleFonts.inter(
                              color: AppColors.textMuted,
                              fontSize: mobile ? 11.5 : 12.5,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          if (job.current)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 3,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.success.withValues(alpha: 0.15),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                'Current',
                                style: GoogleFonts.inter(
                                  color: AppColors.success,
                                  fontSize: 10.5,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        job.title,
                        style: GoogleFonts.spaceGrotesk(
                          color: AppColors.textPrimary,
                          fontSize: mobile ? 15.5 : 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        job.company,
                        style: GoogleFonts.inter(
                          color: AppColors.secondary,
                          fontSize: mobile ? 12.5 : 13.5,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: job.points
                            .map((point) => Padding(
                                  padding: const EdgeInsets.only(bottom: 8),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          top: 6,
                                          right: 8,
                                        ),
                                        child: Container(
                                          width: 5,
                                          height: 5,
                                          decoration: const BoxDecoration(
                                            color: AppColors.secondary,
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          point,
                                          style: AppText.body.copyWith(
                                            fontSize: mobile ? 12.5 : 13.5,
                                            height: 1.4,
                                          ),
                                          softWrap: true,
                                        ),
                                      ),
                                    ],
                                  ),
                                ))
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

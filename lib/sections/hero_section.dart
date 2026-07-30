import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../widgets/common_widgets.dart';
import '../widgets/phone_mockup.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onDownloadResume;
  final VoidCallback onViewGithub;
  final VoidCallback onLinkedIn;

  const HeroSection({
    super.key,
    required this.onDownloadResume,
    required this.onViewGithub,
    required this.onLinkedIn,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final mobile = isMobile(width);

    return Stack(
      clipBehavior: Clip.none,
      children: [
        // decorative glow blobs
        Positioned(
          top: -80,
          right: -80,
          child: _Glow(color: AppColors.primary.withValues(alpha: 0.28), size: 340),
        ),
        Positioned(
          top: 220,
          left: -100,
          child: _Glow(color: AppColors.secondary.withValues(alpha: 0.18), size: 260),
        ),
        Section(
          padding: EdgeInsets.only(
            top: mobile ? 48 : 90,
            bottom: mobile ? 48 : 90,
            left: 0,
            right: 0,
          ),
          child: mobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _HeroText(onDownloadResume: onDownloadResume, onViewGithub: onViewGithub, onLinkedIn: onLinkedIn),
                    const SizedBox(height: 48),
                    const Center(child: _HeroMockups(compact: true)),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 6,
                      child: _HeroText(onDownloadResume: onDownloadResume, onViewGithub: onViewGithub, onLinkedIn: onLinkedIn),
                    ),
                    const SizedBox(width: 40),
                    const Expanded(
                      flex: 5,
                      child: _HeroMockups(compact: false),
                    ),
                  ],
                ),
        ),
      ],
    );
  }
}

class _Glow extends StatelessWidget {
  final Color color;
  final double size;
  const _Glow({required this.color, required this.size});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(colors: [color, color.withValues(alpha: 0)]),
        ),
      ),
    );
  }
}

class _HeroText extends StatelessWidget {
  final VoidCallback onDownloadResume;
  final VoidCallback onViewGithub;
  final VoidCallback onLinkedIn;

  const _HeroText({
    required this.onDownloadResume,
    required this.onViewGithub,
    required this.onLinkedIn,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final mobile = isMobile(width);
    final nameSize = mobile ? 38.0 : 52.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RevealOnScroll(
          child: Text(
            "Hi, I'm 👋 👋",
            style: GoogleFonts.spaceGrotesk(
              color: AppColors.textPrimary,
              fontSize: mobile ? 24 : 28,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 6),
        RevealOnScroll(
          delay: const Duration(milliseconds: 100),
          child: ShaderMask(
            shaderCallback: (rect) => AppColors.primaryGradient.createShader(rect),
            child: Text(
              'Prabhu Nath Tiwary',
              style: GoogleFonts.spaceGrotesk(
                color: Colors.white,
                fontSize: nameSize,
                fontWeight: FontWeight.w700,
                height: 1.1,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        RevealOnScroll(
          delay: const Duration(milliseconds: 180),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.primary.withValues(alpha: 0.35)),
            ),
            child: Text(
              'Senior Flutter Engineer',
              style: GoogleFonts.inter(
                color: AppColors.primary,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        RevealOnScroll(
          delay: const Duration(milliseconds: 240),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: Text(
              'Building scalable, high-performance cross-platform apps for real-world impact.',
              style: AppText.body.copyWith(fontSize: 16),
            ),
          ),
        ),
        const SizedBox(height: 24),
        const RevealOnScroll(
          delay: Duration(milliseconds: 300),
          child: Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              TechPill(label: 'Flutter', icon: Icons.flutter_dash, color: Color(0xFF54C5F8)),
              TechPill(label: 'Firebase', icon: Icons.local_fire_department, color: Color(0xFFFFA000)),
              TechPill(label: 'Dart', icon: Icons.circle, color: Color(0xFF13B9FD)),
              TechPill(label: 'AWS', icon: Icons.cloud, color: Color(0xFFFF9900)),
              TechPill(label: 'AI', icon: Icons.auto_awesome, color: Color(0xFFB388FF)),
            ],
          ),
        ),
        const SizedBox(height: 28),
        RevealOnScroll(
          delay: const Duration(milliseconds: 360),
          child: Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              AppButton(
                label: 'Download Resume',
                icon: Icons.download_rounded,
                onPressed: onDownloadResume,
              ),
              AppButton(
                label: 'View GitHub',
                icon: Icons.code_rounded,
                variant: AppButtonVariant.outline,
                onPressed: onViewGithub,
              ),
              AppButton(
                label: 'LinkedIn',
                icon: Icons.business_center_rounded,
                variant: AppButtonVariant.outline,
                onPressed: onLinkedIn,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _HeroMockups extends StatelessWidget {
  final bool compact;
  const _HeroMockups({required this.compact});

  @override
  Widget build(BuildContext context) {
    final w1 = compact ? 150.0 : 210.0;
    final w2 = compact ? 130.0 : 185.0;
    final stackHeight = (w1 * 2.06) + 40;

    return RevealOnScroll(
      delay: const Duration(milliseconds: 200),
      child: SizedBox(
        height: stackHeight,
        width: w1 * 1.75,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              left: 0,
              top: 30,
              child: FloatingBox(
                duration: const Duration(seconds: 5),
                child: Transform.rotate(
                  angle: -0.06,
                  child: PhoneMockup(width: w1, isPrimary: true),
                ),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: FloatingBox(
                duration: const Duration(seconds: 4),
                amplitude: 8,
                child: Transform.rotate(
                  angle: 0.05,
                  child: PhoneMockup(width: w2, isPrimary: false),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

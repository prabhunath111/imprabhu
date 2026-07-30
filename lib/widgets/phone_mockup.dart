import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

/// A stylized phone frame containing a tiny "app dashboard" mockup.
/// Two variants are used side by side in the hero, mirroring the reference
/// design: a "greeting / shift management" screen and a "performance ring"
/// screen.
class PhoneMockup extends StatelessWidget {
  final double width;
  final bool isPrimary;

  const PhoneMockup({super.key, this.width = 210, this.isPrimary = true});

  @override
  Widget build(BuildContext context) {
    final height = width * 2.06;
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(width * 0.045),
      decoration: BoxDecoration(
        color: const Color(0xFF0C1120),
        borderRadius: BorderRadius.circular(width * 0.17),
        border: Border.all(color: Colors.white.withValues(alpha: 0.09), width: 3),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.55),
            blurRadius: 45,
            offset: const Offset(0, 25),
          ),
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.18),
            blurRadius: 60,
            spreadRadius: -10,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(width * 0.13),
        child: Container(
          color: const Color(0xFF090C16),
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.075,
            vertical: width * 0.09,
          ),
          child: isPrimary
              ? _GreetingScreen(width: width)
              : _PerformanceScreen(width: width),
        ),
      ),
    );
  }
}

class _StatusBar extends StatelessWidget {
  final double width;
  const _StatusBar({required this.width});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('9:41',
            style: GoogleFonts.inter(
                color: Colors.white, fontSize: width * 0.045, fontWeight: FontWeight.w600)),
        Row(
          children: [
            Icon(Icons.signal_cellular_alt, color: Colors.white, size: width * 0.05),
            SizedBox(width: width * 0.015),
            Icon(Icons.wifi, color: Colors.white, size: width * 0.05),
            SizedBox(width: width * 0.015),
            Icon(Icons.battery_full, color: Colors.white, size: width * 0.05),
          ],
        )
      ],
    );
  }
}

class _GreetingScreen extends StatelessWidget {
  final double width;
  const _GreetingScreen({required this.width});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _StatusBar(width: width),
        SizedBox(height: width * 0.09),
        Text('Good Morning 👋',
            style: GoogleFonts.inter(color: AppColors.textMuted, fontSize: width * 0.045)),
        SizedBox(height: width * 0.015),
        Text('Prabhu',
            style: GoogleFonts.spaceGrotesk(
                color: Colors.white, fontSize: width * 0.09, fontWeight: FontWeight.w700)),
        SizedBox(height: width * 0.09),
        Text('Your Projects',
            style: GoogleFonts.inter(
                color: AppColors.textMuted, fontSize: width * 0.04, fontWeight: FontWeight.w600)),
        SizedBox(height: width * 0.05),
        _MiniCard(
          width: width,
          child: Row(
            children: [
              Container(
                width: width * 0.11,
                height: width * 0.11,
                decoration: BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  borderRadius: BorderRadius.circular(width * 0.03),
                ),
                child: Icon(Icons.dashboard_customize_rounded,
                    color: Colors.white, size: width * 0.06),
              ),
              SizedBox(width: width * 0.04),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Shift Management',
                        style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: width * 0.038,
                            fontWeight: FontWeight.w600)),
                    SizedBox(height: width * 0.01),
                    Text('On Track',
                        style: GoogleFonts.inter(
                            color: AppColors.success, fontSize: width * 0.032)),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: width * 0.04),
        _MiniCard(
          width: width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Tasks',
                      style: GoogleFonts.inter(
                          color: AppColors.textMuted, fontSize: width * 0.032)),
                  Text('12',
                      style: GoogleFonts.spaceGrotesk(
                          color: Colors.white,
                          fontSize: width * 0.06,
                          fontWeight: FontWeight.w700)),
                  Text('This Week',
                      style: GoogleFonts.inter(
                          color: AppColors.textMuted, fontSize: width * 0.028)),
                ],
              ),
              SizedBox(
                width: width * 0.22,
                height: width * 0.14,
                child: CustomPaint(painter: _MiniSparklinePainter()),
              ),
            ],
          ),
        ),
        SizedBox(height: width * 0.09),
        Text('Recent Activity',
            style: GoogleFonts.inter(
                color: AppColors.textMuted, fontSize: width * 0.04, fontWeight: FontWeight.w600)),
        SizedBox(height: width * 0.05),
        _ActivityRow(
          width: width,
          icon: Icons.check_circle_rounded,
          color: AppColors.success,
          title: 'Shift request approved',
          time: '3m ago',
        ),
        SizedBox(height: width * 0.035),
        _ActivityRow(
          width: width,
          icon: Icons.person_add_alt_1_rounded,
          color: AppColors.secondary,
          title: 'New user registered',
          time: '5m ago',
        ),
      ],
    );
  }
}

class _PerformanceScreen extends StatelessWidget {
  final double width;
  const _PerformanceScreen({required this.width});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _StatusBar(width: width),
        SizedBox(height: width * 0.09),
        Text('Performance',
            style: GoogleFonts.spaceGrotesk(
                color: Colors.white, fontSize: width * 0.07, fontWeight: FontWeight.w700)),
        SizedBox(height: width * 0.02),
        Text('This Week',
            style: GoogleFonts.inter(color: AppColors.textMuted, fontSize: width * 0.038)),
        SizedBox(height: width * 0.12),
        Center(
          child: SizedBox(
            width: width * 0.5,
            height: width * 0.5,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox.expand(
                  child: CircularProgressIndicator(
                    value: 1,
                    strokeWidth: width * 0.045,
                    color: AppColors.surfaceLight,
                  ),
                ),
                SizedBox.expand(
                  child: CircularProgressIndicator(
                    value: 0.76,
                    strokeWidth: width * 0.045,
                    valueColor: const AlwaysStoppedAnimation(AppColors.accent),
                    strokeCap: StrokeCap.round,
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('76%',
                        style: GoogleFonts.spaceGrotesk(
                            color: Colors.white,
                            fontSize: width * 0.09,
                            fontWeight: FontWeight.w700)),
                    Text('This Week',
                        style: GoogleFonts.inter(
                            color: AppColors.textMuted, fontSize: width * 0.028)),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: width * 0.12),
        _MiniCard(
          width: width,
          child: SizedBox(
            height: width * 0.24,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(6, (i) {
                final heights = [0.4, 0.65, 0.5, 0.85, 0.6, 0.95];
                final isLast = i == 5;
                return Container(
                  width: width * 0.06,
                  height: (width * 0.2) * heights[i],
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: isLast
                          ? [AppColors.primary, AppColors.accent]
                          : [
                              AppColors.surfaceLight,
                              AppColors.surfaceLight,
                            ],
                    ),
                    borderRadius: BorderRadius.circular(width * 0.02),
                  ),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}

class _MiniCard extends StatelessWidget {
  final double width;
  final Widget child;
  const _MiniCard({required this.width, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(width * 0.045),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.045),
        borderRadius: BorderRadius.circular(width * 0.05),
        border: Border.all(color: Colors.white.withValues(alpha: 0.07)),
      ),
      child: child,
    );
  }
}

class _ActivityRow extends StatelessWidget {
  final double width;
  final IconData icon;
  final Color color;
  final String title;
  final String time;
  const _ActivityRow({
    required this.width,
    required this.icon,
    required this.color,
    required this.title,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: width * 0.09,
          height: width * 0.09,
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(width * 0.025),
          ),
          child: Icon(icon, color: color, size: width * 0.045),
        ),
        SizedBox(width: width * 0.03),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: GoogleFonts.inter(
                      color: Colors.white, fontSize: width * 0.032, fontWeight: FontWeight.w500)),
              Text(time,
                  style: GoogleFonts.inter(
                      color: AppColors.textMuted, fontSize: width * 0.028)),
            ],
          ),
        ),
      ],
    );
  }
}

class _MiniSparklinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.accent
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final points = [0.8, 0.6, 0.65, 0.4, 0.5, 0.2, 0.1];
    final path = Path();
    for (int i = 0; i < points.length; i++) {
      final x = size.width * (i / (points.length - 1));
      final y = size.height * points[i];
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../widgets/common_widgets.dart';

class _Testimonial {
  final String quote;
  final String author;
  final String role;
  const _Testimonial(this.quote, this.author, this.role);
}

class TestimonialsSection extends StatefulWidget {
  const TestimonialsSection({super.key});

  @override
  State<TestimonialsSection> createState() => _TestimonialsSectionState();
}

class _TestimonialsSectionState extends State<TestimonialsSection> {
  final _controller = PageController();
  Timer? _timer;
  int _page = 0;

  static const _items = [
    _Testimonial(
      'Prabhu is an exceptional engineer who consistently delivers high-quality '
      'solutions with clean code and great attention to detail.',
      'Product Manager',
      'Dsaas.ai',
    ),
    _Testimonial(
      'One of the most reliable Flutter engineers I have worked with — he owns '
      'problems end to end and ships on time, every time.',
      'Engineering Lead',
      'Dsaas.ai',
    ),
    _Testimonial(
      'Prabhu turned our clunky prototype into a polished, production-ready app '
      'that our users genuinely love.',
      'Founder',
      'Agira Technologies (Client)',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 5), (_) {
      if (!mounted) return;
      final next = (_page + 1) % _items.length;
      _controller.animateToPage(
        next,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOutCubic,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final mobile = isMobile(width);

    return Section(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const RevealOnScroll(child: SectionLabel('Testimonials')),
          const SizedBox(height: 24),
          RevealOnScroll(
            delay: const Duration(milliseconds: 100),
            child: SizedBox(
              height: mobile ? 200 : 170,
              child: PageView.builder(
                controller: _controller,
                itemCount: _items.length,
                onPageChanged: (i) => setState(() => _page = i),
                itemBuilder: (context, i) {
                  final t = _items[i];
                  return Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColors.border),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.format_quote_rounded, color: AppColors.primary.withValues(alpha: 0.5), size: 28),
                        const SizedBox(height: 10),
                        Text(
                          t.quote,
                          style: AppText.body.copyWith(
                            fontSize: 15,
                            fontStyle: FontStyle.italic,
                            color: AppColors.textPrimary.withValues(alpha: 0.9),
                          ),
                        ),
                        const SizedBox(height: 14),
                        Text(
                          '${t.author} · ${t.role}',
                          style: GoogleFonts.inter(
                            color: AppColors.textMuted,
                            fontSize: 12.5,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < _items.length; i++)
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: _page == i ? 22 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: _page == i ? AppColors.primary : AppColors.border,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

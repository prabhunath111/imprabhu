import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
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
      "I had the pleasure of working with Prabhu for over two years, and he is one of the most reliable and talented mobile developers I have worked with. \nHe is outstanding performer who is deeply committed to his work. Always proactive, Prabhu brings clarity even in the middle of chaos and takes the lead in driving priorities forward.\nBuilding our mobile app came with its share of challenges and shifting directions,but thanks to his ownership and consistency, we were always in a production ready state and aligned closely with the web experience, even when mobile was not the primary focus.\n Beyond his technical strengths, Prabhu is highly empathetic and a great team player. He genuinely cares about his teammates and contributes positively to the team's culture. He would be a valuable addition to any team, and I highly recommend him",
      'Senior Product Manager',
      'Dsaas.ai',
    ),
    _Testimonial(
      "I've had the chance to work closely with Prabhu Nath, and he's someone you can always rely on. He manages the team really well, breaks down tasks clearly, and makes sure work moves smoothly without chaos. He’s a strong software engineer who never compromises on quality and always delivers on time. What stands out most to me is that whenever there's an emergency or a tough situation, Prabhu is always the first one to step up and take ownership. Working with him has been a great experience, and any team would be lucky to have him.",
      'Software Engineer',
      'hireHQ.ai',
    ),
    _Testimonial(
      "I had the opportunity to work closely with Prabhu on multiple mobile features, and he consistently stood out for his technical excellence, ownership mindset, and reliability. He has a deep understanding of Flutter and frontend architecture, and he translates complex product requirements into clean, scalable, and high-performance user interfaces with great attention to detail and UX. \nWhat I truly appreciate about Prabhu is his proactive approach to problem-solving. He identifies potential issues early, suggests thoughtful improvements to implementation and architecture, and ensures code quality through thorough reviews. He collaborates smoothly with product, design, and QA, helping the team move faster without compromising on quality.\nBeyond technical skills, Prabhu brings a calm, supportive leadership style to the team. He’s approachable, always willing to guide teammates, and creates a positive, collaborative environment. His sense of ownership, accountability, and commitment to continuous improvement make him a strong asset to any frontend or Flutter team. I highly recommend Prabhu and would gladly work with him.",
      'Software Engineer',
      'Dsaas.ai & hireHQ.ai',
    ),
    _Testimonial(
      "I had the opportunity to work closely with Prabhu at SimplifyVMS, and he consistently did an excellent job supporting both the team and individual teammates. Prabhu brought valuable insights to the table and took the time to mentor and handhold team members, guiding them whenever needed. He was our go-to person for everything related to mobile development as well as the broader application, and his reliability and expertise made a meaningful impact on our work.",
      'QA Lead',
      'Dsaas.ai',
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
    final double width = MediaQuery.sizeOf(context).width;
    final bool mobile = isMobile(width);

    return Section(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              const RevealOnScroll(child: SectionLabel('Testimonials')),
              RevealOnScroll(
                delay: const Duration(milliseconds: 100),
                child: TextButton.icon(
                  onPressed: () => _open('https://www.linkedin.com/in/prabhu-india/details/recommendations/?detailScreenTabIndex=0'),
                  icon: const Icon(Icons.arrow_forward_rounded, size: 16, color: AppColors.primary),
                  label: Text(
                    'Read All',
                    style: GoogleFonts.inter(color: AppColors.primary, fontWeight: FontWeight.w600, fontSize: 13),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          RevealOnScroll(
            delay: const Duration(milliseconds: 100),
            child: SizedBox(
              height: mobile ? 250 : 200,
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
                          maxLines: mobile ? 8 : 3,
                          overflow: TextOverflow.ellipsis,
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

  Future<void> _open(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, webOnlyWindowName: '_blank');
    }
  }
}

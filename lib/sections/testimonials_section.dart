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
    //Aashi - Lead focus
    _Testimonial(
      "I had the pleasure of working closely with Prabhu and he led the mobile engineering team. As a Mobile Team Lead, he consistently demonstrated strong technical expertise along with a deep sense of ownership for the product.\n"
      "What truly sets him apart is his ability to translate complex product requirements into scalable, high-quality mobile solutions. He was always proactive in discussions, challenged assumptions in a constructive way, and ensured that the team delivered features on time without compromising on quality.\n"
      "Working with him was extremely smooth- clear communication, realistic estimations, and a genuine focus on delivering user value. He also did a great job mentoring team members and creating a collaborative, positive engineering culture.\n"
      "I highly recommend Prabhu and would gladly work with him again if given the chance.",
      'BA(Product)',
      'hireHQ.ai',
    ),
    //Abraham - Reliable & Talented Performance
    _Testimonial(
      "I had the pleasure of working with Prabhu for over two years, and he is one of the most reliable and talented mobile developers I have worked with. \nHe is outstanding performer who is deeply committed to his work. Always proactive, Prabhu brings clarity even in the middle of chaos and takes the lead in driving priorities forward.\nBuilding our mobile app came with its share of challenges and shifting directions,but thanks to his ownership and consistency, we were always in a production ready state and aligned closely with the web experience, even when mobile was not the primary focus.\n Beyond his technical strengths, Prabhu is highly empathetic and a great team player. He genuinely cares about his teammates and contributes positively to the team's culture. He would be a valuable addition to any team, and I highly recommend him",
      'Senior Product Manager',
      'Dsaas.ai',
    ),
    //Nishchal
    _Testimonial(
      "I've had the chance to work closely with Prabhu Nath, and he's someone you can always rely on. He manages the team really well, breaks down tasks clearly, and makes sure work moves smoothly without chaos. He’s a strong software engineer who never compromises on quality and always delivers on time. What stands out most to me is that whenever there's an emergency or a tough situation, Prabhu is always the first one to step up and take ownership. Working with him has been a great experience, and any team would be lucky to have him.",
      'Software Engineer',
      'hireHQ.ai',
    ),
    //Yashika
    _Testimonial(
      "I had the opportunity to work closely with Prabhu on multiple mobile features, and he consistently stood out for his technical excellence, ownership mindset, and reliability. He has a deep understanding of Flutter and frontend architecture, and he translates complex product requirements into clean, scalable, and high-performance user interfaces with great attention to detail and UX.\nWhat I truly appreciate about Prabhu is his proactive approach to problem-solving. He identifies potential issues early, suggests thoughtful improvements to implementation and architecture, and ensures code quality through thorough reviews. He collaborates smoothly with product, design, and QA, helping the team move faster without compromising on quality.\nBeyond technical skills, Prabhu brings a calm, supportive leadership style to the team. He’s approachable, always willing to guide teammates, and creates a positive, collaborative environment. His sense of ownership, accountability, and commitment to continuous improvement make him a strong asset to any frontend or Flutter team. I highly recommend Prabhu and would gladly work with him.",
      'Software Engineer',
      'Dsaas.ai & hireHQ.ai',
    ),
    //Savitha
    _Testimonial(
      "Prabhu is a highly capable Flutter developer with solid hands-on expertise and a strong commitment to continuous improvement. He is always eager to learn, adapt, and grow, both technically and professionally. His ability to manage teams effectively while delivering quality work truly sets him apart.",
      'Engineering Manager',
      'Dsaas.ai',
    ),
    //Moksha
    _Testimonial(
      "During our time at SimplifyVMS, Prabhu and I collaborated closely on hireHQ. I was consistently impressed by how fast he could grasp the architecture and understand the system flow. Even when we were deep in the toughest modules of the project, Prabhu's problem-solving skills shone through. He was my go-to person for navigating difficult technical hurdles, and his contribution was vital to our project's success. He is definitely a great asset to any organisation!",
      'Lead Engineer',
      'Dsaas.ai',
    ),
    //Sunisha
    _Testimonial(
      "I worked with Prabhu at Simplify as his Lead, and it was a great experience both professionally and personally. Prabhu has strong Flutter skills and consistently delivered quality work, but what really stands out is his enthusiasm to learn beyond Flutter as well. He's very active, curious, and always eager to pick up new tools and concepts. Prabhu is also extremely helpful and supportive toward his teammates-someone you can always rely on when you need a hand. Over time, he became not just a great teammate but a good friend too. His positive attitude, willingness to learn, and collaborative nature make him a pleasure to work with. I'd highly recommend Prabhu to any team looking for a skilled developer and a genuinely good person to work with.🍀",
      'Mobile Architect',
      'Dsaas.ai',
    ),
    //Aniket
    _Testimonial(
      "I've had the privilege of working with Prabhu, and I can undoubtedly say he is one of the best people I've ever worked with. His strong understanding of Flutter architecture and his skill sets in React and Node are outstanding. With his expertise, he is always ready to tackle any challenge with ease and can provide top-notch solutions with minimal effort. I highly recommend Prabhu knowing him both personally and professionally, I can confidently say he will be a valuable asset to any team he joins.",
      'Senior Software Engineer',
      'Dsaas.ai',
    ),
    //Rahul
    _Testimonial(
      "I had the opportunity to work closely with Prabhu at SimplifyVMS, and he consistently did an excellent job supporting both the team and individual teammates. Prabhu brought valuable insights to the table and took the time to mentor and handhold team members, guiding them whenever needed. He was our go-to person for everything related to mobile development as well as the broader application, and his reliability and expertise made a meaningful impact on our work.",
      'QA Lead',
      'Dsaas.ai',
    ),
    //Vaibhav
    _Testimonial(
      "I had the opportunity to work with Prabhu Nath for some time, and he was my senior during this period. I reported directly to him, and working under his guidance was a great learning experience. Prabhu has very strong debugging and problem-solving skills. He understands issues quickly and always provides clear and effective solutions. As a team leader, he is supportive, calm, and approachable, which makes it easy for team members to communicate and learn.",
      'Lead Engineer',
      'The Baap Company',
    ),
    //Chaitanya
    _Testimonial(
      "I really enjoyed working with Prabhu. He’s someone who genuinely takes ownership, stays professional no matter the situation, and is always there for the team. His mobile development skills are rock solid, he mentors juniors with patience and clarity, and on top of that, he’s a kind person who makes the workplace better. I’d happily work with him again.",
      'Senior Software Engineer',
      'Dsaas.ai',
    ),
    //Jalindar
    _Testimonial(
      "I had the pleasure of working with Prabhu Nath Tiwary, and I can confidently say he is an exceptionally talented and knowledgeable software engineer. He has a very strong command of Flutter and always demonstrates deep technical understanding while solving complex problems.\n"
      "What truly sets Prabhu apart is his ability to explain concepts clearly and guide others with patience. He is not only technically excellent but also very friendly, supportive, and easy to work with as a team member.\n"
      "His dedication, problem-solving skills, and positive attitude make him a valuable asset to any organization. I highly recommend Prabhu for any role that requires strong Flutter development and technical leadership.",
      'Fullstack Developer',
      'The Baap Company',
    ),
    //Sahil
    _Testimonial(
      "I really enjoyed working  with prabhu. he is hardworking, a good mentor, writer, speaker always ready to help. I wish him all the best for his ongoing journey 😊",
      'Full stack developer',
      'The Baap Company',
    ),

  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 55), (_) {
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
                      crossAxisAlignment: .start,
                      mainAxisAlignment: .center,
                      mainAxisSize: .min,
                      children: [
                        Icon(Icons.format_quote_rounded, color: AppColors.primary.withValues(alpha: 0.5), size: 28),
                        const SizedBox(height: 10),
                        Text(
                          t.quote,
                          maxLines: mobile ? 4 : 3,
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

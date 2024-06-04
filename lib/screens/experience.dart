import 'dart:async';

import 'package:flutter/material.dart';
import 'package:portfolio/widgets/experience_card.dart';
import 'package:portfolio/widgets/kf_drawer.dart';

// ignore: must_be_immutable
class Experience extends KFDrawerContent {
  Experience({super.key});

  @override
  State<Experience> createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> {
  @override
  Widget build(BuildContext context) {
    final experienceList = [
      {
        'title': 'Software Engineer',
        'company': 'Ciro Technologies',
        'imageUrl': 'https://clientes.cirobus.com/img/IMG2.b6d61a0f.png',
        'description':
            """• Deeply working on the development and deployment of 3+ high-performance web applications utilizing Vue.js. These applications delivered exceptional user experiences and consistently exceeded client expectations. 
• Designed and implemented 20+ engaging and user-friendly user interfaces (UIs). These UIs effectively boosted user engagement and played a key role in driving project success. 
• Transformed complex data into 2+ interactive and informative dashboards. These dashboards provided stakeholders with actionable insights, empowering them to make informed decisions. 
• Code collaboration practices on GitHub. This included ensuring a 95%+ code review completion rate, thereby maintaining high code quality and fostering a collaborative development environment.""",
        'isLight': false
      },
      {
        'title': 'Head of Growth Department',
        'company': 'Cush Digital',
        'imageUrl':
            'https://cush.digital/wp-content/uploads/2023/10/Cush-Digital-Logo-Transparent-1.png',
        'description':
            """• Spearheaded comprehensive digital marketing strategies, overseeing SEO, PPC, and social media advertising initiatives to drive client growth and engagement.
• Achieved remarkable results, including a 900% increase in clients’ website traffic and the generation of over 10,000 leads through targeted paid advertising campaigns.
• Implemented innovative SEO strategies, resulting in a significant 32.76% improvement in organic search rankings for critical target keywords, enhancing online visibility and brand recognition.
• Demonstrated exceptional leadership skills by effectively managing and mentoring a team of digital marketing professionals, fostering a collaborative and supportive work environment conducive to achieving team goals.
• Provided strategic guidance and direction to the growing digital marketing team, leveraging strong communication and interpersonal skills to ensure alignment with business objectives.""",
        'isLight': true
      },
      {
        'title': 'Teaching Assistant',
        'company': 'Comboni College of Science and Technology',
        'imageUrl': 'https://combonikhartoum.com/images/CCST%20LOGO.png',
        'description':
            """• Empowered over 200 students by imparting valuable skills in PHP, IoT, Arduino, sensors, and emerging technologies, fostering a passion for innovation and technological advancement.
• Introduced students to the potential of IoT through engaging and interactive activities, stimulating creativity, and encouraging exploration of its diverse applications.
• Bridged the gap between theory and practice by leading students through 10+ hands-on lab experiments, facilitating practical skills development and solidifying understanding.
""",
        'isLight': false
      }
    ];

    return SafeArea(
      child: Center(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(32.0)),
                  child: Material(
                    shadowColor: Colors.transparent,
                    color: Colors.transparent,
                    child: IconButton(
                      icon: const Icon(
                        Icons.menu,
                        color: Colors.black,
                      ),
                      onPressed: widget.onMenuPressed,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView(
                children: experienceList
                    .map(
                      (exp) => ExperienceCard(
                        isLight: exp['isLight'] as bool,
                        imageUrl: exp['imageUrl'] as String,
                        title: exp['title'] as String,
                        company: exp['company'] as String,
                        description: exp['description'] as String,
                        imageLoadingFuture:
                            _loadNetworkImage(exp['imageUrl'] as String),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _loadNetworkImage(String url) {
    final Completer<void> completer = Completer<void>();
    final Image image = Image.network(url);

    image.image.resolve(const ImageConfiguration()).addListener(
          ImageStreamListener(
            (ImageInfo info, bool synchronousCall) {
              completer.complete();
            },
            onError: (Object error, StackTrace? stackTrace) {
              completer.completeError(error, stackTrace);
            },
          ),
        );

    return completer.future;
  }
}

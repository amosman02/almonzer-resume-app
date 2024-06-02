import 'package:flutter/material.dart';
import 'package:portfolio/widgets/experience_card.dart';
import 'package:portfolio/widgets/kf_drawer.dart';

// ignore: must_be_immutable
class Education extends KFDrawerContent {
  Education({super.key});

  @override
  State<Education> createState() => _EducationState();
}

class _EducationState extends State<Education> {
  @override
  Widget build(BuildContext context) {
    final educationList = [
      {
        'title': 'B.Sc. in Information Technology',
        'company': 'Alzaiem Alazhari University',
        'imageUrl':
            'https://rwaqna.com/wp-content/uploads/2020/12/%D8%AC%D8%A7%D9%85%D8%B9%D8%A9-%D8%A7%D9%84%D8%B2%D8%B9%D9%8A%D9%85-%D8%A7%D9%84%D8%A3%D8%B2%D9%87%D8%B1%D9%8A.jpg',
        'description': """
Graduate in IT from Al Zaiem Al Azhary University with a comprehensive background in networking,security, data architecture, coding, HCI, bioinformatics, and more. My diverse education equips me toexcel in the dynamic IT landscape, enabling innovative solutions and driving digital progress.
            """,
        'isLight': false
      },
      {
        'title': 'AWS Cloud Practitioner',
        'company': 'Amazon Web Serives (AWS)',
        'imageUrl':
            'https://a0.awsstatic.com/libra-css/images/logos/aws_logo_smile_1200x630.png',
        'description': "",
        'isLight': true
      },
      {
        'title': 'AWS Knowledge: Architecting',
        'company': 'Amazon Web Serives (AWS)',
        'imageUrl':
            'https://a0.awsstatic.com/libra-css/images/logos/aws_logo_smile_1200x630.png',
        'description': "",
        'isLight': true
      },
      {
        'title': 'AWS Educate Web Builder',
        'company': 'Amazon Web Serives (AWS)',
        'imageUrl':
            'https://a0.awsstatic.com/libra-css/images/logos/aws_logo_smile_1200x630.png',
        'description': "",
        'isLight': true
      },
      {
        'title': 'Problem Solving (Intermediate)',
        'company': 'HackerRank',
        'imageUrl':
            'https://wizardsourcer.com/wp-content/uploads/2021/10/HackerRank-logo.png',
        'description': "",
        'isLight': true
      },
      {
        'title': 'JavaScript (Intermediate)',
        'company': 'HackerRank',
        'imageUrl':
            'https://wizardsourcer.com/wp-content/uploads/2021/10/HackerRank-logo.png',
        'description': "",
        'isLight': true
      },
      {
        'title': 'Responsive Web Design',
        'company': 'FreeCodeCamp',
        'imageUrl':
            'https://i.pcmag.com/imagery/reviews/01tPXClg2WjLamQzScplH3y-15.fit_scale.size_760x427.v1627670281.png',
        'description': "",
        'isLight': true
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
                children: educationList
                    .map(
                      (exp) => ExperienceCard(
                        isLight: exp['isLight'] as bool,
                        imageUrl: exp['imageUrl'] as String,
                        title: exp['title'] as String,
                        company: exp['company'] as String,
                        description: exp['description'] as String,
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
}

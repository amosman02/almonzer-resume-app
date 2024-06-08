import 'dart:async';

import 'package:flutter/material.dart';
import 'package:portfolio/widgets/experience_card.dart';
import 'package:portfolio/widgets/kf_drawer.dart';

// ignore: must_be_immutable
class ProjectsScreen extends KFDrawerContent {
  ProjectsScreen({super.key});

  @override
  State<ProjectsScreen> createState() => _ProjectsState();
}

class _ProjectsState extends State<ProjectsScreen> {
  @override
  Widget build(BuildContext context) {
    final experienceList = [
      {
        'title': 'Checkedin Mobile App',
        'company': 'Freelancer',
        'imageUrl':
            'https://lh3.googleusercontent.com/drive-viewer/AKGpihZEmIm8cayzXx81FYaM9mB8vDhUEduINaYCdyUZ6rw0QGPsco6LsZDD_oPt7iAM4Hs-U4o4R4IY6SttjOmAmUHeYkG0zysnfEs=w3840-h1822-rw-v1',
        'description': """
Checkedin simplifies travel by handling luggage logistics. Users schedule luggage pickup 24 hours before their flight, ensuring a stress-free journey. As a project contributor, I helped develop key features for seamless user experience using Flutter, Firebase, FirebaseAuth, and Firebase Firestore.
            """,
        'isLight': false
      },
      {
        'title': 'MyHlth Website',
        'company': 'MyHlth Organisation',
        'imageUrl': 'https://myhlth.org/wp-content/uploads/2023/10/Logo@2x.png',
        'description': """
• Led the development of MyHlth, a revolutionary health and wellness website, emphasizing a user-centric approach and advanced UX/UI design principles.
• Designed and implemented a visually appealing user interface, prioritizing intuitive navigation and vibrant aesthetics to enhance user engagement.
• Employed advanced design principles to ensure usability and accessibility, resulting in a seamless user experience across various devices.
• Demonstrated expertise in frontend development and responsive design techniques, ensuring consistent performance and adaptability.
• Contributed to the creation of a digital platform that promotes well-being and elevates the journey towards a healthier lifestyle through innovative design and technology.
            """,
        'isLight': true
      },
      {
        'title': 'Trekko Wholesaler Website',
        'company': 'Trekko.cr',
        'imageUrl': 'https://www.trekko.cr/static/media/logo_beta.a7b7ff7d.png',
        'description': """
Developed a dynamic profile webpage for wholesalers using the MERN Stack (MongoDB, Express.js, React.js, Node.js) developing the full-stack by myself (front-end and back-end), achieving responsiveness across devices.
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

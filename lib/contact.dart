import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:portfolio/widgets/kf_drawer.dart';
import 'package:portfolio/constants/colors.dart' as constants;
import 'package:url_launcher/url_launcher.dart';

class Contact extends KFDrawerContent {
  Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 150,
                    height: 150,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.elliptical(20, 20),
                      ),
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/me-1.jpg',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Intersted to know more about me?',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Don\'t wait! CONTACT ME NOW!',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(width: 20),
                      const Icon(
                        FeatherIcons.phone,
                        color: constants.darkBlue,
                      ),
                      const SizedBox(width: 5),
                      const Text('CALL: '),
                      TextButton(
                        onPressed: () async {
                          final Uri url =
                              Uri(scheme: 'tel', path: '+971529938220');
                          if (await canLaunchUrl(url)) {
                            await launchUrl(url);
                          } else {
                            print('cannot lauch this url');
                          }
                        },
                        child: const Text(
                          '+971529938220',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: constants.darkBeige,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(width: 20),
                      const Icon(
                        FeatherIcons.mail,
                        color: constants.darkBlue,
                      ),
                      const SizedBox(width: 5),
                      const Text('EMAIL: '),
                      TextButton(
                        onPressed: () async {
                          String? encodeQueryParameters(
                              Map<String, String> params) {
                            return params.entries
                                .map((MapEntry<String, String> e) =>
                                    '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                                .join('&');
                          }

                          final Uri emailLaunchUri = Uri(
                            scheme: 'mailto',
                            path: 'almonzer.m.osman@gmail.com',
                            query: encodeQueryParameters(<String, String>{
                              'subject':
                                  'Configurations 🎉 We want to hire you!',
                            }),
                          );

                          launchUrl(emailLaunchUri);
                        },
                        child: const Text(
                          'almonzer.m.osman@gmail.com',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: constants.darkBeige,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

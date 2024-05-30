import 'package:flutter/material.dart';
import 'package:portfolio/experience.dart';
import 'package:portfolio/class_builder.dart';
import 'package:portfolio/home.dart';
import 'package:portfolio/contact.dart';
import 'package:portfolio/education.dart';
import 'package:portfolio/projects.dart';
import 'package:portfolio/widgets/kf_drawer.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

void main() {
  ClassBuilder.registerClasses();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MainWidget(
        title: 'Home',
      ),
    );
  }
}

class MainWidget extends StatefulWidget {
  const MainWidget({super.key, required this.title});
  final String title;

  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> with TickerProviderStateMixin {
  late KFDrawerController _drawerController;

  @override
  void initState() {
    super.initState();
    _drawerController = KFDrawerController(
      initialPage: ClassBuilder.fromString('Home'),
      items: [
        KFDrawerItem.initWithPage(
          text: const Text('Home',
              style: TextStyle(color: Colors.white, fontSize: 18)),
          icon: const Icon(
            FeatherIcons.home,
            color: Colors.white,
          ),
          page: Home(),
        ),
        KFDrawerItem.initWithPage(
          text: const Text(
            'Work Experience',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          icon: const Icon(
            FeatherIcons.briefcase,
            color: Colors.white,
          ),
          page: Experience(),
        ),
        KFDrawerItem.initWithPage(
          text: const Text(
            'Projects',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          icon: const Icon(
            FeatherIcons.cpu,
            color: Colors.white,
          ),
          page: Projects(),
        ),
        KFDrawerItem.initWithPage(
          text: const Text(
            'Education',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          icon: const Icon(
            FeatherIcons.feather,
            color: Colors.white,
          ),
          page: Education(),
        ),
        KFDrawerItem.initWithPage(
          text: const Text(
            'Contact me',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          icon: const Icon(
            FeatherIcons.mail,
            color: Colors.white,
          ),
          page: Contact(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KFDrawer(
        controller: _drawerController,
        header: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            width: MediaQuery.of(context).size.width * 0.8,
            child: Row(
              children: <Widget>[
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    image: const DecorationImage(
                        image: AssetImage('assets/images/me-1.jpg'),
                        fit: BoxFit.cover,
                        scale: 5),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Almonzer Osman',
                        style: TextStyle(fontSize: 17, color: Colors.white)),
                    SizedBox(height: 2),
                    Text('Software Engineer',
                        style: TextStyle(fontSize: 15, color: Colors.grey)),
                  ],
                )
              ],
            ),
          ),
        ),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromRGBO(31, 58, 47, 1.0),
              Color.fromRGBO(31, 58, 47, 1.0)
            ],
            tileMode: TileMode.repeated,
          ),
        ),
      ),
    );
  }
}

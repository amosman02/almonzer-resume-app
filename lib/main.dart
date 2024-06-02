import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/screens/experience.dart';
import 'package:portfolio/class_builder.dart';
import 'package:portfolio/screens/home.dart';
import 'package:portfolio/contact.dart';
import 'package:portfolio/screens/education.dart';
import 'package:portfolio/screens/projects.dart';
import 'package:portfolio/screens/welcome_screen.dart';
import 'package:portfolio/services/auth_service.dart';
import 'package:portfolio/widgets/kf_drawer.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:portfolio/constants/colors.dart' as constants;
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
        fontFamily: GoogleFonts.montserratAlternates().fontFamily,
      ),
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (ctx, snapshot) {
          if (snapshot.hasData) {
            return const MainWidget(title: 'Home');
          }
          return const WelcomePage();
        },
      ),
    );
  }
}

class MainWidget extends StatefulWidget {
  const MainWidget({super.key, required this.title});
  final String title;

  @override
  State<MainWidget> createState() => _MainWidgetState();
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
              style: TextStyle(color: constants.darkBlue, fontSize: 18)),
          icon: const Icon(
            FeatherIcons.home,
            color: constants.darkBlue,
          ),
          page: Home(),
        ),
        KFDrawerItem.initWithPage(
          text: const Text(
            'Work Experience',
            style: TextStyle(color: constants.darkBlue, fontSize: 18),
          ),
          icon: const Icon(
            FeatherIcons.briefcase,
            color: constants.darkBlue,
          ),
          page: Experience(),
        ),
        KFDrawerItem.initWithPage(
          text: const Text(
            'Projects',
            style: TextStyle(color: constants.darkBlue, fontSize: 18),
          ),
          icon: const Icon(
            FeatherIcons.cpu,
            color: constants.darkBlue,
          ),
          page: Projects(),
        ),
        KFDrawerItem.initWithPage(
          text: const Text(
            'Education',
            style: TextStyle(color: constants.darkBlue, fontSize: 18),
          ),
          icon: const Icon(
            FeatherIcons.feather,
            color: constants.darkBlue,
          ),
          page: Education(),
        ),
        KFDrawerItem.initWithPage(
          text: const Text(
            'Contact me',
            style: TextStyle(color: constants.darkBlue, fontSize: 18),
          ),
          icon: const Icon(
            FeatherIcons.mail,
            color: constants.darkBlue,
          ),
          page: Contact(),
        ),
        KFDrawerItem.initWithPage(
          text: const Text(
            'Logout',
            style: TextStyle(color: constants.danger, fontSize: 18),
          ),
          icon: const Icon(
            FeatherIcons.logOut,
            color: constants.danger,
          ),
          onPressed: AuthService().signOut,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constants.bgColor,
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
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: constants.darkBlue,
                        )),
                    SizedBox(height: 2),
                    Text('Software Engineer',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: constants.darkBlue,
                        )),
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
              constants.darkBeige,
              constants.lightBeige,
            ],
            tileMode: TileMode.repeated,
          ),
        ),
      ),
    );
  }
}

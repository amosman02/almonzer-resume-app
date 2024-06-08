import 'package:flutter/material.dart';
import 'package:portfolio/screens/details_screen.dart';
import 'package:portfolio/widgets/kf_drawer.dart';
import 'package:portfolio/widgets/pdf_share.dart';

// ignore: must_be_immutable
class HomeScreen extends KFDrawerContent {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  const PDFShareWidget()
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text("Almonzer Osman",
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 15),
                    const Text(
                      "Highly motivated and results-oriented software engineer with over 6 years of experience delivering innovative solutions across diverse projects. Skilled in frontend development with Vue.js, React.js, and Next.js, as well as mobile application development using Flutter. Excels in managing complex technical challenges and collaborating with stakeholders to exceed expectations.",
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.45,
                      width: double.infinity,
                      child: Container(
                        width: 325,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/me-3.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                        "Use the menu to navigate to different sections about me",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget listItem(String imgpath) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DetailsScreen(
                  imgPath: imgpath,
                )));
      },
      child: Container(
        width: 325,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          image: DecorationImage(image: AssetImage(imgpath), fit: BoxFit.cover),
        ),
      ),
    );
  }
}

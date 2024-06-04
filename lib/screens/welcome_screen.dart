import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart' as constants;
import 'package:portfolio/widgets/modals/login_modal.dart';
import 'package:portfolio/widgets/modals/register_modal.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/me-3.jpg'),
                  fit: BoxFit.cover),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 32),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 60 / 100,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black.withOpacity(0.70), Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 16),
                        child: Text('Checkedin',
                            style: TextStyle(
                                fontFamily: 'inter',
                                fontWeight: FontWeight.w700,
                                fontSize: 32,
                                color: Colors.white)),
                      ),
                      Text("Help you to get your lagguange out of your concer",
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Get Started Button
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        child: ElevatedButton(
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              backgroundColor: Colors.white,
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20))),
                              isScrollControlled: true,
                              builder: (context) {
                                return const RegisterModal();
                              },
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            backgroundColor: constants.darkBlue,
                          ),
                          child: const Text(
                            'Get Started',
                            style: TextStyle(
                              color: constants.bgColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Log in Button
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        child: OutlinedButton(
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              backgroundColor: constants.darkBlue,
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20))),
                              isScrollControlled: true,
                              builder: (context) {
                                return const LoginModal();
                              },
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            side: BorderSide(
                                color: constants.bgColor.withOpacity(0.5),
                                width: 1),
                          ),
                          child: const Text(
                            'Log in',
                            style: TextStyle(
                              color: constants.bgColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        margin: const EdgeInsets.only(top: 32),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: 'By joining Checkedin, you agree to our ',
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.6),
                                height: 150 / 100),
                            children: [
                              TextSpan(
                                text: 'Terms of service ',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.6),
                                    fontWeight: FontWeight.w700,
                                    height: 150 / 100),
                              ),
                              TextSpan(
                                text: 'and ',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.6),
                                    height: 150 / 100),
                              ),
                              TextSpan(
                                text: 'Privacy policy.',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.6),
                                    fontWeight: FontWeight.w700,
                                    height: 150 / 100),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart' as constants;

class ExperienceCard extends StatelessWidget {
  const ExperienceCard({
    super.key,
    required this.isLight,
    required this.imageUrl,
    required this.title,
    required this.company,
    required this.description,
  });

  final bool isLight;
  final String imageUrl;
  final String title;
  final String company;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: isLight ? constants.bgColor : constants.darkBeige,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Column(
        children: [
          Container(
            height: 225,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.elliptical(20, 20)),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 15),
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: !isLight ? constants.bgColor : constants.darkBeige,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            company,
            style: TextStyle(
              fontSize: 14,
              color: !isLight ? constants.bgColor : constants.darkBlue,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            description,
            style: TextStyle(
              fontSize: 14,
              color: !isLight ? constants.bgColor : constants.darkBlue,
              height: 1.7,
            ),
          ),
        ],
      ),
    );
  }
}

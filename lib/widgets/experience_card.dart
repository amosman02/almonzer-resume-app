import 'package:flutter/material.dart';

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
      color: isLight ? Colors.white : const Color.fromRGBO(31, 58, 47, 1.0),
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            height: 225,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.elliptical(10, 10)),
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
              color: !isLight ? Colors.white : Colors.black87,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            company,
            style: TextStyle(
              fontSize: 14,
              color: !isLight ? Colors.white : Colors.black87,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            description,
            style: TextStyle(
              fontSize: 14,
              color: !isLight ? Colors.white : Colors.black87,
              height: 1.7,
            ),
          ),
        ],
      ),
    );
  }
}

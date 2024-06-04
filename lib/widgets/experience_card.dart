import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:portfolio/constants/colors.dart' as constants;

class ExperienceCard extends StatelessWidget {
  const ExperienceCard({
    super.key,
    required this.isLight,
    required this.imageUrl,
    required this.title,
    required this.company,
    required this.description,
    required this.imageLoadingFuture,
  });

  final bool isLight;
  final String imageUrl;
  final String title;
  final String company;
  final String description;
  final Future<void> imageLoadingFuture;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.elliptical(35, 35),
        ),
        color: isLight ? constants.bgColor : constants.darkBeige,
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
              color: constants.veryLightBeige,
              borderRadius: const BorderRadius.all(
                Radius.elliptical(15, 15),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              children: [
                FutureBuilder<void>(
                  future: imageLoadingFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          height: 225,
                          decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.elliptical(20, 20)),
                            color: Colors.white,
                          ),
                        ),
                      );
                    } else {
                      return Container(
                        height: 225,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.elliptical(20, 20)),
                          image: DecorationImage(
                            image: NetworkImage(imageUrl),
                            fit: BoxFit.contain,
                          ),
                        ),
                      );
                    }
                  },
                ),
                const SizedBox(height: 15),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: constants.darkBeige,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  company,
                  style: const TextStyle(
                    fontSize: 14,
                    color: constants.darkBlue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
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

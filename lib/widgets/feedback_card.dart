import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dart_quote/widget_quote.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:portfolio/constants/colors.dart' as constants;
import 'package:portfolio/widgets/modals/feedback_modal.dart';

class FeedbackCard extends StatelessWidget {
  const FeedbackCard({
    super.key,
    required this.id,
    required this.feedback,
    required this.name,
    required this.feedbackId,
  });

  final String id;
  final String feedback;
  final String name;
  final String feedbackId;

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.elliptical(15, 15),
        ),
        color: constants.veryLightBeige,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WidgetQuote(
            text: feedback,
            padding: const EdgeInsets.all(5),
            textStyle: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ).quote(),
          Text(
            name,
            style: const TextStyle(
              color: constants.darkBlue,
              fontWeight: FontWeight.w400,
              fontSize: 18,
            ),
          ),
          if (user.uid == id) const SizedBox(height: 10),
          if (user.uid == id)
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.white,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      isScrollControlled: true,
                      builder: (context) {
                        return FeedbackModal(
                          feedback: feedback,
                          isEditing: true,
                          feedbackId: feedbackId,
                        );
                      },
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: constants.darkBlue,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Icon(
                      FeatherIcons.edit,
                      color: constants.bgColor,
                      size: 20,
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text(
                              'Are you sure you want to delete this feedback?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                FirebaseFirestore.instance
                                    .collection('feedback')
                                    .doc(feedbackId)
                                    .delete();
                                Navigator.pop(context);
                              },
                              child: const Text('Yes'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('No'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: constants.danger,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Icon(
                      FeatherIcons.xCircle,
                      color: constants.bgColor,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

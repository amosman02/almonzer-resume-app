import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/widgets/feedback_card.dart';

class FeedbackList extends StatelessWidget {
  const FeedbackList({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('feedback')
          .orderBy('created_at', descending: true)
          .snapshots(),
      builder: (ctx, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: Text('No Feedback yet!'));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          const Center(child: Text('Something went wrong'));
        }

        final feedbackData = snapshot.data!.docs;

        return ListView.builder(
          itemCount: feedbackData.length,
          itemBuilder: (ctx, index) {
            return FeedbackCard(
              id: feedbackData[index]['user_id'],
              feedback: feedbackData[index]['feedback'],
              name: feedbackData[index]['name'],
              feedbackId: feedbackData[index].id,
            );
          },
        );
      },
    );
  }
}

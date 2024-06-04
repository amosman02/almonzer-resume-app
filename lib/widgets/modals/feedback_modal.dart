import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart' as constants;
import 'package:portfolio/widgets/custom_text_area.dart';

// ignore: must_be_immutable
class FeedbackModal extends StatefulWidget {
  FeedbackModal({
    super.key,
    required this.feedback,
    required this.isEditing,
    required this.feedbackId,
  });

  var feedback = '';
  var isEditing = false;
  var feedbackId = '';

  @override
  State<FeedbackModal> createState() => _FeedbackModalState();
}

class _FeedbackModalState extends State<FeedbackModal> {
  final _formKey = GlobalKey<FormState>();
  var _enteredFeedback = '';
  var isLoading = false;

  void _submit() async {
    final isValid = _formKey.currentState!.validate();

    if (!isValid) {
      return;
    }

    _formKey.currentState!.save();

    try {
      isLoading = true;
      final user = FirebaseAuth.instance.currentUser!;
      final collection = FirebaseFirestore.instance.collection('feedback');

      if (!widget.isEditing) {
        await collection.add({
          'user_id': user.uid,
          'email': user.email,
          'name': user.displayName,
          'feedback': _enteredFeedback,
          'created_at': Timestamp.now(),
        });
        if (!mounted) return;
        Navigator.of(context).pop();
        isLoading = false;
      } else {
        collection.doc(widget.feedbackId).update({
          'feedback': _enteredFeedback,
        });
        if (!mounted) return;
        Navigator.of(context).pop();
        isLoading = false;
      }
    } on FirebaseAuthException catch (error) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error.message ?? 'Something went wrong!')));
      isLoading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    print(widget.feedbackId);
    return Wrap(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 55 / 100,
          padding:
              const EdgeInsets.only(left: 16, right: 16, bottom: 32, top: 16),
          decoration: const BoxDecoration(
              color: constants.bgColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            physics: const BouncingScrollPhysics(),
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: MediaQuery.of(context).size.width * 35 / 100,
                  margin: const EdgeInsets.only(bottom: 20),
                  height: 6,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              // header
              Container(
                margin: const EdgeInsets.only(bottom: 24),
                child: const Text(
                  'Your opinion matters!',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              // Form
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextArea(
                      title: 'Your feedback',
                      hint: 'Write your opinion here!',
                      margin: const EdgeInsets.only(top: 16),
                      minLines: 8,
                      maxLines: 12,
                      initValue: widget.feedback,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Feedback is required';
                        }
                        return null;
                      },
                      onSaved: (value) =>
                          setState(() => _enteredFeedback = value!),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 32, bottom: 6),
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: _submit,
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          backgroundColor: constants.darkBlue,
                        ),
                        child: isLoading
                            ? const CircularProgressIndicator(
                                color: constants.bgColor)
                            : const Text(
                                'Share your thoughts',
                                style: TextStyle(
                                  color: constants.bgColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

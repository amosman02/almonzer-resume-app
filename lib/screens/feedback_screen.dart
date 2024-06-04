import 'package:flutter/material.dart';
import 'package:portfolio/widgets/feedback_list.dart';
import 'package:portfolio/widgets/kf_drawer.dart';
import 'package:portfolio/constants/colors.dart' as constants;
import 'package:portfolio/widgets/modals/feedback_modal.dart';

// ignore: must_be_immutable
class FeedbackScreen extends KFDrawerContent {
  FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Row(
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
            ],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 60,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton(
                onPressed: () {
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
                        feedback: '',
                        isEditing: false,
                        feedbackId: '',
                      );
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: constants.darkBlue,
                ),
                child: const Text(
                  'I would love to hear your voice',
                  style: TextStyle(
                    color: constants.bgColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          const Expanded(
            child: FeedbackList(),
          ),
        ],
      ),
    );
  }
}

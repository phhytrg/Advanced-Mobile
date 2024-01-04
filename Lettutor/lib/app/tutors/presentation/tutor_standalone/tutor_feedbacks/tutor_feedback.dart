import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:lettutor/app/tutors/service/tutors_service.dart';
import 'package:lettutor/core/commom-widgets/async_value_widget.dart';

import '../../../domain/feedback/feedback.dart';
import 'feedback_controller.dart';

class TutorFeedback extends ConsumerStatefulWidget {
  const TutorFeedback({super.key, required this.feedbacks});

  final FeedbackList feedbacks;

  @override
  ConsumerState<TutorFeedback> createState() => _TutorFeedbackState();
}

class _TutorFeedbackState extends ConsumerState<TutorFeedback> {

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: widget.feedbacks.rows
          .map((e) => TutorFeedbackItem(feedback: e))
          .toList() ?? [],
    );
  }
}

class TutorFeedbackItem extends StatelessWidget {
  final FeedbackData feedback;

  const TutorFeedbackItem({super.key, required this.feedback});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundImage: NetworkImage(feedback.firstInfo.avatar),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  feedback.firstInfo.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  feedback.createdAt,
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            const Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                Icon(
                  Icons.star,
                  color: Colors.grey,
                ),
              ],
            ),
            Text(
              feedback.content,
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }
}

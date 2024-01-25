import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lettutor/core/constant.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../domain/feedback/feedback.dart';

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
      children: widget.feedbacks.rows.map((e) => TutorFeedbackItem(feedback: e)).toList() ?? [],
    );
  }
}

class TutorFeedbackItem extends StatelessWidget {
  final FeedbackData feedback;

  const TutorFeedbackItem({super.key, required this.feedback});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final txt = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
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
              width > mobileWidth
                  ? Row(
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
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          feedback.firstInfo.name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          feedback.createdAt,
                          style: const TextStyle(color: Colors.grey),
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
              feedback.content.isNotEmpty
                  ? Text(
                      feedback.content,
                      style: const TextStyle(color: Colors.grey),
                    )
                  : Text(
                     txt.noReviewYet,
                      style: const TextStyle(color: Colors.grey),
                    ),
            ],
          ),
        ],
      ),
    );
  }
}

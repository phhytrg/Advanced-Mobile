import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:lettutor/app/tutors/service/tutors_service.dart';
import 'package:lettutor/core/commom-widgets/async_value_widget.dart';

import '../../../domain/feedback/feedback.dart';
import 'feedback_controller.dart';

class TutorFeedback extends ConsumerStatefulWidget {
  const TutorFeedback({super.key, required this.tutorId});

  final String tutorId;

  @override
  ConsumerState<TutorFeedback> createState() => _TutorFeedbackState();
}

class _TutorFeedbackState extends ConsumerState<TutorFeedback> {
  final int _perPage = 12;
  final _pagingController = PagingController<int, FeedbackData>(
    firstPageKey: 1,
  );


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  Future<void> _fetchPage(int page) async{
    try{
      final newItems = await ref
          .read(tutorServiceProvider).getTutorFeedback(widget.tutorId, page, _perPage);
      final isLastPage = newItems!.rows.length < _perPage;
      if(isLastPage){
        _pagingController.appendLastPage(newItems.rows);
      }else{
        final nextPageKey = page + 1;
        _pagingController.appendPage(newItems.rows, nextPageKey);
      }
    }catch(error){
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });

    return PagedListView<int, FeedbackData>(
      pagingController: _pagingController,
      builderDelegate: PagedChildBuilderDelegate<FeedbackData>(
        itemBuilder: (context, item, index) => TutorFeedbackItem(feedback: item,),
      ),
      padding: const EdgeInsets.all(10),
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
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
                  style: TextStyle(fontWeight: FontWeight.bold),
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
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }
}

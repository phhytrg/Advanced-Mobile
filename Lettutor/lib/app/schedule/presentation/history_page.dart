import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:lettutor/app/schedule/domain/booking_list_reponse/booking_list_response.dart';
import 'package:lettutor/app/schedule/presentation/controller/booking_history_controller.dart';
import 'package:lettutor/core/commom-widgets/appbar.dart';
import 'package:lettutor/core/commom-widgets/async_value_widget.dart';
import 'package:lettutor/core/commom-widgets/drawer.dart';
import 'package:lettutor/core/commom-widgets/rating.dart';
import 'package:lettutor/core/constant.dart';
import 'package:lettutor/core/utils/date_untils.dart';

import '../../../../core/commom-widgets/button_widget.dart';
import '../../../../core/commom-widgets/page_header.dart';
import '../../../../core/commom-widgets/tutor_mini_item.dart';

class HistoryPage extends ConsumerStatefulWidget {
  const HistoryPage({super.key});

  @override
  ConsumerState<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends ConsumerState<HistoryPage> {
  late final _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      final hasReachedEnd = _scrollController.offset >= _scrollController.position.maxScrollExtent &&
          !_scrollController.position.outOfRange;
      if (hasReachedEnd) {
        loadMore();
      }
    });
  }

  void loadMore() {
    ref.read(bookingHistoryControllerProvider.notifier).loadMore();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        child: Column(
          children: [
            const PageHeader(
              svgIconPath: 'icons/history.svg',
              pageDescription: sampleText,
              pageName: 'History',
            ),
            const SizedBox(
              height: 32,
            ),
            Consumer(builder: (context, ref, child) {
              final bookingHistoryController = ref.watch(bookingHistoryControllerProvider);
              return AsyncValueWidget(
                value: bookingHistoryController,
                data: (historyBookingList) {
                  // Group booking have close start time
                  if (historyBookingList != null) {
                    for (int i = 0; i < historyBookingList.rows!.length - 1; i++) {
                      final booking = historyBookingList.rows![i];
                      for (int j = i + 1; j < historyBookingList.rows!.length; j++) {
                        if(j >= historyBookingList.rows!.length){
                          break;
                        }
                        final nextBooking = historyBookingList.rows![j];
                        if (booking.scheduleDetailInfo!.scheduleInfo!.tutorId ==
                            nextBooking.scheduleDetailInfo!.scheduleInfo!.tutorId) {
                          if (booking.scheduleDetailInfo!.startPeriodTimestamp!.toInt() ==
                              nextBooking.scheduleDetailInfo!.endPeriodTimestamp!.toInt() + 5 * 60 * 1000) {
                            booking.scheduleDetailInfo!.startPeriodTimestamp =
                                nextBooking.scheduleDetailInfo!.startPeriodTimestamp;
                            booking.studentRequest = '${'${booking.studentRequest}\n' ?? ''}${nextBooking.studentRequest ?? ''}';
                            historyBookingList.rows!.removeAt(j);
                            historyBookingList.count--;
                            j--;
                          }
                        }
                        else{
                          break;
                        }
                      }
                    }
                  }

                  return historyBookingList == null
                      ? const Text("No data")
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: historyBookingList.rows?.length,
                          itemBuilder: (context, index) {
                            return HistoryItem(
                              booking: historyBookingList.rows![index],
                            );
                          },
                        );
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}

class HistoryItem extends StatelessWidget {
  const HistoryItem({super.key, required this.booking});

  final BookingData booking;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.grey.shade200,
      ),
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
      child: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth <= mobileWidth * 2) {
          return Column(
            children: [
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(16.0),
                width: double.infinity,
                child: _buildItemHeader(context),
              ),
              _buildItemBody(context),
            ],
          );
        } else {
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: _buildItemHeader(context),
                ),
              ),
              Expanded(
                flex: 2,
                child: _buildItemBody(context),
              ),
            ],
          );
        }
      }),
    );
  }

  Widget _buildItemHeader(BuildContext context) {
    String timeAgo =
        MyDateUtils.getTimeAgo(DateTime.fromMillisecondsSinceEpoch(booking.scheduleDetailInfo!.startPeriodTimestamp!));

    return Wrap(
      alignment: WrapAlignment.spaceAround,
      spacing: 32,
      runSpacing: 8,
      children: [
        Column(
          children: [
            Text(
              MyDateUtils.getShortWeekDayMonthYear(
                  DateTime.fromMillisecondsSinceEpoch(booking.scheduleDetailInfo!.startPeriodTimestamp!)),
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
            ),
            Text(timeAgo),
          ],
        ),
        TutorMiniItem(
          tutorName: booking.scheduleDetailInfo!.scheduleInfo!.tutorInfo!.name!,
          tutorCountry: booking.scheduleDetailInfo!.scheduleInfo!.tutorInfo!.country!,
          tutorAvatar: booking.scheduleDetailInfo!.scheduleInfo!.tutorInfo!.avatar!,
        ),
      ],
    );
  }

  Widget _buildItemBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          color: Colors.white,
          child: Row(
            children: [
              Text('Lesson Time: '
                  '${MyDateUtils.getHourMinute(DateTime.fromMillisecondsSinceEpoch(booking.scheduleDetailInfo!.startPeriodTimestamp!))} '
                  '- '
                  '${MyDateUtils.getHourMinute(DateTime.fromMillisecondsSinceEpoch(booking.scheduleDetailInfo!.endPeriodTimestamp!))}'),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          width: double.infinity,
          margin: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 1),
          color: Colors.white,
          child: booking.studentRequest == null || booking.studentRequest == ''
              ? const Text('No request for lesson')
              : Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [const Text('Request for lesson'), Text(booking.studentRequest!)],
                ),
        ),
        booking.scoreByTutor == null
            ? Container()
            : Container(
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.symmetric(vertical: 1, horizontal: 16),
                color: Colors.white,
                child: Row(
                  children: [
                    const Text('Mark: '),
                    Text(booking.scoreByTutor.toString()),
                  ],
                ),
              ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.symmetric(vertical: 1, horizontal: 16),
          color: Colors.white,
          child: booking.classReview == null
              ? const Text('Tutor haven\'t reviewed yet')
              : _buildReviewItem(context, booking.classReview!),
        ),
        Container(
            padding: EdgeInsets.all(8.0),
            margin: EdgeInsets.only(top: 1, bottom: 16, right: 16, left: 16),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyTextButton(child: Text('Add a rating')),
                MyTextButton(child: Text('Report')),
              ],
            )),
      ],
    );
  }

  _buildReviewItem(BuildContext context, ClassReview classReview) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          classReview.lessonStatus?.status == null
              ? Container()
              : Text('Lesson status: ${classReview.lessonStatus!.status}'),
          classReview.book == null ? Container() : Text('Book: ${classReview.book}'),
          Row(
            children: [
              const Text('Listening '),
              RatingWidget(
                rating: classReview.listeningRating ?? 0,
              ),
              Text(classReview.listeningComment ?? ''),
            ],
          ),
          Row(
            children: [
              const Text('Speaking '),
              RatingWidget(
                rating: classReview.speakingRating ?? 0,
              ),
              Text(classReview.speakingComment ?? ''),
            ],
          ),
          Row(
            children: [
              const Text('Vocabulary '),
              RatingWidget(
                rating: classReview.vocabularyRating ?? 0,
              ),
              Text(classReview.vocabularyComment ?? ''),
            ],
          ),
          Row(
            children: [
              const Text('Behavior '),
              RatingWidget(
                rating: classReview.behaviorRating ?? 0,
              ),
              Text(classReview.behaviorComment ?? ''),
            ],
          ),
          classReview.overallComment == null ? Container() : Text('Overall comment: ${classReview.overallComment}'),
        ],
      ),
    );
  }
}

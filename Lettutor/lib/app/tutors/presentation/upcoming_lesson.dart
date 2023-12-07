
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lettutor/app/tutors/presentation/total_hours_controller.dart';
import 'package:lettutor/app/tutors/presentation/upcoming_lesson_controller.dart';
import 'package:lettutor/core/commom-widgets/async_value_widget.dart';
import 'package:lettutor/core/utils/date_untils.dart';

class UpcomingLesson extends ConsumerStatefulWidget {
  const UpcomingLesson({super.key});

  @override
  ConsumerState<UpcomingLesson> createState() => _UpcomingLessonState();
}

class _UpcomingLessonState extends ConsumerState<UpcomingLesson> {
  var timeLeft = 0;

  @override
  Widget build(BuildContext context) {
    final upcomingLessonController = ref.watch(upcomingLessonControllerProvider);
    final totalHoursController = ref.watch(totalHoursControllerProvider);

    return Container(
      padding: EdgeInsets.fromLTRB(8, 32, 8, 32),
      margin: EdgeInsets.only(left: 8, right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blue.shade900,
      ),
      child: Column(
        children: [
          Text(
            "Upcoming Lesson",
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Expanded(
                child: AsyncValueWidget(
                  value: upcomingLessonController,
                  data: (upcomingLesson) { return Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      Builder(
                        builder: (BuildContext context) {
                          return Text(
                            textAlign: TextAlign.center,
                              MyDateUtils.getWeekDayMonthYear(
                                  DateTime.fromMillisecondsSinceEpoch(
                                      upcomingLesson![0]
                                          .scheduleDetailInfo!
                                          .startPeriodTimestamp!)),
                              style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          );
                        },
                      ),
                      Builder(
                        builder: (context) {
                          timeLeft = upcomingLesson![0].scheduleDetailInfo!.startPeriodTimestamp! - DateTime.now().millisecondsSinceEpoch;
                          Timer.periodic(Duration(seconds: 1), (timer) {setState(() {
                            timeLeft -= 1000;
                          }); });
                          int minutes = timeLeft ~/ 60000 % 60;
                          int seconds = (timeLeft % 60000) ~/ 1000;
                          int hours = timeLeft ~/ 3600000;
                          return Text(
                            textAlign: TextAlign.center,
                            '(starts in ${hours < 10 ? 0 : ''}$hours:${minutes < 10 ? 0 : ''}$minutes:${seconds < 10 ? 0 : ''}$seconds)',
                            style: TextStyle(
                              color: Colors.yellow[300],
                            ),
                          );
                        },
                      ),
                    ],
                  ); },
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: (){},
                  child: Text(
                    'Enter lesson room',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          AsyncValueWidget(
            value: totalHoursController,
            data: (totalHours) {
              int hours = totalHours ~/ 60;
              int minutes = totalHours % 60;
              return Text(
                'Total lesson time is $hours hours $minutes minutes',
                style: const TextStyle(
                  color: Colors.white,
                ),
              );
            }),
        ],
      ),
    );
  }
}

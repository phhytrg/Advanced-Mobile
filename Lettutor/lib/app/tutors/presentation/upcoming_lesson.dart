import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lettutor/app/tutors/presentation/total_hours_controller.dart';
import 'package:lettutor/app/tutors/presentation/upcoming_lesson_controller.dart';
import 'package:lettutor/core/common-widgets/async_value_widget.dart';
import 'package:lettutor/core/utils/date_untils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    final txt = AppLocalizations.of(context)!;

    return Container(
      padding: const EdgeInsets.fromLTRB(8, 32, 8, 32),
      margin: const EdgeInsets.only(left: 8, right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blue.shade900,
      ),
      child: Column(
        children: [
          Text(
            txt.upcomingLesson,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          AsyncValueWidget(
            value: ref.watch(upcomingLessonControllerProvider),
            data: (upcomingLesson) {
              return upcomingLesson != null && upcomingLesson.isNotEmpty
                  ? Row(
                      children: [
                        Expanded(
                          child: Wrap(
                            alignment: WrapAlignment.center,
                            children: [
                              Builder(
                                builder: (BuildContext context) {
                                  return Text(
                                    textAlign: TextAlign.center,
                                    MyDateUtils.getWeekDayMonthYear(DateTime.fromMillisecondsSinceEpoch(
                                        upcomingLesson[0].scheduleDetailInfo!.startPeriodTimestamp!)),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  );
                                },
                              ),
                              Builder(
                                builder: (context) {
                                  timeLeft = upcomingLesson[0].scheduleDetailInfo!.startPeriodTimestamp! -
                                      DateTime.now().millisecondsSinceEpoch;
                                  Timer.periodic(const Duration(seconds: 1), (timer) {
                                    if (mounted) {
                                      setState(() {
                                        timeLeft -= 1000;
                                      });
                                    }
                                  });
                                  int minutes = timeLeft ~/ 60000 % 60;
                                  int seconds = (timeLeft % 60000) ~/ 1000;
                                  int hours = timeLeft ~/ 3600000;
                                  return Text(
                                    textAlign: TextAlign.center,
                                    '(${txt.startsIn} ${hours < 10 ? 0 : ''}$hours:${minutes < 10 ? 0 : ''}$minutes:${seconds < 10 ? 0 : ''}$seconds)',
                                    style: TextStyle(
                                      color: Colors.yellow[300],
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              txt.enterLessonRoom,
                            ),
                          ),
                        ),
                      ],
                    )
                  : SizedBox(
                      width: double.infinity,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          '${txt.no} ${txt.upcomingLesson}',
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
            },
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
                  '${txt.totalLessonTime} $hours ${txt.hours} $minutes ${txt.minutes}',
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

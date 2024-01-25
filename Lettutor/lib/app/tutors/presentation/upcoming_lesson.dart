import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:jitsi_meet_wrapper/jitsi_meet_wrapper.dart';
import 'package:lettutor/app/auth/data/user_repository.dart';
import 'package:lettutor/app/auth/domain/user.dart';
import 'package:lettutor/app/tutors/presentation/total_hours_controller.dart';
import 'package:lettutor/app/tutors/presentation/upcoming_lesson_controller.dart';
import 'package:lettutor/app/video_conference/application/jitsi.dart';
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
              if (upcomingLesson == null) {
                return SizedBox(
                    width: double.infinity,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        '${txt.no} ${txt.upcomingLesson}',
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ));
              }

              // find minimum start time
              upcomingLesson.sort((a, b) =>
                  a.scheduleDetailInfo!.startPeriodTimestamp!.compareTo(b.scheduleDetailInfo!.startPeriodTimestamp!));
              final latestLesson = upcomingLesson
                  .where((element) =>
                      element.scheduleDetailInfo!.startPeriodTimestamp! > DateTime.now().millisecondsSinceEpoch)
                  .first;
              return Row(
                children: [
                  Expanded(
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        Builder(
                          builder: (BuildContext context) {
                            return Text(
                              textAlign: TextAlign.center,
                              '${MyDateUtils.getWeekDayMonthYear(DateTime.fromMillisecondsSinceEpoch(latestLesson.scheduleDetailInfo!.startPeriodTimestamp!))} ',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            );
                          },
                        ),
                        Text(
                          MyDateUtils.getHourMinute(DateTime.fromMillisecondsSinceEpoch(
                              latestLesson.scheduleDetailInfo!.startPeriodTimestamp!)),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        const Text(' - ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            )),
                        Text(
                          MyDateUtils.getHourMinute(DateTime.fromMillisecondsSinceEpoch(
                              latestLesson.scheduleDetailInfo!.endPeriodTimestamp!)),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        Builder(
                          builder: (context) {
                            timeLeft = latestLesson.scheduleDetailInfo!.startPeriodTimestamp! -
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
                      onPressed: () async {
                        if (DateTime.now().millisecondsSinceEpoch <
                            DateTime.fromMillisecondsSinceEpoch(
                                latestLesson.scheduleDetailInfo!.startPeriodTimestamp!)
                                .millisecondsSinceEpoch) {
                          GoRouter.of(context).go('/meeting/${latestLesson.id}/waiting', extra: latestLesson);
                          return;
                        }
                        final User user = await ref.read(userRepositoryProvider).getUserInfo();
                        var options = Jitsi.getOptions(
                            meetingUrl: Jitsi.getToken(latestLesson.studentMeetingLink!),
                            subject:
                                '${latestLesson.scheduleDetailInfo!.scheduleInfo!.tutorInfo!.name!} - ${MyDateUtils.getHourMinute(DateTime.fromMillisecondsSinceEpoch(latestLesson.scheduleDetailInfo!.startPeriodTimestamp!))}',
                            userDisplayName: user.name ?? '',
                            userEmail: user.email ?? '',
                            userAvatarUrl: user.avatar ?? '');
                        JitsiMeetWrapper.joinMeeting(
                          options: options,
                          listener: JitsiMeetingListener(
                            onConferenceWillJoin: (url) => print("onConferenceWillJoin: url: $url"),
                            onConferenceJoined: (url) => print("onConferenceJoined: url: $url"),
                            onConferenceTerminated: (url, error) =>
                                print("onConferenceTerminated: url: $url, error: $error"),
                          ),
                        );
                      },
                      child: Text(
                        txt.enterLessonRoom,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
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

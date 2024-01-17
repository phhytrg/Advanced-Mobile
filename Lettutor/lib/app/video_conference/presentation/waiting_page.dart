import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:jitsi_meet_wrapper/jitsi_meet_wrapper.dart';
import 'package:lettutor/app/auth/data/user_repository.dart';
import 'package:lettutor/app/auth/domain/user.dart';
import 'package:lettutor/app/schedule/domain/booking_list_reponse/booking_list_response.dart';
import 'package:lettutor/app/tutors/domain/tutor_schedule/tutor_schedule_response.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor/app/video_conference/application/jitsi.dart';
import 'package:lettutor/core/utils/date_untils.dart';

class WaitingPage extends ConsumerStatefulWidget {
  final BookingData? lesson;

  const WaitingPage({super.key, required this.lesson});

  @override
  ConsumerState<WaitingPage> createState() => _WaitingPageState();
}

class _WaitingPageState extends ConsumerState<WaitingPage> {
  @override
  Widget build(BuildContext context) {
    final txt = AppLocalizations.of(context)!;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircularProgressIndicator(),
        const SizedBox(
          height: 16,
        ),
        const Text("Waiting for your meeting to start..."),
        // Count down timer
        Builder(builder: (context) {
          var timeLeft =
              widget.lesson!.scheduleDetailInfo!.startPeriodTimestamp! - DateTime.now().millisecondsSinceEpoch;
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
          return minutes < 10 && hours == 0
              ? FilledButton(
                  onPressed: () async {
                    final User user = await ref.read(userRepositoryProvider).getUserInfo();
                    var options = Jitsi.getOptions(
                        meetingUrl: Jitsi.getToken(widget.lesson!.studentMeetingLink!),
                        subject:
                            '${widget.lesson!.scheduleDetailInfo!.scheduleInfo!.tutorInfo!.name!} - ${MyDateUtils.getHourMinute(DateTime.fromMillisecondsSinceEpoch(widget.lesson!.scheduleDetailInfo!.startPeriodTimestamp!))}',
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
                  child: const Text('Join your meeting now'))
              : Text(
                  textAlign: TextAlign.center,
                  '(${txt.startsIn} ${hours < 10 ? 0 : ''}$hours:${minutes < 10 ? 0 : ''}$minutes:${seconds < 10 ? 0 : ''}$seconds)',
                  style: TextStyle(
                    color: Colors.blue.shade800,
                  ),
                );
        })
      ],
    );
  }
}

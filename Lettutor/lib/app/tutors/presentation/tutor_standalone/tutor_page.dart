import 'dart:async';

import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lettutor/app/auth/data/user_repository.dart';
import 'package:lettutor/app/tutors/data/tutor_repository.dart';
import 'package:lettutor/app/tutors/domain/response/tutor.dart';
import 'package:lettutor/app/tutors/domain/tutor_utils.dart';
import 'package:lettutor/app/tutors/presentation/tutor_standalone/tutor_feedbacks/feedback_controller.dart';
import 'package:lettutor/app/tutors/presentation/tutor_standalone/tutor_feedbacks/tutor_feedback.dart';
import 'package:lettutor/app/tutors/presentation/tutor_standalone/tutor_intro_video.dart';
import 'package:lettutor/app/tutors/presentation/tutor_standalone/tutor_viewmodel.dart';
import 'package:lettutor/core/common-widgets/async_value_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/common-widgets/text_widget.dart';
import '../../../../core/constant.dart';
import 'tutor_schedule/tutor_schedule.dart';

class TutorPage extends ConsumerStatefulWidget {
  const TutorPage({super.key, required this.tutorId});

  final String tutorId;

  @override
  ConsumerState<TutorPage> createState() => _TutorPageState();
}

class _TutorPageState extends ConsumerState<TutorPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      final hasReachedEnd = _scrollController.offset >= _scrollController.position.maxScrollExtent &&
          !_scrollController.position.outOfRange;
      if (hasReachedEnd) {
        loadMoreFeedbacks();
      }
    });
  }

  void loadMoreFeedbacks() {
    ref.read(feedbacksControllerProvider(widget.tutorId).notifier).getMoreTutorFeedbacks(widget.tutorId);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var tutor = ref.watch(tutorViewmodelProvider(widget.tutorId));
    return AsyncValueWidget(
      value: tutor,
      data: (tutor) {
        return SingleChildScrollView(
          controller: _scrollController,
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraint) {
              if (constraint.maxWidth <= mobileWidth * 2) {
                //This is for mobile
                return Container(
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  child: Column(
                    children: [
                      _TutorInfoMobileBody(
                        _buildTutorBriefIntro(context, tutor!),
                        tutor.video != null
                            ? TutorIntroVideo(
                                tutorVideo: tutor.video!,
                              )
                            : Container(),
                      ),
                      _TutorDetailMobileBody(
                        tutorDetailInfo: _buildTutorDetail(context),
                        schedule: BookingSchedule(
                          tutorId: widget.tutorId,
                        ),
                      ),
                      Builder(builder: (context) {
                        final feedbacks = ref.watch(feedbacksControllerProvider(widget.tutorId));
                        return AsyncValueWidget(
                          value: feedbacks,
                          data: (feedbacks) {
                            return feedbacks != null
                                ? _PartInfo(
                                    partTitle: 'Others review',
                                    partDescription: TutorFeedback(
                                      feedbacks: feedbacks,
                                    ))
                                : Container();
                          },
                        );
                      })
                    ],
                  ),
                );
              } else {
                //This this for desktop
                return Container(
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16 * 10),
                  child: Column(
                    children: [
                      _TutorInfoDesktopBody(
                        _buildTutorBriefIntro(context, tutor!),
                        tutor.video != null
                            ? TutorIntroVideo(
                                tutorVideo: tutor.video!,
                              )
                            : Container(),
                      ),
                      _TutorDetailDesktopBody(
                          tutorDetailInfo: _buildTutorDetail(context),
                          schedule: BookingSchedule(
                            tutorId: widget.tutorId,
                          )),
                      Consumer(
                        builder: (BuildContext context, WidgetRef ref, Widget? child) {
                          final feedbacks = ref.watch(feedbacksControllerProvider(widget.tutorId));
                          return AsyncValueWidget(
                            value: feedbacks,
                            data: (feedbacks) {
                              return feedbacks != null
                                  ? ListView.builder(
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(),
                                      itemCount: feedbacks.rows.length,
                                      itemBuilder: (context, index) {
                                        return TutorFeedbackItem(feedback: feedbacks.rows[index]);
                                      })
                                  : Container();
                            },
                          );
                        },
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        );
      },
    );
  }

  Widget _buildTutorBriefIntro(BuildContext context, Tutor tutor) {
    final txt = AppLocalizations.of(context)!;
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              minRadius: 64,
              backgroundImage: tutor.user?.avatar != null ? NetworkImage(tutor.user!.avatar!) : null,
              child: tutor.user?.avatar == null ? const Icon(Icons.portrait) : null,
            ),
            const SizedBox(
              width: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tutor.user!.name!,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                tutor.rating == null
                    ? Text(txt.noReviewYet)
                    : Row(
                        children: [
                          Icon(Icons.star, color: tutor.rating! >= 0.5 ? Colors.yellow : Colors.grey),
                          Icon(Icons.star, color: tutor.rating! >= 1.5 ? Colors.yellow : Colors.grey),
                          Icon(Icons.star, color: tutor.rating! >= 2.5 ? Colors.yellow : Colors.grey),
                          Icon(Icons.star, color: tutor.rating! >= 3.5 ? Colors.yellow : Colors.grey),
                          Icon(Icons.star, color: tutor.rating! >= 4.5 ? Colors.yellow : Colors.grey),
                          Text('(${tutor.totalFeedback})')
                        ],
                      ),
                Wrap(
                  children: [
                    Flag.fromString(
                      tutor.user!.country!,
                      width: 20 * 4 / 3,
                      height: 20,
                      fit: BoxFit.scaleDown,
                      borderRadius: 8,
                    ),
                    Text(Countries.alpha2ToCountryName(tutor.user!.country!)),
                  ],
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          tutor.bio ?? 'No data',
          textAlign: TextAlign.justify,
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Consumer(
                  builder: (BuildContext context, WidgetRef ref, Widget? child) {
                    return InkWell(
                      child: Icon(
                        tutor.isFavorite == null
                            ? Icons.favorite_border
                            : tutor.isFavorite!
                                ? Icons.favorite
                                : Icons.favorite_border,
                        color: Colors.red,
                      ),
                      onTap: () {
                        ref.read(userRepositoryProvider).updateTutorInFavoriteList(tutor.user!.id!);
                        setState(() {
                          tutor.isFavorite ??= false;
                          tutor.isFavorite = !tutor.isFavorite!;
                        });
                      },
                    );
                  },
                ),
                Text(
                  txt.favorite,
                  style: const TextStyle(color: Colors.red),
                ),
              ],
            ),
            InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      final List<String> reportContents = [];
                      final List<int> reportValues = [];
                      final TextEditingController controller = TextEditingController();
                      return StatefulBuilder(builder: (context, setState) {
                        return AlertDialog(
                          title: Text(txt.report),
                          surfaceTintColor: Colors.white,
                          content: SizedBox(
                            width: 500,
                            child: Column(
                              children: [
                                const Row(
                                  children: [
                                    Icon(Icons.report, color: Colors.blue),
                                    Text('Help us understand what\'s happening',
                                        style: TextStyle(fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                CheckboxListTile(
                                  value: reportValues.contains(0),
                                  onChanged: (value) {
                                    setState(() {
                                      if (value!) {
                                        reportValues.add(0);
                                        reportContents.add('This tutor is annoying me\n');
                                      } else {
                                        reportValues.remove(0);
                                        reportContents.remove('This tutor is annoying me\n');
                                      }
                                      controller.text = reportContents.join();
                                    });
                                  },
                                  title: const Text('This tutor is annoying me\n'),
                                ),
                                CheckboxListTile(
                                  value: reportValues.contains(1),
                                  onChanged: (value) {
                                    setState(() {
                                      if (value!) {
                                        reportValues.add(1);
                                        reportContents.add('This profile is pretending be someone or is fake\n');
                                      } else {
                                        reportValues.remove(1);
                                        reportContents.remove('This profile is pretending be someone or is fake\n');
                                      }
                                      controller.text = reportContents.join();
                                    });
                                  },
                                  title: const Text('This profile is pretending be someone or is fake\n'),
                                ),
                                CheckboxListTile(
                                  value: reportValues.contains(2),
                                  onChanged: (value) {
                                    setState(() {
                                      if (value!) {
                                        reportValues.add(2);
                                        reportContents.add('Inappropriate profile photo\n');
                                      } else {
                                        reportValues.remove(2);
                                        reportContents.remove('Inappropriate profile photo\n');
                                      }
                                      controller.text = reportContents.join();
                                    });
                                  },
                                  title: const Text('Inappropriate profile photo\n'),
                                ),
                                TextField(
                                  maxLines: 5,
                                  decoration: const InputDecoration(
                                    hintText: 'Reason',
                                    border: OutlineInputBorder(),
                                  ),
                                  controller: controller,
                                )
                              ],
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () async {
                                bool result =
                                    await ref.read(reportTutorProvider(widget.tutorId, controller.text).future);
                                if (mounted) {
                                  if (result) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(content: Text('Report success')));
                                  } else {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(content: Text('Report failed')));
                                  }
                                  Navigator.of(context).pop();
                                }
                              },
                              child: Text(txt.report),
                            ),
                          ],
                        );
                      });
                    });
              },
              child: Column(
                children: [
                  const Icon(
                    Icons.report,
                    color: Colors.blue,
                  ),
                  Text(txt.report),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _buildTutorDetail(BuildContext context) {
    final txt = AppLocalizations.of(context)!;
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        var tutor = ref.watch(tutorViewmodelProvider(widget.tutorId));
        return AsyncValueWidget(
          value: tutor,
          data: (tutor) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _PartInfo(
                  partDescription: Text(tutor?.education ?? 'No data'),
                  partTitle: txt.education,
                ),
                _PartInfo(
                  partDescription: Wrap(
                    runSpacing: 8,
                    spacing: 8,
                    children: [
                      OutlinedText(text: tutor?.languages ?? 'No data'),
                    ],
                  ),
                  partTitle: txt.languages,
                ),
                _PartInfo(
                  partDescription: Wrap(
                    runSpacing: 8,
                    spacing: 8,
                    children: [
                      for (var value in TutorUtils.extractSpecialties(tutor?.specialties ?? ''))
                        OutlinedText(text: value),
                    ],
                  ),
                  partTitle: txt.specialties,
                ),
                _PartInfo(
                  partTitle: txt.suggestedCourses,
                  partDescription: tutor?.user?.courses != null
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (var course in tutor!.user!.courses!)
                              Container(
                                padding: const EdgeInsets.symmetric(vertical: 8),
                                child: FilledButton(
                                  onPressed: () {},
                                  child: Text(course.name!),
                                ),
                              ),
                          ],
                        )
                      : Container(),
                ),
                _PartInfo(
                  partTitle: txt.interests,
                  partDescription: tutor?.interests != null ? Text(tutor!.interests!) : Text('No data'),
                ),
                _PartInfo(
                  partTitle: txt.teachingExperiences,
                  partDescription: tutor?.experience != null ? Text(tutor!.experience!) : const Text('No data'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

class _TutorInfoMobileBody extends StatelessWidget {
  final Widget tutorBriefIntro;

  final Widget tutorIntroVideo;

  const _TutorInfoMobileBody(this.tutorBriefIntro, this.tutorIntroVideo);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        tutorBriefIntro,
        const SizedBox(
          height: 16,
        ),
        tutorIntroVideo,
      ],
    );
  }
}

class _TutorInfoDesktopBody extends StatelessWidget {
  final Widget tutorBriefIntro;

  final Widget tutorIntroVideo;

  const _TutorInfoDesktopBody(this.tutorBriefIntro, this.tutorIntroVideo);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        tutorBriefIntro,
        const SizedBox(
          height: 16,
        ),
        tutorIntroVideo,
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}

class _TutorDetailMobileBody extends StatelessWidget {
  final Widget tutorDetailInfo;
  final Widget schedule;

  const _TutorDetailMobileBody({super.key, required this.tutorDetailInfo, required this.schedule});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        tutorDetailInfo,
        schedule,
      ],
    );
  }
}

class _TutorDetailDesktopBody extends StatelessWidget {
  final Widget tutorDetailInfo;
  final Widget schedule;

  const _TutorDetailDesktopBody({super.key, required this.tutorDetailInfo, required this.schedule});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: tutorDetailInfo,
        ),
        Expanded(
          flex: 3,
          child: schedule,
        ),
      ],
    );
  }
}

class _PartInfo extends StatelessWidget {
  final String partTitle;
  final Widget partDescription;

  const _PartInfo({super.key, required this.partTitle, required this.partDescription});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          partTitle,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        partDescription,
        const SizedBox(
          height: 16,
        )
      ],
    );
  }
}

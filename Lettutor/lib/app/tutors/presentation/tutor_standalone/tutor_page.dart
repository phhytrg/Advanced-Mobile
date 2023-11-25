
import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lettutor/app/tutors/domain/tutor_utils.dart';
import 'package:lettutor/app/tutors/presentation/tutor_standalone/tutor_viewmodel.dart';
import 'package:lettutor/core/commom-widgets/async_value_widget.dart';

import '../../../../core/commom-widgets/appbar.dart';
import '../../../../core/commom-widgets/drawer.dart';
import '../../../../core/commom-widgets/text_widget.dart';
import '../../../../core/constant.dart';
import 'tutor_schedule/tutor_schedule.dart';

class TutorPage extends StatelessWidget {
  TutorPage({super.key, required this.tutorId});

  final String tutorId;

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    
    return Scaffold(
      key: _scaffoldKey,
      appBar: LettutorAppbar(
        onMenuIconPressed: (){
          _scaffoldKey.currentState?.openEndDrawer();
        },
      ),
      endDrawer: width - 40 <= titleWidth ? LettutorDrawer() : null,
      body: SingleChildScrollView(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraint){
            if(constraint.maxWidth <= mobileWidth * 2){
              //This is for mobile
              return Container(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                child: Column(
                  children: [
                    _TutorInfoMobileBody(_buildTutorBriefIntro(context), Container(
                      color: Colors.black12,
                      width: double.infinity,
                      height: 300,
                    )),
                    _TutorDetailMobileBody(
                      tutorDetailInfo: _buildTutorDetail(context),
                      schedule: BookingSchedule(tutorId: tutorId,),
                    )
                  ],
                ),
              );
            }
            else{
              //This this for desktop
              return Container(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16 * 10),
                child: Column(
                  children: [
                    _TutorInfoDesktopBody(_buildTutorBriefIntro(context), Container(
                      color: Colors.black12,
                      width: double.infinity,
                      height: 300,
                    )),
                    _TutorDetailDesktopBody(tutorDetailInfo: _buildTutorDetail(context), schedule:  BookingSchedule(tutorId: tutorId,))
                  ],
                ),
              );
            }
          },
        ),
      )
    );
  }

  Widget _buildTutorBriefIntro(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        var tutor = ref.watch(tutorViewmodelProvider(tutorId));
        return AsyncValueWidget(
          value: tutor,
          data: (tutor) {
            return Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      minRadius: 64,
                      backgroundImage: tutor?.user?.avatar != null ? NetworkImage(tutor!.user!.avatar!) : null,
                      child: tutor?.user?.avatar == null ? const Icon(Icons.portrait) : null,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(tutor!.user!.name!, style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),),
                        Row(
                          children: [
                            Icon(Icons.star),
                            Icon(Icons.star),
                            Icon(Icons.star),
                            Icon(Icons.star),
                            Icon(Icons.star),
                            Text('(127)')
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
                  sampleText,
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
                        Icon(Icons.favorite),
                        Text('Favorite'),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.report),
                        Text('Report'),
                      ],
                    ),
                  ],
                )
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildTutorDetail(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        var tutor = ref.watch(tutorViewmodelProvider(tutorId));
        return AsyncValueWidget(
          value: tutor,
          data: (tutor) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _PartInfo(
                  partDescription: Text(tutor?.education ?? 'No data'),
                  partTitle: 'Education',
                ),
                _PartInfo(
                  partDescription: Wrap(
                    runSpacing: 8,
                    spacing: 8,
                    children: [
                      OutlinedText(text: tutor?.languages ?? 'No data'),
                    ],
                  ),
                  partTitle: 'Languages',
                ),
                _PartInfo(
                  partDescription: Wrap(
                    runSpacing: 8,
                    spacing: 8,
                    children: [
                      for(var value in TutorUtils.extractSpecialties(tutor?.specialties ?? '')) OutlinedText(text: value),
                    ],
                  ),
                  partTitle: 'Specialties',
                ),
                _PartInfo(
                  partTitle: 'Suggested Courses',
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
                  partTitle: 'Interests',
                  partDescription: tutor?.interests != null
                    ? Text(tutor!.interests!)
                    : Text('No data'),
                ),
                _PartInfo(
                  partTitle: 'Teaching experiences',
                  partDescription: tutor?.experience != null
                      ? Text(tutor!.experience!)
                      : const Text('No data'),
                ),
                _PartInfo(
                  partTitle: 'Others review',
                  partDescription: Text('This field for review'),
                )
              ],
            );
          },
        );
      },
    );
  }
}



class _TutorInfoMobileBody extends StatelessWidget{

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

class _TutorInfoDesktopBody extends StatelessWidget{

  final Widget tutorBriefIntro;

  final Widget tutorIntroVideo;

  const _TutorInfoDesktopBody(this.tutorBriefIntro, this.tutorIntroVideo);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        tutorBriefIntro,
        const SizedBox(height: 16,),
        tutorIntroVideo,
        const SizedBox(height: 16,),
      ],
    );
  }
}


class _TutorDetailMobileBody extends StatelessWidget {
  final Widget tutorDetailInfo;
  final Widget schedule;

  const _TutorDetailMobileBody({super.key,required this.tutorDetailInfo,required this.schedule});

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
        Expanded(flex: 1,child: tutorDetailInfo,),
        Expanded(flex: 3,child: schedule,),
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
        Text(partTitle, style: Theme.of(context).textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.bold,
        ),),
        partDescription,
        const SizedBox(height: 16,)
      ],
    );
  }
}



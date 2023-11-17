import 'package:flag/flag.dart';
import 'package:flutter/material.dart';

import '../../../core/commom-widgets/text_widget.dart';
import '../appbar.dart';
import '../constant.dart';
import '../drawer/drawer.dart';

class TutorPage extends StatelessWidget {
  TutorPage({super.key});

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
            if(constraint.maxWidth <= mobileWidth){
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
                      schedule: Container(),
                    )
                  ],
                ),
              );
            }
            else{
              //This this for desktop
              return Container(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                child: Column(
                  children: [
                    _TutorInfoDesktopBody(_buildTutorBriefIntro(context), Container(
                      color: Colors.black12,
                      width: double.infinity,
                      height: 300,
                    )),
                    _TutorDetailDesktopBody(tutorDetailInfo: _buildTutorDetail(context), schedule: Container())
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
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              child: Icon(Icons.portrait),
              minRadius: 48,
            ),
            const SizedBox(
              width: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Keegan'),
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
                    Flag.fromCode(FlagsCode.TN, width: 20 * 4 / 3, height: 20, fit: BoxFit.scaleDown, borderRadius: 8,),
                    const Text('Tunisia'),
                  ],
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Text(sampleText, textAlign: TextAlign.justify,),
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
  }

  _buildTutorDetail(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _PartInfo(
          partDescription: Text('BA'),
          partTitle: 'Education',
        ),
        _PartInfo(
          partDescription: Wrap(
            runSpacing: 8,
            spacing: 8,
            children: [
              OutlinedText(text: 'English')
            ],
          ),
          partTitle: 'Languages',
        ),
        _PartInfo(
          partDescription: Wrap(
            runSpacing: 8,
            spacing: 8,
            children: [
              OutlinedText(text:'English for business'),
              OutlinedText(text: 'Conversational'),
              OutlinedText(text: 'English for kids'),
              OutlinedText(text: 'IELTS'),
              OutlinedText(text: 'STARTERS'),
              OutlinedText(text: 'MOVERS'),
            ],
          ),
          partTitle: 'Specialties',
        ),
        _PartInfo(
            partTitle: 'Suggested Courses',
            partDescription: Wrap(
              children: [

              ],
            )
        ),
        _PartInfo(
          partTitle: 'Interests',
          partDescription: Text('I loved the weather, the scenery and the laid-back lifestyle of the locals.'),
        ),
        _PartInfo(
          partTitle: 'Teaching experiences',
          partDescription: Text(''),
        ),
        _PartInfo(
          partTitle: 'Others review',
          partDescription: Text('This field for review'),
        )
      ],
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
    return Row(
      children: [
        Expanded(child: tutorBriefIntro),
        const SizedBox(width: 16,),
        Expanded(child: tutorIntroVideo),
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
      children: [
        Expanded(flex: 2,child: tutorDetailInfo,),
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
        Text(partTitle, style: Theme.of(context).textTheme.titleLarge,),
        partDescription,
        const SizedBox(height: 16,)
      ],
    );
  }
}




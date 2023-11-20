import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/app/tutors/data/tutor_repository.dart';
import 'package:lettutor/app/tutors/domain/tutors.dart';
import 'package:lettutor/app/tutors/viewmodel/tutors_viewmodel.dart';
import 'package:lettutor/core/commom-widgets/async_value_widget.dart';
import '../../../core/commom-widgets/appbar.dart';
import '../../../core/constant.dart';
import '../../../core/commom-widgets/drawer.dart';
import '../../../core/network/network_service.dart';
import '../domain/tutorsList.dart';
import '../service/tutors_service.dart';
import 'tutor_item.dart';
import 'upcoming-lesson.dart';

class TutorsPage extends StatefulWidget {
  const TutorsPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TutorsPageState();
  }
}

class _TutorsPageState extends State<TutorsPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    print("build");
    return Scaffold(
      key: _scaffoldKey,
      appBar: LettutorAppbar(
        onMenuIconPressed: () {
          _scaffoldKey.currentState!.openEndDrawer();
        },
      ),
      endDrawer: width - 40 <= titleWidth ? LettutorDrawer() : null,
      body: SingleChildScrollView(
        child: Column(
          children: [
            UpcomingLesson(),
            SizedBox(
              height: 24,
            ),
            TutorsSearchBox(),
            SizedBox(
              height: 24,
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 32),
              child: Text(
                'Recommend Tutors',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
                final tutorsList = ref.watch(tutorsListFutureProvider);
                return AsyncValueWidget<TutorsList?>(
                  value: tutorsList,
                  data: (tutorsList){
                    return Container(
                      margin: EdgeInsets.only(left: 32, right: 32),
                      child: Wrap(
                        alignment: WrapAlignment.start,
                        spacing: 16,
                        runSpacing: 12,
                        children: [
                          for (var tutor in tutorsList!.tutors!.rows!)
                            TutorItem(
                              tutor: tutor,
                            ),
                        ],
                      ),
                    );
                  },
                );
                // print("build");
                // ref.watch(tutorsViewmodelProvider.notifier).getTutorsWithPagination(9, 1);
                // return AsyncValueWidget<TutorsList?>(
                //     value: ref.watch(tutorsViewmodelProvider.notifier).getTutorsWithPagination(9, 1),
                //     data: data)
                // final tutorsList = ref.watch(tutorsViewmodelProvider.notifier).getTutorsWithPagination(9, 1);
                // tutorsList.then((value) => print(value));
                // return FutureBuilder(
                //   future: tutorsList,
                //   builder: (context, snapshot) {
                //     if (snapshot.hasData) {
                //       return Container(
                //         margin: EdgeInsets.only(left: 32, right: 32),
                //         child: Wrap(
                //           alignment: WrapAlignment.start,
                //           spacing: 16,
                //           runSpacing: 12,
                //           children: [
                //             for (var tutor in snapshot.data!.tutors!)
                //               TutorItem(
                //                 tutor: tutor,
                //               ),
                //           ],
                //         ),
                //       );
                //     } else {
                //       return Text("Failed to load data!");
                //     }
                //   });
            }),
            const SizedBox(
              height: 108,
            ),
          ],
        ),
      ),
    );
  }
}

class TutorsSearchBox extends StatelessWidget {
  const TutorsSearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 32, right: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Find a tutor',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.black,
                  fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w700)
                      .fontFamily,
                ),
          ),
          TextField(
            decoration: const InputDecoration(
              hintText: 'Enter tutor name..',
            ),
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(
            height: 8,
          ),
          TextField(
            decoration: const InputDecoration(
              hintText: 'Enter tutor native..',
            ),
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            'Select available tutoring time:',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Colors.black,
                  fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w600)
                      .fontFamily,
                ),
          ),
          TextField(
            decoration: const InputDecoration(
              hintText: 'This field for date picker',
            ),
            style: Theme.of(context).textTheme.bodySmall!,
          ),
          const SizedBox(
            height: 8,
          ),
          TextField(
            decoration: const InputDecoration(
              hintText: 'This field for start time and end time',
            ),
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Container(
            margin: EdgeInsets.only(top: 16),
            alignment: Alignment.centerLeft,
            child: Wrap(
              alignment: WrapAlignment.start,
              spacing: 16,
              runSpacing: 12,
              children: [
                ElevatedButton(onPressed: () {}, child: Text('All')),
                ElevatedButton(
                    onPressed: () {}, child: Text('English for kids')),
                ElevatedButton(
                    onPressed: () {}, child: Text('English for Business')),
                ElevatedButton(onPressed: () {}, child: Text('Conversational')),
                ElevatedButton(onPressed: () {}, child: Text('STARTERS')),
                ElevatedButton(onPressed: () {}, child: Text('MOVERS')),
                ElevatedButton(onPressed: () {}, child: Text('FLYERS')),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          OutlinedButton(
            onPressed: () {},
            child: const Text('Reset filters'),
          )
        ],
      ),
    );
  }
}

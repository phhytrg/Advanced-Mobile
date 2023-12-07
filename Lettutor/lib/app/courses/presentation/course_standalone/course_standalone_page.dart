import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/app/courses/domain/course.dart';
import 'package:lettutor/app/courses/presentation/course_standalone/controller/course_controller.dart';
import 'package:lettutor/core/commom-widgets/async_value_widget.dart';
import '../../../../../core/commom-widgets/button_widget.dart';
import '../../../../core/commom-widgets/appbar.dart';
import '../../../../core/commom-widgets/drawer.dart';
import '../../../../core/constant.dart';
import '../controller/courses_controller.dart';

class CourseStandalonePage extends ConsumerStatefulWidget {
  final String courseId;

  const CourseStandalonePage({super.key, required this.courseId});

  @override
  ConsumerState<CourseStandalonePage> createState() => _CourseInformationPageState();
}

class _CourseInformationPageState extends ConsumerState<CourseStandalonePage> {

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;

    final courseState = ref.watch(courseControllerProvider(widget.courseId));

    return Scaffold(
      key: _scaffoldKey,
      appBar: LettutorAppbar(
        onMenuIconPressed: (){
          _scaffoldKey.currentState?.openEndDrawer();
        },
      ),
      endDrawer: width - 40 <= titleWidth ? LettutorDrawer() : null,
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: AsyncValueWidget(
              value: courseState,
              data: (course) {
                return course == null ? const Text('No data') : LayoutBuilder(
                  builder: (context, constraints) {
                    if (constraints.maxWidth <= mobileWidth * 1.5) {
                      return Column(
                        children: [
                          _buildCourseCard(context, course),
                          const SizedBox(
                            height: 32,
                          ),
                          _buildCourseInfo(context, course)
                        ],
                      );
                    } else {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: _buildCourseCard(context, course),
                            flex: 3,
                          ),
                          const SizedBox(
                            width: 32,
                          ),
                          Expanded(
                            child: _buildCourseInfo(context, course),
                            flex: 7,
                          )
                        ],
                      );
                    }
                  },
                );
              },
            )
        ),
      ),
    );
  }

  Widget _buildCourseCard(BuildContext context, Course course){
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            // spreadRadius: 5,
            blurRadius: 0,
            offset: const Offset(0, 3),
          )
        ],
        borderRadius: BorderRadius.circular(16.0),
        color: Colors.white,
        border: Border.all(
          color: Colors.grey.shade300
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image.network(course.imageUrl, width: double.infinity, fit: BoxFit.scaleDown, )
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: Text(course.name, style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.w900,
            ),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Text(course.description),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
            child: FilledButton(
              onPressed: (){
                // Navigator.of(context).pushNamed('/course-detail');
              },
              child: const Text('Discover'),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCourseInfo(BuildContext context, Course course){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitleText(context, 'Overview'),
        const Divider(),
        RichText(
          text: TextSpan(
            children: [
              WidgetSpan(child: Icon(Icons.help_outline, color: Colors.red.shade700,), alignment: PlaceholderAlignment.middle),
              TextSpan(text: 'Why take this course', style: Theme.of(context).textTheme.titleSmall!)
            ]
          )
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(course.reason, textAlign: TextAlign.justify),
        ),
        const SizedBox(
          height: 16,
        ),
        RichText(
            text: TextSpan(
                children: [
                  WidgetSpan(child: Icon(Icons.help_outline, color: Colors.red.shade700,), alignment: PlaceholderAlignment.middle),
                  TextSpan(text: 'What will you be able to do', style: Theme.of(context).textTheme.titleSmall!)
                ]
            )
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(course.purpose, textAlign: TextAlign.justify),
        ),
        const SizedBox(
          height: 32,
        ),
        _buildTitleText(context, 'Experience Level'),
        Divider(),
        RichText(
            text: TextSpan(
                children: [
                  WidgetSpan(child: Icon(Icons.group_add, color: Colors.blue,), alignment: PlaceholderAlignment.middle),
                  const TextSpan(text: '  '),
                  TextSpan(text: 'Beginner', style: Theme.of(context).textTheme.titleSmall!)
                ]
            )
        ),
        const SizedBox(
          height: 32,
        ),
        _buildTitleText(context, 'Course length'),
        Divider(),
        RichText(
            text: TextSpan(
                children: [
                  const WidgetSpan(child: Icon(Icons.library_books, color: Colors.blue,), alignment: PlaceholderAlignment.middle),
                  const TextSpan(text: '  '),
                  TextSpan(text: '10 topics', style: Theme.of(context).textTheme.titleSmall!)
                ]
            )
        ),

        const SizedBox(
          height: 32,
        ),
        _buildTitleText(context, 'List Topics'),
        Divider(),
        LayoutBuilder(builder: (context, constraints){
          if(constraints.maxWidth <= 600){
            return Column(
              children: [
                for(int i = 0; i < course.topics.length; i++)
                  _buildTopicCard(context, '${i+1}. ${course.topics[i].name}')
              ],
            );
          }
          else{
            return GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                mainAxisExtent: 150, // here set custom Height You Want
              ),
              itemCount: course.topics.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: (){

                  },
                  borderRadius: BorderRadius.circular(8.0),
                  hoverColor: Colors.grey.shade300,
                  child: _buildTopicCard(context, '${index+1}. ${course.topics[index].name}')
                );
              },
            );
          }
        }),
        const SizedBox(
          height: 32,
        ),
        _buildTitleText(context, 'Suggested Tutors'),
        const Divider(),
        const Row(
          children: [
            Text('Keegan'),
            MyTextButton(child: Text('More info')),
          ],
        )
      ],
    );
  }

  Widget _buildTitleText(BuildContext context, String text){
    return Text(text,
        // Directly set font weight inside TextStyle or Theme.copyWith() will not work
        // Try passing fontWeight to GoogleFonts constructor
        style: GoogleFonts.poppins(
            fontWeight: FontWeight.w800,
            fontSize: Theme.of(context).textTheme.titleLarge!.fontSize
        )
    );
  }

  Widget _buildTopicCard(BuildContext context, String text){
    return Container(
      padding: const EdgeInsets.all(16.0),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.transparent,
        border: Border.all(
          color: Colors.grey.shade300
        ),

      ),
      child: Text(text, overflow: TextOverflow.fade,),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/app/courses/domain/course.dart';
import 'package:lettutor/app/courses/presentation/common/pdf_viewer.dart';
import 'package:lettutor/app/courses/presentation/course_standalone/controller/course_controller.dart';
import 'package:lettutor/core/common-widgets/async_value_widget.dart';
import 'package:lettutor/core/constant.dart';
import 'package:lettutor/core/route/router.dart';

class CourseTopicsPage extends ConsumerStatefulWidget {
  final String courseId;
  final int index;

  const CourseTopicsPage({super.key, required this.courseId, required this.index});

  @override
  ConsumerState<CourseTopicsPage> createState() => _CourseTopicsPageState();
}

class _CourseTopicsPageState extends ConsumerState<CourseTopicsPage> {
  var _selectedIndex;

  @override
  Widget build(BuildContext context) {
    _selectedIndex = widget.index;
    final courseState = ref.watch(courseControllerProvider(widget.courseId));

    return AsyncValueWidget(
      value: courseState,
      data: (course) {
        if (course == null) {
          return const Text('No data');
        }
        return LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth <= mobileWidth) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    _buildListTopicsSelection(context, course),
                    const SizedBox(
                      height: 32,
                    ),
                  ],
                ),
              );
            } else {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: _buildListTopicsSelection(context, course),
                  ),
                  const SizedBox(
                    width: 32,
                  ),
                  Expanded(flex: 3, child: MyPdfViewer(url: course.topics[_selectedIndex].nameFile)),
                ],
              );
            }
          },
        );
      },
    );
  }

  Widget _buildListTopicsSelection(BuildContext context, Course course) {
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Image.network(course.imageUrl),
        const SizedBox(
          height: 32.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 24.0),
          child: Text(
            'Basic Conversation Topics',
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w600).fontFamily,
                ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 32.0),
          child: Text(
            'Gain confidence speaking about familiar topics',
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
          child: Text(
            'List Topics',
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w600).fontFamily),
          ),
        ),
        ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
            shrinkWrap: true,
            itemCount: course.topics.length,
            itemBuilder: (context, index) {
              return ListTile(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(32), bottomLeft: Radius.circular(32)),
                ),
                // tileColor: _selectedIndex == index ? Colors.grey.shade300 : null,
                title: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    color: _selectedIndex == index ? Colors.grey.shade300 : null,
                  ),
                  child: RichText(
                    text: TextSpan(
                        style: TextStyle(fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w500).fontFamily),
                        children: [
                          TextSpan(text: '$index.  '),
                          TextSpan(text: course.topics[index].name),
                        ]),
                  ),
                ),
                onTap: () {
                  setState(() {
                    _selectedIndex = index;
                  });

                  if (MediaQuery.of(context).size.width <= mobileWidth) {
                    GoRouter.of(context).goNamed(AppRoute.pdfViewer.name, pathParameters: {
                      'url': course.topics[_selectedIndex].nameFile,
                    });
                  } else {
                    Router.neglect(context, () {
                      GoRouter.of(context).goNamed(AppRoute.courseTopics.name, pathParameters: {
                        'id': course.id,
                        'index': index.toString(),
                      });
                    });
                    GoRouter.of(context).pushNamed(AppRoute.courseTopics.name, pathParameters: {
                      'id': course.id,
                      'index': index.toString(),
                    });
                  }
                },
              );
            })
      ]),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/app/courses/domain/course.dart';
import 'package:lettutor/app/courses/presentation/course_standalone/controller/course_controller.dart';
import 'package:lettutor/core/common-widgets/async_value_widget.dart';
import 'package:lettutor/core/route/router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor/core/utils/string_utils.dart';
import '../../../../../core/common-widgets/button_widget.dart';
import '../../../../core/constant.dart';

class CourseStandalonePage extends ConsumerWidget {
  final String courseId;

  const CourseStandalonePage({super.key, required this.courseId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final txt = AppLocalizations.of(context)!;
    final courseState = ref.watch(courseControllerProvider(courseId));

    return SingleChildScrollView(
      child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: AsyncValueWidget(
            value: courseState,
            data: (course) {
              return course == null
                  ? const Text('No data')
                  : LayoutBuilder(
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
                                flex: 3,
                                child: _buildCourseCard(context, course),
                              ),
                              const SizedBox(
                                width: 32,
                              ),
                              Expanded(
                                flex: 7,
                                child: _buildCourseInfo(context, course),
                              )
                            ],
                          );
                        }
                      },
                    );
            },
          )),
    );
  }

  Widget _buildCourseCard(BuildContext context, Course course) {
    final txt = AppLocalizations.of(context)!;
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
          color: Theme.of(context).primaryColor,
          border: Border.all(color: Colors.grey.shade300)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image.network(
                course.imageUrl,
                width: double.infinity,
                fit: BoxFit.scaleDown,
              )),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: Text(
              course.name,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Text(course.description),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
            child: FilledButton(
              onPressed: () {
                context.goNamed(AppRoute.courseTopics.name, pathParameters: {'id': course.id, 'index': '0'});
              },
              child: Text(txt.discoverCourse),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCourseInfo(BuildContext context, Course course) {
    final txt = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitleText(context, txt.overview),
        const Divider(),
        RichText(
            text: TextSpan(children: [
          WidgetSpan(
              child: Icon(
                Icons.help_outline,
                color: Colors.red.shade700,
              ),
              alignment: PlaceholderAlignment.middle),
          TextSpan(text: txt.whyTakeThisCourse, style: Theme.of(context).textTheme.titleSmall!)
        ])),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(course.reason, textAlign: TextAlign.justify),
        ),
        const SizedBox(
          height: 16,
        ),
        RichText(
            text: TextSpan(children: [
          WidgetSpan(
              child: Icon(
                Icons.help_outline,
                color: Colors.red.shade700,
              ),
              alignment: PlaceholderAlignment.middle),
          TextSpan(text: txt.whatWillYouBeAbleToDo, style: Theme.of(context).textTheme.titleSmall!)
        ])),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(course.purpose, textAlign: TextAlign.justify),
        ),
        const SizedBox(
          height: 32,
        ),
        _buildTitleText(context, txt.experienceLevel),
        const Divider(),
        RichText(
            text: TextSpan(children: [
          const WidgetSpan(
              child: Icon(
                Icons.group_add,
                color: Colors.blue,
              ),
              alignment: PlaceholderAlignment.middle),
          const TextSpan(text: '  '),
          TextSpan(text: StringUtils.numberToLevel(int.parse(course.level)) , style: Theme.of(context).textTheme.titleSmall!)
        ])),
        const SizedBox(
          height: 32,
        ),
        _buildTitleText(context, txt.courseLength),
        const Divider(),
        RichText(
            text: TextSpan(children: [
          const WidgetSpan(
              child: Icon(
                Icons.library_books,
                color: Colors.blue,
              ),
              alignment: PlaceholderAlignment.middle),
          const TextSpan(text: '  '),
          TextSpan(text: '${course.topics.length} ${txt.topics.toLowerCase()}', style: Theme.of(context).textTheme.titleSmall!)
        ])),
        const SizedBox(
          height: 32,
        ),
        _buildTitleText(context, txt.listTopics),
        Divider(),
        LayoutBuilder(builder: (context, constraints) {
          if (constraints.maxWidth <= 600) {
            return Column(
              children: [
                for (int i = 0; i < course.topics.length; i++)
                  _buildTopicCard(context, '${i + 1}. ${course.topics[i].name}')
              ],
            );
          } else {
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
                    onTap: () {
                      GoRouter.of(context).pushNamed(AppRoute.courseTopics.name, pathParameters: {
                        'id': course.id,
                        'index': index.toString(),
                      });
                    },
                    borderRadius: BorderRadius.circular(8.0),
                    hoverColor: Theme.of(context).primaryColorDark,
                    child: _buildTopicCard(context, '${index + 1}. ${course.topics[index].name}'));
              },
            );
          }
        }),
        const SizedBox(
          height: 32,
        ),
        _buildTitleText(context, txt.suggestedTutors),
        const Divider(),
        Row(
          children: [
            Text(course.users!.first.name),
            const MyTextButton(child: Text('More info')),
          ],
        )
      ],
    );
  }

  Widget _buildTitleText(BuildContext context, String text) {
    return Text(text,
        // Directly set font weight inside TextStyle or Theme.copyWith() will not work
        // Try passing fontWeight to GoogleFonts constructor
        style: GoogleFonts.poppins(
            fontWeight: FontWeight.w800, fontSize: Theme.of(context).textTheme.titleLarge!.fontSize));
  }

  Widget _buildTopicCard(BuildContext context, String text) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Theme.of(context).primaryColor,
        border: Border.all(color: Colors.grey.shade300
        ),
      ),
      child: Text(
        text,
        overflow: TextOverflow.fade,
      ),
    );
  }
}

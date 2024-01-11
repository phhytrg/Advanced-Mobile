import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lettutor/app/courses/domain/course.dart';
import 'package:lettutor/app/courses/presentation/common/ebook_item.dart';
import 'package:lettutor/app/courses/presentation/controller/ebooks_controller.dart';
import 'package:lettutor/app/courses/presentation/course_standalone/controller/course_controller.dart';
import 'package:lettutor/core/commom-widgets/async_value_widget.dart';
import 'package:lettutor/core/route/router.dart';
import 'package:lettutor/core/utils/string_utils.dart';

import '../controller/courses_controller.dart';

class CoursesNavigation extends StatefulWidget {
  final TabController tabController;

  const CoursesNavigation({super.key, required this.resetOnTabChange, required this.tabController});

  final VoidCallback resetOnTabChange;

  @override
  State<CoursesNavigation> createState() => _CoursesNavigationState();
}

class _CoursesNavigationState extends State<CoursesNavigation> {
  var _selectedTabIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var animatedWidgets = [_buildCourseTab(), _buildEbookTab(), _buildInteractiveEbookTab()];

    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          TabBar(
            tabs: const [
              Tab(
                text: 'Course',
              ),
              Tab(
                text: 'E-Book',
              ),
              Tab(text: 'Interactive E-book'),
            ],
            onTap: (index) {
              setState(() {
                _selectedTabIndex = index;
                widget.resetOnTabChange();
                widget.tabController.animateTo(index);
              });
            },
            controller: widget.tabController,
          ),
          const SizedBox(
            height: 16,
          ),
          IndexedStack(
            index: _selectedTabIndex,
            children: [
              Visibility(
                maintainState: true,
                visible: _selectedTabIndex == 0,
                child: animatedWidgets[0],
              ),
              Visibility(
                maintainState: true,
                visible: _selectedTabIndex == 1,
                child: animatedWidgets[1],
              ),
              Visibility(
                maintainState: true,
                visible: _selectedTabIndex == 2,
                child: animatedWidgets[2],
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildCourseTab() {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final coursesState = ref.watch(courseListControllerProvider);
        return AsyncValueWidget(
          value: coursesState,
          data: (coursesList) {
            //Specific item in list
            final List<String> categories = coursesList.rows.map((e) => e.categories![0].title).toSet().toList();
            return Column(
              children: [
                for (int i = 0; i < categories.length; i++)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24.0),
                        child: Text(
                          categories[i],
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontWeight: FontWeight.w900, fontSize: 24),
                        ),
                      ),
                      Wrap(
                        alignment: WrapAlignment.start,
                        key: ValueKey<int>(i),
                        children: [
                          for (var course in coursesList.rows)
                            if (course.categories![0].title == categories[i])
                              CourseItem(
                                course: course,
                              ),
                        ],
                      ),
                      const SizedBox(
                        height: 32,
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

  Widget _buildInteractiveEbookTab() {
    return const Wrap(
      alignment: WrapAlignment.start,
      key: ValueKey<int>(2),
      children: [],
    );
  }

  Widget _buildEbookTab() {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final ebooksState = ref.watch(ebooksControllerProvider);
        return AsyncValueWidget(
          value: ebooksState,
          data: (ebookList) {
            return Wrap(
              alignment: WrapAlignment.start,
              key: const ValueKey<int>(1),
              children: [
                for (var ebook in ebookList.rows)
                  EbookItem(
                    ebook: ebook,
                  ),
              ],
            );
          },
        );
      },
    );
  }
}

class CourseItem extends ConsumerWidget {
  const CourseItem({super.key, required this.course});

  final Course course;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () async {
        context.goNamed(AppRoute.courseInfo.name, pathParameters: {
          'id': course.id.toString(),
        });
      },
      child: Container(
        width: 300,
        height: 300 * 3.8 / 3,
        margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
        // height: 280 * 3.8 / 3,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            border: Border.all(
              color: Colors.grey.shade400,
              width: 0.5,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                // spreadRadius: 5,
                blurRadius: 0,
                offset: const Offset(0, 3),
              ),
            ],
            color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.network(
                  course.imageUrl,
                  width: 300,
                  fit: BoxFit.scaleDown,
                )),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course.name,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    course.description,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Colors.grey,
                        ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24.0),
              child: Text('${StringUtils.numberToLevel(int.parse(course.level))} • ${course.topics.length} Lessons'),
            )
          ],
        ),
      ),
    );
  }
}

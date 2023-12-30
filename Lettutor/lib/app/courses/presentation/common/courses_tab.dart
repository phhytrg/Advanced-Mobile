import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lettutor/app/courses/domain/course.dart';
import 'package:lettutor/app/courses/presentation/common/ebook_item.dart';
import 'package:lettutor/app/courses/presentation/controller/ebooks_controller.dart';
import 'package:lettutor/core/commom-widgets/async_value_widget.dart';
import 'package:lettutor/core/route/router.dart';
import 'package:lettutor/core/utils/string_utils.dart';

import '../controller/courses_controller.dart';

class CoursesNavigation extends StatefulWidget {
  const CoursesNavigation({super.key});

  @override
  State<CoursesNavigation> createState() => _CoursesNavigationState();
}

class _CoursesNavigationState extends State<CoursesNavigation>
    with TickerProviderStateMixin{

  // var courseTab = Wrap(
  //   alignment: WrapAlignment.start,
  //   key: ValueKey<int>(0),
  //   children: [
  //     CourseItem(),
  //     CourseItem(),
  //     CourseItem(),
  //     CourseItem(),
  //     CourseItem(),
  //     CourseItem(),
  //     CourseItem(),
  //     CourseItem(),
  //     CourseItem(),
  //     CourseItem(),
  //   ],
  // );
  // var ebookTab = Wrap(
  //   alignment: WrapAlignment.start,
  //   key: ValueKey<int>(1),
  //   children: [
  //     CourseItem(),
  //     CourseItem(),
  //     CourseItem(),
  //     CourseItem(),
  //     CourseItem(),
  //     CourseItem(),
  //     CourseItem(),
  //     CourseItem(),
  //     CourseItem(),
  //   ],
  // );
  // var interactiveEbookTab = Wrap(
  //   alignment: WrapAlignment.start,
  //   key: ValueKey<int>(2),
  //   children: [
  //   ],
  // );

  var _selectedTabIndex = 0;

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0, );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    var animatedWidgets = [
      _buildCourseTab(),_buildEbookTab(),_buildInteractiveEbookTab()
    ];

    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          TabBar(
            tabs: [
              Tab(text: 'Course',),
              Tab(text: 'E-Book',),
              Tab(text: 'Interactive E-book'),
            ],
            onTap: (index){
              setState(() {
                _selectedTabIndex = index;
                _tabController.animateTo(index);
              });
            },
            controller: _tabController,
          ),
          const SizedBox(
            height: 16,
          ),
          IndexedStack(
            children: [
              Visibility(
                child: animatedWidgets[0],
                maintainState: true,
                visible: _selectedTabIndex == 0,
              ),
              Visibility(
                child: animatedWidgets[1],
                maintainState: true,
                visible: _selectedTabIndex == 1,
              ),
              Visibility(
                child: animatedWidgets[2],
                maintainState: true,
                visible: _selectedTabIndex == 2,
              ),
            ],
            index: _selectedTabIndex,
          )
        ],
      ),
    );
  }

  Widget _buildCourseTab(){
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final coursesState = ref.watch(courseListControllerProvider);
        return AsyncValueWidget(
          value: coursesState,
          data: (coursesList) {
            return Wrap(
              alignment: WrapAlignment.start,
              key: ValueKey<int>(0),
              children: [
                for (var course in coursesList.rows)
                  CourseItem(course: course,),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildInteractiveEbookTab(){
    return Wrap(
      alignment: WrapAlignment.start,
      key: ValueKey<int>(2),
      children: [
      ],
    );
  }

  Widget _buildEbookTab(){
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
                  EbookItem(ebook: ebook,),
              ],
            );
          },
        );
      },
    );
  }
}


class CourseItem extends StatelessWidget {
  const CourseItem({super.key, required this.course});
  final Course course;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        context.goNamed(AppRoute.courseInfo.name, pathParameters: {
          'id': course.id.toString(),
        });
      },
      child: Container(
        width: 300,
        height: 300 * 3.8 / 3,
        margin: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
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
                offset: Offset(0, 3),
              ),
            ],
            color: Colors.white
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.network(course.imageUrl, width: 300, fit: BoxFit.scaleDown, )
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(course.name, style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w900
                  ),),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(course.description,
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

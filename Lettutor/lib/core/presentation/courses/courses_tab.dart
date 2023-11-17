import 'package:flutter/material.dart';

class CoursesNavigation extends StatefulWidget {
  const CoursesNavigation({super.key});

  @override
  State<CoursesNavigation> createState() => _CoursesNavigationState();
}

class _CoursesNavigationState extends State<CoursesNavigation>
    with TickerProviderStateMixin{

  var courseTab = Wrap(
    alignment: WrapAlignment.start,
    key: ValueKey<int>(0),
    children: [
      CourseItem(),
      CourseItem(),
      CourseItem(),
      CourseItem(),
      CourseItem(),
      CourseItem(),
      CourseItem(),
      CourseItem(),
      CourseItem(),
      CourseItem(),
    ],
  );
  var ebookTab = Wrap(
    alignment: WrapAlignment.start,
    key: ValueKey<int>(1),
    children: [
      CourseItem(),
      CourseItem(),
      CourseItem(),
      CourseItem(),
      CourseItem(),
      CourseItem(),
      CourseItem(),
      CourseItem(),
      CourseItem(),
    ],
  );
  var interactiveEbookTab = Wrap(
    alignment: WrapAlignment.start,
    key: ValueKey<int>(2),
    children: [
    ],
  );

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
      courseTab,ebookTab,interactiveEbookTab
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
          // Builder(builder: (context){
          //   return AnimatedSwitcher(
          //     duration: const Duration(milliseconds: 0.),
          //     transitionBuilder: (child, animation){
          //       return SlideTransition(
          //         position: Tween<Offset>(
          //             begin: Offset(-1, 0),
          //             end: Offset.zero)
          //             .animate(animation),
          //         child: animatedWidgets[_selectedTabIndex],
          //       );
          //     },
          //     child: animatedWidgets[_selectedTabIndex],
          //   );
          // })
        ],
      ),
    );
  }
}


class CourseItem extends StatelessWidget {
  const CourseItem({super.key});
  final horizontalPadding = 24.0;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed('/course-info');
      },
      child: Container(
        width: 280,
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
                child: Image.asset('images/course-image.png', width: 300, fit: BoxFit.scaleDown, )
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Life in the Internet Age', style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w900
                  ),),
                  const SizedBox(
                    height: 8,
                  ),
                  Text('Let\'s discuss how technology is changing the way we live',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: horizontalPadding),
              child: Text('Intermediate • 9  Lessons'),
            )
          ],
        ),
      ),
    );
  }
}

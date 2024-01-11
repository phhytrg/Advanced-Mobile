import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lettutor/app/courses/data/course_repository.dart';
import 'package:lettutor/app/courses/presentation/controller/courses_controller.dart';
import 'package:lettutor/app/courses/presentation/controller/ebooks_controller.dart';
import 'package:lettutor/core/commom-widgets/async_value_widget.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

import '../../../../core/commom-widgets/search.dart';
import '../../../core/constant.dart';
import 'common/courses_tab.dart';

class CoursesPage extends ConsumerStatefulWidget {
  const CoursesPage({super.key});

  @override
  ConsumerState<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends ConsumerState<CoursesPage> with TickerProviderStateMixin {
  late final MultiSelectController levelSelectingController;
  late final MultiSelectController categoryController;
  late final MultiSelectController levelSortingController;
  late final TextEditingController searchController;
  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    levelSelectingController = MultiSelectController();
    categoryController = MultiSelectController();
    levelSortingController = MultiSelectController();
    searchController = TextEditingController();

    tabController = TabController(
      length: 3,
      vsync: this,
      initialIndex: 0,
    );

    searchController.addListener(() {
      final currentTab = tabController.index;
      if (searchController.value.text == '') return;
      if (currentTab == 0) {
        ref.read(courseListControllerProvider.notifier).filter(
              query: searchController.text != '' ? searchController.text : null,
              level: levelSelectingController.selectedOptions.isNotEmpty
                  ? levelSelectingController.selectedOptions.map((e) => e.toString()).toList()
                  : null,
              order: ['level'],
              orderBy: levelSortingController.selectedOptions.isNotEmpty
                  ? levelSortingController.selectedOptions.first.toString()
                  : null,
              categoryIds: categoryController.selectedOptions.isNotEmpty
                  ? categoryController.selectedOptions.map((e) => e.toString()).toList()
                  : null,
            );
      } else if (currentTab == 1) {
        ref.read(ebooksControllerProvider.notifier).filter(
            query: searchController.text != '' ? searchController.text : null,
            level: levelSelectingController.selectedOptions.isNotEmpty
                ? levelSelectingController.selectedOptions.map((e) => e.toString()).toList()
                : null,
            order: ['level'],
            orderBy: levelSortingController.selectedOptions.isNotEmpty
                ? levelSortingController.selectedOptions.first.toString()
                : null,
            categoryIds: categoryController.selectedOptions.isNotEmpty
                ? categoryController.selectedOptions.map((e) => e.toString()).toList()
                : null);
      } else if (currentTab == 2) {
        // ref.read(interactiveEbooksControllerProvider.notifier).filter(searchController.text);
      }
    });
  }

  @override
  void dispose() {
    levelSelectingController.dispose();
    categoryController.dispose();
    levelSortingController.dispose();
    searchController.dispose();
    tabController.dispose();
    super.dispose();
  }

  void reset() {
    levelSelectingController.setSelectedOptions([]);
    categoryController.setSelectedOptions([]);
    levelSortingController.setSelectedOptions([]);
    searchController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            CoursesHeader(
              levelSelectingController: levelSelectingController,
              categoryController: categoryController,
              levelSortingController: levelSortingController,
              searchController: searchController,
            ),
            CoursesNavigation(
              resetOnTabChange: () {
                reset();
              },
              tabController: tabController,
            ),
          ],
        ),
      ),
    );
  }
}

class CoursesHeader extends StatelessWidget {
  final levelsDropdownMenu = <DropdownMenuEntry<String>>[];

  final categoriesDropdownMenu = <DropdownMenuEntry<String>>[];

  final sortDropdownMenu = <DropdownMenuEntry<String>>[];

  final MultiSelectController levelSelectingController;
  final MultiSelectController categoryController;
  final MultiSelectController levelSortingController;
  final TextEditingController searchController;

  CoursesHeader(
      {super.key,
      required this.levelSelectingController,
      required this.categoryController,
      required this.levelSortingController,
      required this.searchController});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              SvgPicture.asset(
                'icons/course.svg',
                width: 96,
                fit: BoxFit.scaleDown,
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Discover Courses',
                      style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                            fontWeight: FontWeight.w900,
                          ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    MySearchBar(
                      hintText: 'Course',
                      controller: searchController,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
              'LiveTutor has built the most quality, methodical and scientific courses in the fields of life for those who are in need of improving their knowledge of the fields.'),
        ),
        LayoutBuilder(builder: (context, constraints) {
          if (constraints.maxWidth > mobileWidth) {
            return Row(
              children: [
                Expanded(
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: _buildMultiSelectDropdownButton(
                          context,
                          const [
                            ValueItem(label: 'Beginner', value: '1'),
                            ValueItem(label: 'Upper Beginner', value: '2'),
                            ValueItem(label: 'Pre-Intermediate', value: '3'),
                            ValueItem(label: 'Upper-Intermediate', value: '4'),
                            ValueItem(label: 'Pre-Advance', value: '5'),
                            ValueItem(label: 'Advanced', value: '6'),
                            ValueItem(label: 'Very Advanced', value: '7'),
                          ],
                          'Select level',
                          levelSelectingController)),
                ),
                Expanded(
                  child: Consumer(builder: (context, ref, child) {
                    final categories = ref.watch(getCategoriesProvider);
                    return AsyncValueWidget(
                        value: categories,
                        data: (categories) {
                          return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: _buildMultiSelectDropdownButton(
                                context,
                                [
                                  for (var category in categories)
                                    ValueItem(
                                      label: category.title,
                                      value: category.id.toString(),
                                    )
                                ],
                                'Select category',
                                categoryController,
                              ));
                        });
                  }),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _buildSingleSelectDropdownButton(
                        context,
                        const [
                          ValueItem(label: 'Level decreasing', value: 'DESC'),
                          ValueItem(label: 'Level increasing', value: 'ASC')
                        ],
                        'Sort by level',
                        levelSortingController),
                  ),
                ),
              ],
            );
          } else {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _buildMultiSelectDropdownButton(
                      context,
                      [
                        const ValueItem(label: 'Beginner', value: '1'),
                        const ValueItem(label: 'Upper Beginner', value: '2'),
                        const ValueItem(label: 'Pre-Intermediate', value: '3'),
                        const ValueItem(label: 'Upper-Intermediate', value: '4'),
                        const ValueItem(label: 'Pre-Advance', value: '5'),
                        const ValueItem(label: 'Advanced', value: '6'),
                        const ValueItem(label: 'Very Advanced', value: '7'),
                      ],
                      'Select level',
                      levelSelectingController),
                ),
                Consumer(builder: (context, ref, child) {
                  final categories = ref.watch(getCategoriesProvider);
                  return AsyncValueWidget(
                      value: categories,
                      data: (categories) {
                        return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: _buildMultiSelectDropdownButton(
                              context,
                              [
                                for (var category in categories)
                                  ValueItem(
                                    label: category.title,
                                    value: category.id.toString(),
                                  )
                              ],
                              'Select category',
                              categoryController,
                            ));
                      });
                }),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _buildSingleSelectDropdownButton(
                      context,
                      const [
                        ValueItem(label: 'Level decreasing', value: 'DESC'),
                        ValueItem(label: 'Level increasing', value: 'ASC'),
                      ],
                      'Sort by level',
                      levelSortingController),
                ),
              ],
            );
          }
        }),
      ],
    );
  }

  Widget _buildMultiSelectDropdownButton(
      BuildContext context, List<ValueItem> valueItems, String hintText, MultiSelectController controller) {
    return Theme(
      data: ThemeData(
        inputDecorationTheme: Theme.of(context).inputDecorationTheme.copyWith(
              isDense: true,
            ),
      ),
      child: MultiSelectDropDown(
        showClearIcon: true,
        onOptionSelected: (options) {},
        options: valueItems,
        selectionType: SelectionType.multi,
        chipConfig: ChipConfig(
          wrapType: WrapType.scroll,
          labelStyle: const TextStyle(
            fontSize: 12,
          ),
          padding: EdgeInsets.all(4),
          radius: 8,
          backgroundColor: Colors.grey.shade300,
          deleteIconColor: Colors.grey.shade600,
        ),
        borderRadius: 8,
        optionTextStyle: Theme.of(context).textTheme.bodySmall!,
        selectedOptionIcon: const Icon(Icons.check),
        selectedOptionBackgroundColor: Colors.blue.shade50,
        padding: EdgeInsets.zero,
        hint: hintText,
        controller: controller,
      ),
    );
  }

  Widget _buildSingleSelectDropdownButton(
      BuildContext context, List<ValueItem> valueItems, String hintText, MultiSelectController controller) {
    return Theme(
      data: ThemeData(
        inputDecorationTheme: Theme.of(context).inputDecorationTheme.copyWith(
              isDense: true,
            ),
      ),
      child: MultiSelectDropDown(
        onOptionSelected: (options) {},
        options: valueItems,
        selectionType: SelectionType.single,
        borderRadius: 8,
        dropdownHeight: 104,
        optionTextStyle: Theme.of(context).textTheme.bodySmall!,
        selectedOptionIcon: const Icon(Icons.check),
        selectedOptionBackgroundColor: Colors.blue.shade50,
        padding: EdgeInsets.zero,
        hint: hintText,
        controller: controller,
      ),
    );
  }
}

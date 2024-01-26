import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lettutor/app/courses/data/course_repository.dart';
import 'package:lettutor/app/courses/presentation/controller/courses_controller.dart';
import 'package:lettutor/app/courses/presentation/controller/ebooks_controller.dart';
import 'package:lettutor/core/common-widgets/async_value_widget.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/common-widgets/search.dart';
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
  late final ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        if (tabController.index == 1) {
          ref.read(ebooksControllerProvider.notifier).loadMore(
              query: searchController.text != '' ? searchController.text : null,
              level: levelSelectingController.selectedOptions.isNotEmpty
                  ? levelSelectingController.selectedOptions.map((e) => e.toString()).toList()
                  : null,
              order: ['level'],
              orderBy: levelSortingController.selectedOptions.isNotEmpty
                  ? levelSortingController.selectedOptions.first.toString()
                  : null,
              categories: categoryController.selectedOptions.isNotEmpty
                  ? categoryController.selectedOptions.map((e) => e.toString()).toList()
                  : null);
        }
      }
    });
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
    scrollController.dispose();
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
      controller: scrollController,
      child: Container(
        padding: const EdgeInsets.all(16.0),
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
    final txt = AppLocalizations.of(context)!;
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
                      txt.discoverCourse,
                      style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                            fontWeight: FontWeight.w900,
                          ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    MySearchBar(
                      hintText: txt.course,
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(txt.whatCourse),
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
                                txt.selectCategory,
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
                        [
                          ValueItem(label: txt.levelDecreasing, value: 'DESC'),
                          ValueItem(label: txt.levelIncreasing, value: 'ASC')
                        ],
                        txt.sortByLevel,
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
                      txt.selectLevel,
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
                      txt.sortByLevel,
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
        onOptionSelected: (options) {

        },
        options: valueItems,
        selectionType: SelectionType.multi,
        chipConfig: ChipConfig(
          wrapType: WrapType.scroll,
          labelStyle: const TextStyle(
            fontSize: 12,
          ),
          padding: const EdgeInsets.all(4),
          radius: 8,
          backgroundColor: Colors.grey.shade300,
          deleteIconColor: Colors.grey.shade600,
        ),
        borderRadius: 8,
        backgroundColor: Theme.of(context).primaryColor,
        optionTextStyle: Theme.of(context).textTheme.bodySmall!,
        selectedOptionIcon: const Icon(Icons.check),
        selectedOptionBackgroundColor: Theme.of(context).primaryColorDark,
        optionsBackgroundColor: Theme.of(context).primaryColorDark,
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
        backgroundColor: Theme.of(context).primaryColor,
        optionTextStyle: Theme.of(context).textTheme.bodySmall!,
        selectedOptionIcon: const Icon(Icons.check),
        selectedOptionBackgroundColor: Theme.of(context).primaryColorDark,
        optionsBackgroundColor: Theme.of(context).primaryColorDark,
        padding: EdgeInsets.zero,
        hint: hintText,
        controller: controller,
      ),
    );
  }
}

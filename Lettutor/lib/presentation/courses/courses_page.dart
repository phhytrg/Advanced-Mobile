

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lettutor/presentation/courses/courses_tab.dart';
import 'package:lettutor/presentation/custom-widgets/search.dart';
import 'package:lettutor/presentation/login/appbar.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

class CoursesPage extends StatelessWidget {
  const CoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LettutorAppbar(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              CoursesHeader(),
              CoursesNavigation(),
            ],
          ),
        ),
      ),
    );
  }
}

class CoursesHeader extends StatelessWidget {
  final levelsDropdownMenu = <DropdownMenuEntry<String>>[
  ];

  final categoriesDropdownMenu = <DropdownMenuEntry<String>>[
  ];

  final sortDropdownMenu = <DropdownMenuEntry<String>>[
  ];

  CoursesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              SvgPicture.asset('icons/course.svg', width: 96, fit: BoxFit.scaleDown,),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Discover Courses', style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.w900,
                    ),),
                    const SizedBox(
                      height: 8,
                    ),
                    MySearchBar(
                      hintText: 'Course',
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
          child: Text('LiveTutor has built the most quality, methodical and scientific courses in the fields of life for those who are in need of improving their knowledge of the fields.'),
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Theme(
                  data: ThemeData(
                    inputDecorationTheme: Theme.of(context).inputDecorationTheme.copyWith(
                      isDense: true,
                    ),
                  ),
                  child: MultiSelectDropDown(
                    showClearIcon: true,
                    onOptionSelected: (options) {
                      debugPrint(options.toString());
                    },
                    options: const <ValueItem>[
                      ValueItem(label: 'Option 1', value: '1'),
                      ValueItem(label: 'Option 2', value: '2'),
                      ValueItem(label: 'Option 3', value: '3'),
                      ValueItem(label: 'Option 4', value: '4'),
                      ValueItem(label: 'Option 5', value: '5'),
                      ValueItem(label: 'Option 6', value: '6'),
                      ValueItem(label: 'Option 1', value: '7'),
                      ValueItem(label: 'Option 2', value: '8'),
                      ValueItem(label: 'Option 3', value: '9'),
                      ValueItem(label: 'Option 4', value: '10'),
                      ValueItem(label: 'Option 5', value: '11'),
                      ValueItem(label: 'Option 6', value: '12'),
                      ValueItem(label: 'Option 1', value: '13'),
                      ValueItem(label: 'Option 2', value: '14'),
                      ValueItem(label: 'Option 3', value: '15'),
                    ],
                    selectionType: SelectionType.multi,
                    chipConfig: ChipConfig(
                      wrapType: WrapType.scroll,
                      labelStyle: TextStyle(
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
                    hint: 'Select level',
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Theme(
                  data: ThemeData(
                    inputDecorationTheme: Theme.of(context).inputDecorationTheme.copyWith(
                      isDense: true,
                    ),
                  ),
                  child: MultiSelectDropDown(
                    showClearIcon: true,
                    onOptionSelected: (options) {
                      debugPrint(options.toString());
                    },
                    options: const <ValueItem>[
                      ValueItem(label: 'Option 1', value: '1'),
                      ValueItem(label: 'Option 2', value: '2'),
                      ValueItem(label: 'Option 3', value: '3'),
                      ValueItem(label: 'Option 4', value: '4'),
                      ValueItem(label: 'Option 5', value: '5'),
                      ValueItem(label: 'Option 6', value: '6'),
                      ValueItem(label: 'Option 1', value: '7'),
                      ValueItem(label: 'Option 2', value: '8'),
                      ValueItem(label: 'Option 3', value: '9'),
                      ValueItem(label: 'Option 4', value: '10'),
                      ValueItem(label: 'Option 5', value: '11'),
                      ValueItem(label: 'Option 6', value: '12'),
                      ValueItem(label: 'Option 1', value: '13'),
                      ValueItem(label: 'Option 2', value: '14'),
                      ValueItem(label: 'Option 3', value: '15'),
                    ],
                    selectionType: SelectionType.multi,
                    chipConfig: ChipConfig(
                      wrapType: WrapType.scroll,
                      labelStyle: TextStyle(
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
                    hint: 'Select category',
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Theme(
                  data: ThemeData(
                    inputDecorationTheme: Theme.of(context).inputDecorationTheme.copyWith(
                      isDense: true,
                    ),
                  ),
                  child: MultiSelectDropDown(
                    onOptionSelected: (options) {
                      debugPrint(options.toString());
                    },
                    options: const <ValueItem>[
                      ValueItem(label: 'Level decreasing', value: '1'),
                      ValueItem(label: 'Level ascending', value: '2')
                    ],
                    selectionType: SelectionType.single,
                    borderRadius: 8,
                    dropdownHeight: 104,
                    optionTextStyle: Theme.of(context).textTheme.bodySmall!,
                    selectedOptionIcon: const Icon(Icons.check),
                    selectedOptionBackgroundColor: Colors.blue.shade50,
                    padding: EdgeInsets.zero,
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}



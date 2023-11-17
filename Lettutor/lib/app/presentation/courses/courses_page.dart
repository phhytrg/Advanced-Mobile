

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

import '../../../core/commom-widgets/search.dart';
import '../appbar.dart';
import '../constant.dart';
import '../drawer/drawer.dart';
import 'courses_tab.dart';

class CoursesPage extends StatelessWidget {
  CoursesPage({super.key});

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      key: _scaffoldKey,
      appBar: LettutorAppbar(
        onMenuIconPressed: (){
          _scaffoldKey.currentState?.openEndDrawer();
        },
      ),
      endDrawer: width - 40 <= titleWidth ? LettutorDrawer() : null,
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
        LayoutBuilder(builder: (context, constraints){
          if(constraints.maxWidth > mobileWidth){
            return Row(
              children: [
                Expanded(
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: _buildMultiSelectDropdownButton(
                          context,
                          [],
                          'Select level'
                      )
                  ),
                ),
                Expanded(
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: _buildMultiSelectDropdownButton(
                        context,
                        [],
                        'Select category',
                      )
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _buildSingleSelectDropdownButton(context, [], ''),
                  ),
                ),
              ],
            );
          }
          else{
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _buildMultiSelectDropdownButton(context, [], 'Select level'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _buildMultiSelectDropdownButton(context, [], 'Select category'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _buildSingleSelectDropdownButton(context, [], ''),
                ),
              ],
            );
          }
        }),
      ],
    );
  }

  Widget _buildMultiSelectDropdownButton(BuildContext context, List<ValueItem> valueItems, String hintText){
    return Theme(
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
        options: valueItems,
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
        hint: hintText,
      ),
    );
  }

  Widget _buildSingleSelectDropdownButton(BuildContext context, List<ValueItem> valueItems, String hintText){
    return Theme(
      data: ThemeData(
        inputDecorationTheme: Theme.of(context).inputDecorationTheme.copyWith(
          isDense: true,
        ),
      ),
      child: MultiSelectDropDown(
        onOptionSelected: (options) {

        },
        options: valueItems,
        selectionType: SelectionType.single,
        borderRadius: 8,
        dropdownHeight: 104,
        optionTextStyle: Theme.of(context).textTheme.bodySmall!,
        selectedOptionIcon: const Icon(Icons.check),
        selectedOptionBackgroundColor: Colors.blue.shade50,
        padding: EdgeInsets.zero,
        hint: hintText,
      ),
    );
  }
}



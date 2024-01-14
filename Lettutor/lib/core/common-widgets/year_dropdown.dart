import 'package:flutter/material.dart';

class YearDropdown extends StatelessWidget {

  final OnYearChangedCallback onYearChanged;
  final int initialYear;

  const YearDropdown({super.key, required this.onYearChanged, required this.initialYear});

  @override
  Widget build(BuildContext context) {
    var currentYear = DateTime.now().year;
    List<int> years = List.generate(2045 - currentYear, (index) => currentYear + index);
    List<DropdownMenuItem<int>> items = List.generate(
      years.length,
          (index) => DropdownMenuItem<int>(
        value: years[index],
        child: Text(years[index].toString()),
      ),
    );

    return DropdownButtonHideUnderline(
      child: DropdownButton<int>(
        borderRadius: const BorderRadius.all(
          Radius.circular(12.0),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        elevation: 4,
        value: initialYear,
        // style: style,
        items: items,
        onChanged: onYearChanged,
      ),
    );
  }
}

typedef OnYearChangedCallback = void Function(int? year);
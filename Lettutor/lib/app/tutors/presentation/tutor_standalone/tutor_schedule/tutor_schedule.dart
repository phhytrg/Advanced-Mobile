
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/app/tutors/presentation/tutor_standalone/tutor_schedule/time_ranges_tab.dart';

import '../../../../../core/common-widgets/year_dropdown.dart';

class BookingSchedule extends StatefulWidget {
  final String tutorId;

  const BookingSchedule({super.key, required this.tutorId});

  @override
  State<BookingSchedule> createState() => BookingScheduleState();
}

class BookingScheduleState extends State<BookingSchedule> with TickerProviderStateMixin{
  int year = DateTime.now().year;
  int month = DateTime.now().month;
  int day = DateTime.now().day;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: YearDropdown(
            onYearChanged: (int? value) {
              setState(() {
                year = value!;
              });
            },
            initialYear: year,
          ),
        ),
        EasyDateTimeLine(
          initialDate: year == DateTime.now().year ? DateTime(year,month, day, 0, 0) : DateTime(year, 11, 25, 0, 0),
          onDateChange: (selectedDate) {
            setState(() {
              year = selectedDate.year;
              month = selectedDate.month;
              day = selectedDate.day;
            });
          },
          headerProps: const EasyHeaderProps(
            monthPickerType: MonthPickerType.dropDown,
            selectedDateFormat: SelectedDateFormat.fullDateDMY,
          ),
          dayProps: EasyDayProps(
            dayStructure: DayStructure.dayStrDayNum,
            activeDayStyle: const DayStyle(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xff3371FF),
                    Color(0xff8426D6),
                  ],
                ),
              ),
            ),
            inactiveDayStyle: DayStyle(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                color: DialogTheme.of(context).backgroundColor,
              ),
              dayNumStyle: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 16),
            child: TimeRangesTabs(tutorId: widget.tutorId, selectDate: DateTime(year, month, day, 0, 0),),
          ),
        )
      ],
    );
  }

}

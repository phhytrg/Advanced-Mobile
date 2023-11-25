import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lettutor/core/commom-widgets/async_value_widget.dart';
import 'package:lettutor/core/utils/date_untils.dart';

import '../../../../schedule/domain/tutor_schedule/tutor_schedule_response.dart';
import 'tutor_schedule_controller.dart';

class TimeRangesTabs extends ConsumerStatefulWidget {
  const TimeRangesTabs(
      {super.key, required this.tutorId, required this.selectDate});

  final String tutorId;
  final DateTime selectDate;

  @override
  ConsumerState<TimeRangesTabs> createState() => _TimeRangesTabsState();
}

class _TimeRangesTabsState extends ConsumerState<TimeRangesTabs>
    with TickerProviderStateMixin {
  late final TabController _tabController;
  late AsyncValue<List<ScheduleOfTutor>?> schedules;

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 4,
      vsync: this,
      initialIndex: 0,
    );
  }

  var selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    schedules = ref.watch(tutorScheduleControllerProvider(widget.tutorId, 0));
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          TabBar(
            tabs: const [
              Tab(text: "Morning"),
              Tab(text: "Afternoon"),
              Tab(text: "Evening"),
              Tab(text: "Night"),
            ],
            controller: _tabController,
            onTap: (index) {
              setState(() {
                selectedTabIndex = index;
                _tabController.animateTo(index);
              });
            },
          ),
          AsyncValueWidget(
            value: schedules,
            data: (schedules) {
              schedules ??= [];
              schedules = schedules
                  .where((element) => MyDateUtils.isSameDay(
                      DateTime.fromMillisecondsSinceEpoch(
                          element.startTimestamp!),
                      widget.selectDate))
                  .toList();
              Map<String, List<ScheduleOfTutor>> periods = {};
              for (var schedule in schedules) {
                String period = MyDateUtils.getPeriod(schedule.startTimestamp!);
                if (!periods.containsKey(period)) {
                  periods[period] = [];
                }
                if (periods.containsKey(period)) {
                  periods[period]!.add(schedule);
                }
              }
              periods.forEach((key, value) {
                value.sort(
                    (a, b) => a.startTimestamp!.compareTo(b.startTimestamp!));
              });

              return IndexedStack(
                index: selectedTabIndex,
                children: [
                  Visibility(
                    maintainState: true,
                    visible: selectedTabIndex == 0,
                    child: periods['Morning'] == null
                        ? Container()
                        : Wrap(
                            children: [
                              for (var scheduler in periods['Morning']!)
                                ScheduleItem(
                                    startTime: scheduler.endTimestamp != null
                                        ? DateTime.fromMillisecondsSinceEpoch(
                                            scheduler.startTimestamp!)
                                        : null,
                                    endTime: scheduler.endTimestamp != null
                                        ? DateTime.fromMillisecondsSinceEpoch(
                                            scheduler.endTimestamp!)
                                        : null,
                                    isBooked: scheduler.isBooked!)
                            ],
                          ),
                  ),
                  Visibility(
                    maintainState: true,
                    visible: selectedTabIndex == 1,
                    child: periods['Afternoon'] == null
                        ? Container()
                        : Wrap(
                            children: [
                              for (var scheduler in periods['Afternoon']!)
                                ScheduleItem(
                                    startTime: scheduler.endTimestamp != null
                                        ? DateTime.fromMillisecondsSinceEpoch(
                                            scheduler.startTimestamp!)
                                        : null,
                                    endTime: scheduler.endTimestamp != null
                                        ? DateTime.fromMillisecondsSinceEpoch(
                                            scheduler.endTimestamp!)
                                        : null,
                                    isBooked: scheduler.isBooked!)
                            ],
                          ),
                  ),
                  Visibility(
                    maintainState: true,
                    visible: selectedTabIndex == 2,
                    child: periods['Evening'] == null
                        ? Container()
                        : Wrap(
                            children: [
                              for (var scheduler in periods['Evening']!)
                                ScheduleItem(
                                    startTime: scheduler.endTimestamp != null
                                        ? DateTime.fromMillisecondsSinceEpoch(
                                            scheduler.startTimestamp!)
                                        : null,
                                    endTime: scheduler.endTimestamp != null
                                        ? DateTime.fromMillisecondsSinceEpoch(
                                            scheduler.endTimestamp!)
                                        : null,
                                    isBooked: scheduler.isBooked!)
                            ],
                          ),
                  ),
                  Visibility(
                    maintainState: true,
                    visible: selectedTabIndex == 3,
                    child: periods['Night'] == null
                        ? Container()
                        : Wrap(
                            children: [
                              for (var scheduler in periods['Night']!)
                                ScheduleItem(
                                    startTime: scheduler.endTimestamp != null
                                        ? DateTime.fromMillisecondsSinceEpoch(
                                            scheduler.startTimestamp!)
                                        : null,
                                    endTime: scheduler.endTimestamp != null
                                        ? DateTime.fromMillisecondsSinceEpoch(
                                            scheduler.endTimestamp!)
                                        : null,
                                    isBooked: scheduler.isBooked!)
                            ],
                          ),
                  )
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class ScheduleItem extends StatelessWidget {
  const ScheduleItem(
      {super.key,
      required this.startTime,
      required this.endTime,
      required this.isBooked});

  final DateTime? startTime;
  final DateTime? endTime;
  final bool isBooked;

  @override
  Widget build(BuildContext context) {
    final isButtonDisabled =
        DateTime.now().isAfter(startTime!.subtract(const Duration(hours: 2)));

    return Container(
        margin: const EdgeInsets.all(8),
        width: 100,
        height: 110,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 2,
              offset: const Offset(0, 2),
            ),
          ],
          color: isBooked ? Colors.green.shade50 : Colors.white,
          // border: Border.all(color: Colors.grey.shade300),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            startTime != null
                ? Text(MyDateUtils.getHourMinute(startTime!))
                : Text(""),
            endTime != null
                ? Text(MyDateUtils.getHourMinute(endTime!))
                : Text(""),
            const SizedBox(
              height: 8,
            ),
            isBooked
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      "Booked",
                      style: TextStyle(
                          color: Colors.green.shade800,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                : FilledButton(
                    onPressed: isButtonDisabled ? null : () {},
                    style: ButtonStyle(
                      backgroundColor: isButtonDisabled
                          ? MaterialStateProperty.all(Colors.grey.shade300)
                          : MaterialStateProperty.all(Colors.blue.shade500),
                    ),
                    child: const Text("Book"),
                  )
          ],
        ));
  }
}

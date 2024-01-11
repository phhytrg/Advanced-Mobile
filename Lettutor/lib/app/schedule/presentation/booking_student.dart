import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lettutor/app/schedule/domain/booking_list_reponse/booking_list_response.dart';
import 'package:lettutor/app/tutors/service/tutors_service.dart';
import 'package:lettutor/core/commom-widgets/async_value_widget.dart';
import 'package:lettutor/core/utils/date_untils.dart';

import '../../../../core/commom-widgets/button_widget.dart';
import '../../../../core/commom-widgets/page_header.dart';
import '../../../../core/commom-widgets/tutor_mini_item.dart';
import '../../../core/constant.dart';
import 'controller/booking_controller.dart';

class BookingStudentPage extends ConsumerStatefulWidget {
  const BookingStudentPage({super.key});

  @override
  ConsumerState<BookingStudentPage> createState() => _BookingStudentPageState();
}

class _BookingStudentPageState extends ConsumerState<BookingStudentPage> {
  late final ScrollController _scrollController;


  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        if (_scrollController.position.pixels != 0) {
          ref.read(bookingControllerProvider.notifier).getMoreBookingList();
        }
      }
    });
  }


  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        child: Column(
          children: [
            const PageHeader(
              svgIconPath: 'icons/calendar-check.svg',
              pageDescription: sampleText,
              pageName: 'Schedule',
            ),
            const SizedBox(
              height: 32,
            ),
            _buildLatestBook(context),
            const SizedBox(
              height: 32,
            ),
            BookingListWidget(),
          ],
        ),
      ),
    );
  }

  Widget _buildLatestBook(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Latest Book',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w900),
        ),
        SizedBox(
          height: 16,
        ),
        Table(
          columnWidths: const {
            0: FlexColumnWidth(1),
            1: FlexColumnWidth(3),
          },
          border: TableBorder.all(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(8),
          ),
          children: [
            TableRow(children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(8)),
                ),
                padding: const EdgeInsets.all(16.0),
                child: Text('Name'),
              ),
              Table(
                  defaultColumnWidth: IntrinsicColumnWidth(),
                  border: TableBorder.symmetric(
                    inside: BorderSide(
                      color: Colors.black12,
                    ),
                  ),
                  children: [
                    TableRow(children: [
                      const Padding(padding: EdgeInsets.all(16.0), child: Text('sample.pdf')),
                      Container(
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: const BorderRadius.only(topLeft: Radius.circular(8)),
                          ),
                          child: const Text('Page')),
                      Padding(padding: EdgeInsets.all(16.0), child: Text('0')),
                    ]),
                  ]),
            ]),
            TableRow(
              children: [
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(8)),
                  ),
                  child: Text('Description'),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(''),
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}

class BookingListWidget extends ConsumerWidget {
  const BookingListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookingList = ref.watch(bookingControllerProvider);

    return AsyncValueWidget<BookingList?>(
      value: bookingList,
      data: (bookingList) {
        if (bookingList != null) {
          final tempList = [...bookingList.rows!];
          final map = <int, List<BookingData>>{};
          for (int i = 0; i < tempList.length; i++) {
            var booking = tempList[i];
            map[i] = [booking];
            if (i == tempList.length - 1) {
              break;
            }
            for (int j = i + 1; j < tempList.length; j++) {
              if (j >= tempList.length) {
                break;
              }
              final nextBooking = tempList[j];
              if (booking.scheduleDetailInfo!.scheduleInfo!.tutorId ==
                  nextBooking.scheduleDetailInfo!.scheduleInfo!.tutorId) {
                if (booking.scheduleDetailInfo!.endPeriodTimestamp!.toInt() + 5 * 60 * 1000 ==
                    nextBooking.scheduleDetailInfo!.startPeriodTimestamp!.toInt()) {
                  map[i]!.add(nextBooking);
                  j--;
                  tempList.remove(booking);
                  booking = nextBooking;
                }
              } else {
                break;
              }
            }
          }
          return ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              for (int i = 0; i < map.length; i++)
                BookingItem(
                  bookingList: map[i]!,
                ),
            ],
          );
        }
        return const Text("No data");
      },
    );
  }
}

class BookingItem extends ConsumerStatefulWidget {
  const BookingItem({super.key, required this.bookingList});

  final List<BookingData> bookingList;

  // final BookingData bookingData;

  @override
  ConsumerState<BookingItem> createState() => _BookingItemState();
}

class _BookingItemState extends ConsumerState<BookingItem> {
  late final TextEditingController dropdownMenuController;

  @override
  void initState() {
    super.initState();
    dropdownMenuController = TextEditingController();
  }

  @override
  void dispose() {
    dropdownMenuController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _buildBookingBody(context);
  }

  Widget _buildCancelBookingButton(BuildContext context, BookingData bookingData) {
    return OutlinedButton(
        onPressed: DateTime.now().millisecondsSinceEpoch + 3600000000 <
                bookingData.scheduleDetailInfo!.startPeriodTimestamp!.toInt()
            ? null
            : () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Align(
                          alignment: Alignment.center,
                          child: Text('Cancel booking'),
                        ),
                        surfaceTintColor: Colors.white,
                        content: SizedBox(
                          width: 400,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TutorMiniItem(
                                  tutorName: bookingData.scheduleDetailInfo!.scheduleInfo!.tutorInfo!.name!,
                                  tutorCountry: bookingData.scheduleDetailInfo!.scheduleInfo!.tutorInfo!.country!,
                                  tutorAvatar: bookingData.scheduleDetailInfo!.scheduleInfo!.tutorInfo!.avatar!),
                              const SizedBox(
                                height: 16,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Lesson time: ',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(MyDateUtils.getWeekDayMonthYear(DateTime.fromMillisecondsSinceEpoch(
                                      bookingData.scheduleDetailInfo!.startPeriodTimestamp!))),
                                ],
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              DropdownMenu(
                                dropdownMenuEntries: const [
                                  DropdownMenuEntry(
                                    value: 'reschedule',
                                    label: 'Reschedule at another time',
                                  ),
                                  DropdownMenuEntry(
                                    value: 'busy',
                                    label: 'Busy at that time',
                                  ),
                                  DropdownMenuEntry(value: 'asked', label: 'Asked by tutor'),
                                  DropdownMenuEntry(value: 'other', label: 'Other'),
                                ],
                                controller: dropdownMenuController,
                                hintText: 'Select reason',
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              const TextField(
                                maxLines: 5,
                                decoration: InputDecoration(
                                  hintText: 'Reason',
                                  border: OutlineInputBorder(),
                                ),
                              )
                            ],
                          ),
                        ),
                        actions: [
                          OutlinedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('No')),
                          FilledButton(
                              onPressed: () async {
                                await ref
                                    .read(tutorServiceProvider)
                                    .cancelBooking(bookingData.id!, dropdownMenuController.text);
                                await ref.watch(bookingControllerProvider.notifier).getBookingList();
                                if(context.mounted){
                                  Navigator.of(context).pop();
                                }
                              },
                              child: const Text('Yes')),
                        ],
                      );
                    });
              },
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.red,
          side: const BorderSide(color: Colors.red),
        ),
        child: const Row(
          children: [
            Icon(Icons.cancel),
            Text('Cancel'),
          ],
        ));
  }

  Widget _buildLessonLine(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          widget.bookingList.length != 1
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                          '${MyDateUtils.getHourMinute(DateTime.fromMillisecondsSinceEpoch(widget.bookingList[0].scheduleDetailInfo!.startPeriodTimestamp!))} '
                          '-'
                          ' ${MyDateUtils.getHourMinute(DateTime.fromMillisecondsSinceEpoch(widget.bookingList[widget.bookingList.length - 1].scheduleDetailInfo!.endPeriodTimestamp!))}',
                          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                fontSize: 16,
                              )),
                    ),
                    for (int i = 0; i < widget.bookingList.length; i++)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(
                                'Lesson ${i + 1}: ${MyDateUtils.getHourMinute(DateTime.fromMillisecondsSinceEpoch(widget.bookingList[i].scheduleDetailInfo!.startPeriodTimestamp!))} '
                                '-'
                                ' ${MyDateUtils.getHourMinute(DateTime.fromMillisecondsSinceEpoch(widget.bookingList[i].scheduleDetailInfo!.endPeriodTimestamp!))}'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: _buildCancelBookingButton(context, widget.bookingList[i]),
                          ),
                        ],
                      ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                          '${MyDateUtils.getHourMinute(DateTime.fromMillisecondsSinceEpoch(widget.bookingList[0].scheduleDetailInfo!.startPeriodTimestamp!))} '
                          '-'
                          ' ${MyDateUtils.getHourMinute(DateTime.fromMillisecondsSinceEpoch(widget.bookingList[0].scheduleDetailInfo!.endPeriodTimestamp!))}'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: _buildCancelBookingButton(context, widget.bookingList[0]),
                    ),
                  ],
                ),
          Card(
            color: Colors.grey.shade100,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: ListTileTheme(
              contentPadding: EdgeInsets.all(0),
              dense: true,
              child: ExpansionTile(
                shape: Border(),
                tilePadding: EdgeInsets.symmetric(horizontal: 8),
                controlAffinity: ListTileControlAffinity.leading,
                initiallyExpanded: true,
                clipBehavior: Clip.antiAlias,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('Request for lesson'), MyTextButton(child: Text('Edit Request'))],
                ),
                expandedAlignment: Alignment.centerLeft,
                children: [
                  Container(
                    color: Colors.white,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: widget.bookingList[0].studentRequest == null
                        ? Text(
                            'Currently there are no requests for this class. '
                            'Please write down any requests for the teacher.',
                            style: TextStyle(
                              color: Colors.grey.shade400,
                            ),
                          )
                        : Text(widget.bookingList[0].studentRequest!),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: OutlinedButton(
                onPressed: () {},
                child: const Text('Go to meeting'),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBookingBody(BuildContext context) {
    return LayoutBuilder(builder: (context, constrainst) {
      if (constrainst.maxWidth <= mobileWidth * 2) {
        return Container(
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.grey.shade200,
          ),
          child: Column(
            children: [
              Container(
                child: _buildBookingItemHeader(context),
                width: double.infinity,
              ),
              _buildLessonLine(context),
            ],
          ),
        );
      } else {
        return Container(
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.grey.shade200,
          ),
          child: Row(
            children: [
              Expanded(child: _buildBookingItemHeader(context)),
              Expanded(child: _buildLessonLine(context)),
            ],
          ),
        );
      }
    });
  }

  Widget _buildBookingItemHeader(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.spaceAround,
      crossAxisAlignment: WrapCrossAlignment.start,
      spacing: 32,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                MyDateUtils.getWeekDayMonthYear(DateTime.fromMillisecondsSinceEpoch(
                    widget.bookingList[0].scheduleDetailInfo!.startPeriodTimestamp!)),
                style: Theme.of(context).textTheme.titleLarge!.copyWith(),
              ),
              Text('${widget.bookingList.length} ${widget.bookingList.length <= 1 ? 'lesson' : 'lessons'}'),
            ],
          ),
        ),
        TutorMiniItem(
            tutorName: widget.bookingList[0].scheduleDetailInfo!.scheduleInfo!.tutorInfo!.name!,
            tutorCountry: widget.bookingList[0].scheduleDetailInfo!.scheduleInfo!.tutorInfo!.country!,
            tutorAvatar: widget.bookingList[0].scheduleDetailInfo!.scheduleInfo!.tutorInfo!.avatar!),
      ],
    );
  }
}

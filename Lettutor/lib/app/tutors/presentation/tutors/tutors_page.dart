import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/app/tutors/presentation/tutors/tutor_item.dart';
import 'package:lettutor/app/tutors/presentation/tutors/controller/tutors_controller.dart';
import 'package:lettutor/core/commom-widgets/async_value_widget.dart';
import '../../../../core/commom-widgets/appbar.dart';
import '../../../../core/commom-widgets/drawer.dart';
import '../../../../core/constant.dart';
import '../../domain/payload/search_payload.dart';
import '../../domain/response/tutor_list.dart';
import '../upcoming_lesson.dart';

class TutorsPage extends ConsumerStatefulWidget {
  const TutorsPage({super.key});

  @override
  ConsumerState<TutorsPage> createState() {
    return _TutorsPageState();
  }
}

class _TutorsPageState extends ConsumerState<TutorsPage> {
  final List<String> specialties = [];
  final textSearchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          UpcomingLesson(),
          SizedBox(
            height: 24,
          ),
          _buildTutorsSearchBox(),
          SizedBox(
            height: 24,
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 32),
            child: Text(
              'Recommend Tutors',
              style: Theme
                  .of(context)
                  .textTheme
                  .titleLarge,
            ),
          ),
          Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
                final AsyncValue<TutorList?> tutorsState = ref.watch(tutorsControllerProvider);
                return AsyncValueWidget<TutorList?>(
                  value: tutorsState,
                  data: (tutorsList) {
                    return Container(
                      margin: const EdgeInsets.only(left: 32, right: 32),
                      child: Wrap(
                        alignment: WrapAlignment.start,
                        spacing: 16,
                        runSpacing: 12,
                        children: [
                          for (var tutor in tutorsList!.rows!)
                            TutorItem(
                              tutor: tutor,
                            )
                        ],
                      ),
                    );
                  },
                );
              }),
          const SizedBox(
            height: 108,
          ),
        ],
      ),

    );
  }

  Widget _buildTutorsSearchBox() {
    return Container(
      margin: EdgeInsets.only(left: 32, right: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Find a tutor',
            style: Theme
                .of(context)
                .textTheme
                .titleLarge
                ?.copyWith(
              color: Colors.black,
              fontFamily: GoogleFonts
                  .poppins(fontWeight: FontWeight.w700)
                  .fontFamily,
            ),
          ),
          TextField(
            decoration: const InputDecoration(
              hintText: 'Enter tutor name..',
            ),
            style: Theme
                .of(context)
                .textTheme
                .bodySmall,
            controller: textSearchController,
            onSubmitted: (value) {
              ref
                  .watch(tutorsControllerProvider.notifier)
                  .searchTutorsByFilters(SearchPayload(
                page: "1",
                perPage: 9,
                search: textSearchController.text,
                filters: Filters(
                  specialties: specialties,
                )
              ));
            }
          ),
          const SizedBox(
            height: 8,
          ),
          TextField(
            decoration: const InputDecoration(
              hintText: 'Enter tutor native..',
            ),
            style: Theme
                .of(context)
                .textTheme
                .bodySmall,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            'Select available tutoring time:',
            style: Theme
                .of(context)
                .textTheme
                .titleMedium!
                .copyWith(
              color: Colors.black,
              fontFamily: GoogleFonts
                  .poppins(fontWeight: FontWeight.w600)
                  .fontFamily,
            ),
          ),
          TextField(
            decoration: const InputDecoration(
              hintText: 'This field for date picker',
            ),
            style: Theme
                .of(context)
                .textTheme
                .bodySmall!,
          ),
          const SizedBox(
            height: 8,
          ),
          TextField(
            decoration: const InputDecoration(
              hintText: 'This field for start time and end time',
            ),
            style: Theme
                .of(context)
                .textTheme
                .bodySmall,
          ),
          Container(
            margin: EdgeInsets.only(top: 16),
            alignment: Alignment.centerLeft,
            child: Wrap(
              alignment: WrapAlignment.start,
              spacing: 16,
              runSpacing: 12,
              children: [
                FilterButton(buttonKey: 'english-for-kids',
                  text: "English for kids",
                  specialities: specialties,
                  onPressed: (){
                    setState(() {
                      if (specialties.contains('english-for-kids')) {
                        specialties.remove('english-for-kids');
                      } else {
                        specialties.add('english-for-kids');
                      }
                    });
                    // ref
                    //   .watch(tutorsViewmodelProvider.notifier)
                    //   .searchTutorsByFilters(SearchPayload(
                    //     specialties: specialties,
                    //   ));
                    }
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (specialties.contains('english-for-business')) {
                          specialties.remove('english-for-business');
                        } else {
                          specialties.add('english-for-business');
                        }
                        // ref.read(tutorsViewmodelProvider.notifier)
                        //     .searchTutorsByFilters(SearchPayload(
                        //   specialties: specialties,
                        // ));
                        // ref.read(tutorsViewmodelProvider.notifier).getTutorsWithPagination(9, 1);
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor:
                      specialties.contains('english-for-business')
                          ? Colors.blue
                          : Colors.grey,
                    ),
                    child: Text('English for Business')),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (specialties.contains('conversational')) {
                          specialties.remove('conversational');
                        } else {
                          specialties.add('conversational');
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: specialties.contains('conversational')
                          ? Colors.blue
                          : Colors.grey,
                    ),
                    child: Text('Conversational')),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (specialties.contains('starters')) {
                          specialties.remove('starters');
                        } else {
                          specialties.add('starters');
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: specialties.contains('starters')
                          ? Colors.blue
                          : Colors.grey,
                    ),
                    child: Text('STARTERS')),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (specialties.contains('movers')) {
                          specialties.remove('movers');
                        } else {
                          specialties.add('movers');
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: specialties.contains('movers')
                          ? Colors.blue
                          : Colors.grey,
                    ),
                    child: Text('MOVERS')),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (specialties.contains('flyers')) {
                          specialties.remove('flyers');
                        } else {
                          specialties.add('flyers');
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: specialties.contains('flyers')
                          ? Colors.blue
                          : Colors.grey,
                    ),
                    child: Text('FLYERS')),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          OutlinedButton(
            onPressed: () {
              setState(() {
                specialties.clear();
              });
              ref.read(tutorsControllerProvider.notifier).getTutorsWithPagination(9, "1");
            },
            child: const Text('Reset filters'),
          ),
        ],
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  final String buttonKey;
  final String text;

  const FilterButton({super.key,
    required this.buttonKey,
    required this.text,
    required this.specialities,
    required this.onPressed
  });

  final List<String> specialities;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor:
        specialities.contains(buttonKey) ? Colors.blue : Colors.grey,
      ),
      child: Text(text)
    );
  }
}

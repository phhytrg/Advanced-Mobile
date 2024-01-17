import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/app/tutors/presentation/tutors/tutor_item.dart';
import 'package:lettutor/app/tutors/presentation/tutors/controller/tutors_controller.dart';
import 'package:lettutor/core/common-widgets/async_value_widget.dart';
import 'package:lettutor/core/constant.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import '../../domain/payload/search_payload.dart';
import '../../domain/response/tutor_list.dart';
import '../upcoming_lesson.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TutorsPage extends ConsumerStatefulWidget {
  const TutorsPage({super.key});

  @override
  ConsumerState<TutorsPage> createState() {
    return _TutorsPageState();
  }
}

class _TutorsPageState extends ConsumerState<TutorsPage> {
  late final ScrollController scrollController;
  final List<String> specialties = [];
  final textSearchController = TextEditingController();
  final MultiSelectController nationalitiesController = MultiSelectController();
  final List<ValueItem> nationalities = [
    const ValueItem(label: 'Foreign Tutor', value: 'foreign'),
    const ValueItem(label: 'Vietnamese Tutor', value: 'vietnam'),
    const ValueItem(label: 'Native English tutor', value: 'native'),
  ];

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        ref.read(tutorsControllerProvider.notifier).getMoreTutors(SearchPayload(
              filters: Filters(
                specialties: specialties,
                nationality: nationalitiesController.selectedOptions.isNotEmpty
                    ? Nationality(
                        isNative: nationalitiesController.selectedOptions
                            .contains(nationalities.where((element) => element.value == 'native').first),
                        isVietnamese: nationalitiesController.selectedOptions
                            .contains(nationalities.where((element) => element.value == 'vietnam').first),
                      )
                    : null,
              ),
              search: textSearchController.text,
            ));
      }
    });
  }

  void handleOnSearchChange() {
    ref.watch(tutorsControllerProvider.notifier).searchTutorsByFilters(SearchPayload(
          perPage: 9,
          search: textSearchController.text,
          filters: Filters(
            specialties: specialties,
            nationality: nationalitiesController.selectedOptions.isNotEmpty
                ? Nationality(
                    isNative: nationalitiesController.selectedOptions
                        .contains(nationalities.where((element) => element.value == 'native').first),
                    isVietnamese: nationalitiesController.selectedOptions
                        .contains(nationalities.where((element) => element.value == 'vietnam').first),
                  )
                : null,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    final txt = AppLocalizations.of(context)!;
    final width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      controller: scrollController,
      child: Column(
        children: [
          const UpcomingLesson(),
          const SizedBox(
            height: 24,
          ),
          _buildTutorsSearchBox(),
          const SizedBox(
            height: 24,
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(left: 32),
            child: Text(
              txt.recommendTutors,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
            final AsyncValue<TutorList?> tutorsState = ref.watch(tutorsControllerProvider);
            return AsyncValueWidget<TutorList?>(
              value: tutorsState,
              data: (tutorsList) {
                return tutorsList != null && tutorsList.count > 0
                    ? Container(
                        margin:  EdgeInsets.symmetric(horizontal: width > mobileWidth ? 32 : 8),
                        child: Wrap(
                          alignment: WrapAlignment.start,
                          spacing: 16,
                          runSpacing: 12,
                          children: [
                            for (var tutor in tutorsList.rows!)
                              TutorItem(
                                tutor: tutor,
                              )
                          ],
                        ),
                      )
                    : Container(
                        margin: const EdgeInsets.only(left: 32, right: 32),
                        child: const Column(
                          children: [
                            SizedBox(
                              height: 32,
                            ),
                            Text(
                              'No tutor found',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              'Sorry we can\'t found any tutor matched your need. Try different keywords or remove search filters.',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: 32,
                            ),
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
    final txt = AppLocalizations.of(context)!;
    return Container(
      margin: const EdgeInsets.only(left: 32, right: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            txt.findATutor,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.black,
                  fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w700).fontFamily,
                ),
          ),
          TextField(
              decoration: InputDecoration(
                hintText: '${txt.enterTutorName}..',
              ),
              style: Theme.of(context).textTheme.bodySmall,
              controller: textSearchController,
              onSubmitted: (value) {
                ref.watch(tutorsControllerProvider.notifier).searchTutorsByFilters(SearchPayload(
                    page: 1,
                    perPage: 9,
                    search: textSearchController.text,
                    filters: Filters(
                      specialties: specialties,
                    )));
              }),
          const SizedBox(
            height: 8,
          ),
          MultiSelectDropDown(
            showClearIcon: true,
            onOptionSelected: (options) {
              ref.watch(tutorsControllerProvider.notifier).searchTutorsByFilters(SearchPayload(
                    perPage: 9,
                    search: textSearchController.text,
                    filters: Filters(
                      specialties: specialties,
                      nationality: nationalitiesController.selectedOptions.isNotEmpty
                          ? Nationality(
                              isNative:
                                  options.contains(nationalities.where((element) => element.value == 'native').first),
                              isVietnamese:
                                  options.contains(nationalities.where((element) => element.value == 'vietnam').first),
                            )
                          : null,
                    ),
                  ));
            },
            options: nationalities,
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
            borderRadius: 16,
            optionTextStyle: Theme.of(context).textTheme.bodySmall!,
            selectedOptionIcon: const Icon(Icons.check),
            selectedOptionBackgroundColor: Colors.blue.shade50,
            padding: EdgeInsets.zero,
            hint: txt.selectTutorNationality,
            controller: nationalitiesController,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            '${txt.selectAvailableTime}:',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Colors.black,
                  fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w600).fontFamily,
                ),
          ),
          TextField(
            decoration: const InputDecoration(
              hintText: 'This field for date picker',
            ),
            style: Theme.of(context).textTheme.bodySmall!,
          ),
          const SizedBox(
            height: 8,
          ),
          TextField(
            decoration: const InputDecoration(
              hintText: 'This field for start time and end time',
            ),
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Container(
            margin: EdgeInsets.only(top: 16),
            alignment: Alignment.centerLeft,
            child: Wrap(
              alignment: WrapAlignment.start,
              spacing: 16,
              runSpacing: 12,
              children: [
                _buildFilterSpecialty('english-for-kids', txt.englishForKids),
                _buildFilterSpecialty('business-english', txt.englishForBusiness),
                _buildFilterSpecialty('conversational', txt.conversational),
                _buildFilterSpecialty('starters', 'STARTERS'),
                _buildFilterSpecialty('movers', 'MOVERS'),
                _buildFilterSpecialty('flyers', 'FLYERS'),
                _buildFilterSpecialty('ket', 'KET'),
                _buildFilterSpecialty('pet', 'PET'),
                _buildFilterSpecialty('ielts', 'IELTS'),
                _buildFilterSpecialty('toeic', 'TOEIC'),
                _buildFilterSpecialty('toefl', 'TOEFL'),
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
              ref.read(tutorsControllerProvider.notifier).getTutorsWithPagination(9, 1);
            },
            child: const Text('Reset filters'),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterSpecialty(String value, String label) {
    return ElevatedButton(
        onPressed: () {
          setState(() {
            if (specialties.contains(value)) {
              specialties.remove(value);
            } else {
              specialties.add(value);
            }
          });
          handleOnSearchChange();
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: specialties.contains(value) ? Colors.blue : Colors.grey,
        ),
        child: Text(label));
  }
}

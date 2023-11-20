import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lettutor/app/tutors/data/tutor_repository.dart';
import 'package:lettutor/app/tutors/domain/tutor.dart';
import 'package:lettutor/app/tutors/domain/tutor_utils.dart';
import 'package:lettutor/core/constant.dart';

import '../../../core/commom-widgets/highligh_text.dart';
import '../service/tutors_service.dart';

class TutorItem extends StatelessWidget {
  final Tutor tutor;
  const TutorItem({super.key, required this.tutor});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed('/tutor');
      },
      child: Container(
        constraints: BoxConstraints(
          maxWidth: 3.5 * 125,
          minWidth: 3.5 * 50,
        ),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.black12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Center(
                      child: CircleAvatar(
                        minRadius: 40,
                        child: tutor.avatar != null ? ClipOval(
                          child: Image.network(
                            tutor.avatar!,
                            fit: BoxFit.cover,
                            width: 80,
                            height: 80,
                            errorBuilder: (context, error, stackTrace) => const Icon(Icons.person),
                          ),
                        ) : const Icon(Icons.person),
                      ),
                    ),
                  ],
                ),
                Consumer(
                  builder: (BuildContext context, WidgetRef ref, Widget? child) {

                    return Positioned(
                        right: 0,
                        top: 0,
                        child: Consumer(
                          builder: (BuildContext context, WidgetRef ref, Widget? child) {
                            var favoriteTutors = ref.watch(favoriteTutorListProvider);
                            bool isContain = false;
                            for(var favoriteTutor in favoriteTutors){
                              if(favoriteTutor.secondId == tutor.id){
                                isContain = true;
                                break;
                              }
                            }
                            return isContain
                              ? InkWell(
                                child: const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                ),
                                onTap: () {
                                  ref
                                      .read(tutorServiceProvider)
                                      .updateTutorInFavoriteList(tutor.id!);
                                })
                              : InkWell(
                                child: const Icon(
                                  Icons.favorite_border,
                                  color: Colors.red,
                                ),
                                onTap: () {
                                  ref
                                      .read(tutorServiceProvider)
                                      .updateTutorInFavoriteList(tutor.id!);
                                },
                                );
                          },
                        ));
                  },
                ),
              ],
            ),
            Text(
              tutor.name!,
              textAlign: TextAlign.start,
            ),
            tutor.country != null ? Wrap(
              children: [
                Flag.fromString(
                  tutor.country!,
                  height: 20,
                  width: 20 * 4 / 3,
                  fit: BoxFit.scaleDown,
                  borderRadius: 8,
                ),
                  tutor.country != null
                      ? Text(tutor.country!.length <= 2
                        ? Countries.alpha2ToCountryName(tutor.country!)
                        : tutor.country!)
                      : const Text(''),
              ],
            ) : const Text(''),

            Wrap(
              children: [
                Icon(Icons.star),
                Icon(Icons.star),
                Icon(Icons.star),
                Icon(Icons.star),
                Icon(Icons.star),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                if(tutor.specialties != null)
                  for(var specialty in TutorUtils.extractSpecialties(tutor.specialties!)) HighlightText(text: specialty),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              tutor.bio != null ? tutor.bio! : 'Nothing to show',
              textAlign: TextAlign.justify,
              overflow: TextOverflow.ellipsis,
              maxLines: 5,
            ),
            const SizedBox(
              height: 24,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: FittedBox(
                child: OutlinedButton(
                    onPressed: () {},
                    child: const Row(
                      children: [
                        Icon(Icons.schedule_send),
                        SizedBox(
                          width: 8,
                        ),
                        Text('Book')
                      ],
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}

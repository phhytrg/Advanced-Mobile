import 'dart:math';

import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lettutor/app/tutors/data/tutor_repository.dart';
import 'package:lettutor/app/tutors/domain/tutor_utils.dart';
import 'package:lettutor/core/constant.dart';

import '../../../../core/commom-widgets/highligh_text.dart';
import '../../../../core/route/router.dart';
import '../../domain/response/tutor.dart';
import '../../service/tutors_service.dart';

class TutorItem extends StatefulWidget {
  final Tutor tutor;

  const TutorItem({super.key, required this.tutor});

  @override
  State<TutorItem> createState() => _TutorItemState();
}

class _TutorItemState extends State<TutorItem> {
  var isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.goNamed(AppRoute.tutor.name, pathParameters: {'id': widget.tutor.id!});
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
                        child: widget.tutor.avatar != null
                            ? ClipOval(
                                child: Image.network(
                                  widget.tutor.avatar!,
                                  fit: BoxFit.cover,
                                  width: 80,
                                  height: 80,
                                  errorBuilder: (context, error, stackTrace) => const Icon(Icons.person),
                                ),
                              )
                            : const Icon(Icons.person),
                      ),
                    ),
                  ],
                ),
                Consumer(
                  builder: (BuildContext context, WidgetRef ref, Widget? child) {
                    return Positioned(
                        right: 0,
                        top: 0,
                        child: Builder(
                          builder: (BuildContext context) {
                            return InkWell(
                                child: Icon(
                                  widget.tutor.isFavoriteTutor == null
                                      ? Icons.favorite_border
                                      : widget.tutor.isFavoriteTutor!
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                  color: Colors.red,
                                ),
                                onTap: () {
                                  setState(() {
                                    widget.tutor.isFavoriteTutor ??= false;
                                    widget.tutor.isFavoriteTutor = !widget.tutor.isFavoriteTutor!;
                                  });
                                  ref.watch(tutorServiceProvider).updateTutorInFavoriteList(widget.tutor.id!);
                                });
                          },
                        ));
                  },
                ),
              ],
            ),
            Text(
              widget.tutor.name!,
              textAlign: TextAlign.start,
            ),
            widget.tutor.country != null
                ? Wrap(
                    children: [
                      Flag.fromString(
                        widget.tutor.country!,
                        height: 20,
                        width: 20 * 4 / 3,
                        fit: BoxFit.scaleDown,
                        borderRadius: 8,
                      ),
                      widget.tutor.country != null
                          ? Text(widget.tutor.country!.length <= 2
                              ? Countries.alpha2ToCountryName(widget.tutor.country!)
                              : widget.tutor.country!)
                          : const Text(''),
                    ],
                  )
                : const Text(''),
            widget.tutor.rating != null
                ? Wrap(
                    children: [
                      Icon(Icons.star,
                          color:
                              widget.tutor.rating != null && widget.tutor.rating! >= 0 ? Colors.yellow : Colors.grey),
                      Icon(Icons.star,
                          color:
                              widget.tutor.rating != null && widget.tutor.rating! >= 1 ? Colors.yellow : Colors.grey),
                      Icon(Icons.star,
                          color:
                              widget.tutor.rating != null && widget.tutor.rating! >= 2 ? Colors.yellow : Colors.grey),
                      Icon(Icons.star,
                          color:
                              widget.tutor.rating != null && widget.tutor.rating! >= 3 ? Colors.yellow : Colors.grey),
                      Icon(Icons.star,
                          color:
                              widget.tutor.rating != null && widget.tutor.rating! >= 4 ? Colors.yellow : Colors.grey),
                    ],
                  )
                : const Text(
                    'No review yet',
                    style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
                  ),
            const SizedBox(
              height: 16,
            ),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                if (widget.tutor.specialties != null)
                  for (var specialty in TutorUtils.extractSpecialties(widget.tutor.specialties!))
                    HighlightText(text: specialty),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              widget.tutor.bio != null ? widget.tutor.bio! : 'Nothing to show',
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

  @override
  void initState() {
    super.initState();
  }
}

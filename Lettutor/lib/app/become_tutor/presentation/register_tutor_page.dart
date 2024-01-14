import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor/app/user_profile/presentation/controller/user_controller.dart';
import 'package:lettutor/core/commom-widgets/async_value_widget.dart';
import 'package:lettutor/core/constant.dart';

class RegisterTutorPage extends ConsumerStatefulWidget {
  const RegisterTutorPage({super.key});

  @override
  ConsumerState<RegisterTutorPage> createState() => _RegisterTutorPageState();
}

class _RegisterTutorPageState extends ConsumerState<RegisterTutorPage> {
  var currentStep = 0;
  Level? _level = Level.beginner;
  List<Specialty> specialties = [];
  MultipartFile? avatar;
  MultipartFile? videoIntroduction;
  late final TextEditingController tutorNameController;
  late final TextEditingController tutorFromController;
  late final TextEditingController tutorDobController;
  late final TextEditingController tutorInterestController;
  late final TextEditingController tutorEducationController;
  late final TextEditingController tutorExperienceController;
  late final TextEditingController tutorProfessionController;
  late final TextEditingController tutorLanguageController;
  late final TextEditingController tutorWhoTeachController;
  late final TextEditingController tutorIntroductionController;

  @override
  void initState() {
    super.initState();
    tutorNameController = TextEditingController();
    tutorFromController = TextEditingController();
    tutorDobController = TextEditingController();
    tutorInterestController = TextEditingController();
    tutorEducationController = TextEditingController();
    tutorExperienceController = TextEditingController();
    tutorProfessionController = TextEditingController();
    tutorLanguageController = TextEditingController();
    tutorWhoTeachController = TextEditingController();
    tutorIntroductionController = TextEditingController();
  }

  @override
  void dispose() {
    tutorNameController.dispose();
    tutorFromController.dispose();
    tutorDobController.dispose();
    tutorInterestController.dispose();
    tutorEducationController.dispose();
    tutorExperienceController.dispose();
    tutorProfessionController.dispose();
    tutorLanguageController.dispose();
    tutorWhoTeachController.dispose();
    tutorIntroductionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final txt = AppLocalizations.of(context)!;

    return SingleChildScrollView(
      child: Padding(
        padding: width > 600 ? const EdgeInsets.symmetric(horizontal: 100) : const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                drawCircle('1', currentStep >= 0),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  txt.profileComplete,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Expanded(
                  child: Divider(
                    color: Colors.blue,
                    thickness: 0.5,
                  ),
                ),
                drawCircle('2', currentStep >= 1),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  txt.videoIntroduction,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Expanded(
                  child: Divider(
                    color: Colors.blue,
                    thickness: 0.5,
                  ),
                ),
                drawCircle('3', currentStep >= 2),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  txt.approval,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            if (currentStep == 0) buildProfileCompleteSection(),
            if (currentStep == 1) buildVideoIntroductionSection(),
            if (currentStep == 2) buildApprovalSection(),
            currentStep < 2
                ? Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            setState(() {
                              currentStep = currentStep - 0 == 0 ? 0 : currentStep - 1;
                            });
                          },
                          child: Text(txt.back),
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: FilledButton(
                          onPressed: () async {
                            setState(() {
                              currentStep = currentStep + 1;
                            });
                            //   if (currentStep == 1) {
                            //     final data = {
                            //       'name': tutorNameController.text,
                            //       'country': tutorFromController.text,
                            //       'birthday': tutorDobController.text,
                            //       'interests': tutorInterestController.text,
                            //       'education': tutorEducationController.text,
                            //       'experience': tutorExperienceController.text,
                            //       'profession': tutorProfessionController.text,
                            //       'languages': tutorLanguageController.text,
                            //       'whoTeach': tutorWhoTeachController.text,
                            //       'bio': tutorIntroductionController.text,
                            //       'targetStudent': _level.toString(),
                            //       'specialties': specialties.map((e) => e.value).join(','),
                            //       'avatar': avatar,
                            //       'video': videoIntroduction,
                            //       'price': 50000,
                            //     };
                            //     final result = await ref.read(registerTutorProvider(data).future);
                            //     if (result) {
                            //       // setState(() {
                            //       //   currentStep = currentStep + 1;
                            //       // });
                            //     } else {
                            //       // if (mounted) {
                            //       //   ScaffoldMessenger.of(context).showSnackBar(
                            //       //     const SnackBar(
                            //       //       content: Text('Failed to register tutor'),
                            //       //     ),
                            //       //   );
                            //       // }
                            //     }
                            //     setState(() {
                            //       currentStep = currentStep + 1;
                            //     });
                            //     return;
                            //   }
                            //   setState(() {
                            //     currentStep = currentStep + 1;
                            //   });
                          },
                          child: Text(currentStep != 1 ? txt.next : txt.done),
                        ),
                      ),
                    ],
                  )
                : Container(),
            const SizedBox(
              height: 108,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSpecialtyCheckbox(Specialty specialty, String text) {
    return CheckboxListTile(
      value: specialties.contains(specialty),
      title: Text(text),
      onChanged: (value) {
        setState(() {
          if (value == true) {
            specialties.add(specialty);
          } else {
            specialties.remove(specialty);
          }
        });
      },
    );
  }

  Widget buildProfileCompleteSection() {
    final width = MediaQuery.of(context).size.width;
    final txt = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            Image.asset('/images/tutor.png', width: 150),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(txt.setupTutor,
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      )),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(AppLocalizations.of(context)!.setupTutorIntro,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      )),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          children: [
            Text(
              AppLocalizations.of(context)!.basicInfo,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const Divider(),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  InkWell(
                    onTap: () async {
                      FilePickerResult? picked = await FilePicker.platform
                          .pickFiles(type: FileType.custom, allowedExtensions: ['jpg', 'png', 'jpeg']);
                      if (picked != null) {
                        setState(() {
                          avatar = MultipartFile.fromBytes(
                            picked.files.first.bytes!,
                            filename: picked.files.first.name,
                          );
                        });
                      } else {
                        // User canceled the picker
                      }
                    },
                    child: Builder(
                      builder: (BuildContext context) {
                        final userState = ref.watch(userControllerProvider);
                        return AsyncValueWidget(
                          value: userState,
                          data: (user) {
                            return CircleAvatar(
                              backgroundImage: NetworkImage(user.avatar),
                              maxRadius: width > mobileWidth ? 108 : 32,
                              minRadius: width > mobileWidth ? 108 : 32,
                              child: user.avatar == "" ? const Icon(Icons.portrait) : null,
                            );
                          },
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  avatar == null
                      ? Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            AppLocalizations.of(context)!.pleaseUpPhoto,
                            style: TextStyle(fontSize: 12),
                          ),
                        )
                      : Text(avatar!.filename!),
                ],
              ),
            ),
            SizedBox(
              width: width > mobileWidth ? 32 : 16,
            ),
            Expanded(
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!.tutoringName,
                      border: const OutlineInputBorder(),
                    ),
                    controller: tutorNameController,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!.imfrom,
                      border: OutlineInputBorder(),
                    ),
                    controller: tutorFromController,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!.dateOfBirth,
                      border: OutlineInputBorder(),
                    ),
                    controller: tutorDobController,
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        const Text(
          'CV',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          AppLocalizations.of(context)!.studentNeeds,
          style: const TextStyle(fontSize: 14),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            txt.protest,
            style: const TextStyle(fontSize: 14),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        TextFormField(
          decoration: InputDecoration(
            labelText: txt.interests,
            border: OutlineInputBorder(),
          ),
          controller: tutorInterestController,
        ),
        const SizedBox(
          height: 16,
        ),
        TextFormField(
          decoration: InputDecoration(
            labelText: txt.education,
            border: OutlineInputBorder(),
          ),
          controller: tutorEducationController,
        ),
        const SizedBox(
          height: 16,
        ),
        TextFormField(
          decoration: InputDecoration(
            labelText: txt.experience,
            border: OutlineInputBorder(),
          ),
          controller: tutorExperienceController,
        ),
        const SizedBox(
          height: 16,
        ),
        TextFormField(
          decoration: InputDecoration(
            labelText: txt.profession,
            border: OutlineInputBorder(),
          ),
          controller: tutorProfessionController,
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          txt.languageISpeak,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          decoration: InputDecoration(
            labelText: txt.languageISpeak,
            border: OutlineInputBorder(),
          ),
          controller: tutorLanguageController,
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          txt.whoITeach,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          decoration: InputDecoration(
            labelText: txt.whoITeach,
            border: const OutlineInputBorder(),
          ),
          controller: tutorWhoTeachController,
        ),
        const SizedBox(
          height: 16,
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(txt.whyWhoITeach),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(txt.introduction, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          decoration: InputDecoration(
            labelText: txt.introduction,
            border: const OutlineInputBorder(),
          ),
          controller: tutorIntroductionController,
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          children: [
            Expanded(
              child: RadioListTile<Level>(
                title: Text(txt.beginner),
                value: Level.beginner,
                groupValue: _level,
                onChanged: (Level? value) {
                  setState(() {
                    _level = value;
                  });
                },
              ),
            ),
            Expanded(
              child: RadioListTile<Level>(
                title: Text(txt.intermediate),
                value: Level.intermediate,
                groupValue: _level,
                onChanged: (Level? value) {
                  setState(() {
                    _level = value;
                  });
                },
              ),
            ),
            Expanded(
              child: RadioListTile<Level>(
                title: Text(txt.advanced),
                value: Level.advanced,
                groupValue: _level,
                onChanged: (Level? value) {
                  setState(() {
                    _level = value;
                  });
                },
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Text(txt.specialties),
        const SizedBox(
          height: 8,
        ),
        buildSpecialtyCheckbox(Specialty.englishForKids, txt.englishForKids),
        buildSpecialtyCheckbox(Specialty.englishForBusiness, txt.englishForBusiness),
        buildSpecialtyCheckbox(Specialty.conversational, txt.conversational),
        buildSpecialtyCheckbox(Specialty.starters, 'STARTERS'),
        buildSpecialtyCheckbox(Specialty.movers, 'MOVERS'),
        buildSpecialtyCheckbox(Specialty.flyers, 'FLYERS'),
        buildSpecialtyCheckbox(Specialty.ket, 'KET'),
        buildSpecialtyCheckbox(Specialty.pet, 'PET'),
        buildSpecialtyCheckbox(Specialty.ielts, 'IELTS'),
        buildSpecialtyCheckbox(Specialty.toefl, 'TOEFL'),
        buildSpecialtyCheckbox(Specialty.toeic, 'TOEIC'),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }

  Widget drawCircle(String text, bool isDone) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: isDone ? Colors.blue : Colors.white,
        borderRadius: BorderRadius.circular(360),
        border: isDone ? null : Border.all(color: Colors.blue, width: 2),
      ),
      child: Align(
          alignment: Alignment.center,
          child:
              Text(text, style: isDone ? const TextStyle(color: Colors.white) : const TextStyle(color: Colors.black))),
    );
  }

  Widget buildVideoIntroductionSection() {
    final width = MediaQuery.of(context).size.width;
    final txt = AppLocalizations.of(context)!;

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(txt.introduceYourself, style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w500)),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(txt.whyIntroduceYourself),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 108,
        ),
        Align(
          alignment: Alignment.center,
          child: OutlinedButton(
            onPressed: () async {
              FilePickerResult? picked = await FilePicker.platform.pickFiles(type: FileType.video);
              if (picked != null) {
                setState(() {
                  videoIntroduction = MultipartFile.fromBytes(
                    picked.files.first.bytes!,
                    filename: picked.files.first.name,
                  );
                });
              } else {
                // User canceled the picker
              }
            },
            child: Text(videoIntroduction == null ? txt.chooseVideo : videoIntroduction!.filename!),
          ),
        ),
        const SizedBox(
          height: 108,
        ),
      ],
    );
  }

  Widget buildApprovalSection() {
    final txt = AppLocalizations.of(context)!;
    return Column(
      children: [
        const SizedBox(
          height: 108,
        ),
        Align(
            alignment: Alignment.center,
            child: Text(txt.waitingForApproval, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500))),
        const SizedBox(
          height: 108,
        ),
      ],
    );
  }
}

enum Level { beginner, intermediate, advanced }

enum Specialty {
  englishForKids('english-for-kids'),
  englishForBusiness('english-for-business'),
  conversational('conversational'),
  starters('starters'),
  movers('movers'),
  flyers('flyers'),
  ket('ket'),
  pet('pet'),
  ielts('ielts'),
  toefl('toefl'),
  toeic('toeic');

  final String value;

  const Specialty(this.value);
}

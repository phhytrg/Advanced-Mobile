import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lettutor/app/user_profile/domain/user.dart';
import 'package:lettutor/app/user_profile/presentation/controller/user_controller.dart';
import 'package:lettutor/core/common-widgets/async_value_widget.dart';
import 'package:lettutor/core/common-widgets/button_widget.dart';
import 'package:lettutor/core/common-widgets/common_scaffold.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor/core/constant.dart';

import '../data/user_repository.dart';

class UserProfilePage extends ConsumerStatefulWidget {
  const UserProfilePage({super.key});

  @override
  ConsumerState<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends ConsumerState<UserProfilePage> {

  @override
  Widget build(BuildContext context) {
    final userState = ref.watch(userControllerProvider);
    double width = MediaQuery.of(context).size.width;
    final txt = AppLocalizations.of(context)!;

    return CommonScaffold(
        body: SingleChildScrollView(
      child: AsyncValueWidget(
        value: userState,
        data: (user) {
          return Container(
            padding: width > mobileWidth
                ? const EdgeInsets.symmetric(horizontal: 108, vertical: 16)
                : const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              children: [
                _buildUserBasicInfo(context, user),
                const SizedBox(
                  height: 16,
                ),
                _buildAccountInfo(context, user),
              ],
            ),
          );
        },
      ),
    ));
  }

  Widget _buildUserBasicInfo(BuildContext context, User user) {
    final txt = AppLocalizations.of(context)!;
    return Row(
      children: [
        InkWell(
          onTap: () async {
            FilePickerResult? picked = await FilePicker.platform
                .pickFiles(type: FileType.custom, allowedExtensions: ['jpg', 'png', 'jpeg']);
            if (picked != null) {
              MultipartFile avatar = MultipartFile.fromBytes(
                picked.files.first.bytes!,
                filename: picked.files.first.name,
              );
              final result = await ref.read(userRepositoryProvider).uploadAvatar(avatar);
              if(result){
                ref.read(userControllerProvider.notifier).build();
              }
            } else {
              // User canceled the picker
            }
          },
          child: CircleAvatar(
            radius: 64,
            backgroundImage: NetworkImage(user.avatar),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.name,
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Account ID: ${user.id}',
                overflow: TextOverflow.visible,
              ),
              MyTextButton(onPressed: () {}, child: Text(txt.othersReviewYou)),
              MyTextButton(onPressed: () {}, child: Text(txt.changePassword)),
            ],
          ),
        )
      ],
    );
  }

  final _formKey = GlobalKey<FormState>();

  Widget _buildAccountInfo(BuildContext context, User user) {
    final txt = AppLocalizations.of(context)!;

    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final phoneController = TextEditingController();
    final countryController = TextEditingController();
    final birthdayController = TextEditingController();
    final levelController = TextEditingController();
    final needController = TextEditingController();
    final studyScheduleController = TextEditingController();

    nameController.text = user.name;
    emailController.text = user.email;
    phoneController.text = user.phone;
    countryController.text = user.country;
    birthdayController.text = user.birthday;
    levelController.text = user.level;
    needController.text = '';
    studyScheduleController.text = user.studySchedule;

    return Form(
      key: _formKey,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          txt.accountInformation,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 8,
        ),
        Text('${txt.name}: '),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: txt.enterYourName,
          ),
          controller: nameController,
        ),
        const SizedBox(
          height: 16,
        ),
        const Text('Email: '),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: txt.enterYourEmail,
          ),
          controller: emailController,
          enabled: false,
        ),
        const SizedBox(
          height: 16,
        ),
        const Text('Phone: '),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: txt.enterYourPhoneNumber,
          ),
          controller: phoneController,
          enabled: false,
        ),
        const SizedBox(
          height: 16,
        ),
        Text('${txt.country}: '),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: txt.enterYourCountry,
          ),
          controller: countryController,
        ),
        const SizedBox(
          height: 16,
        ),
        Text('${txt.birthday}: '),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: txt.enterYourBirthday
          ),
          controller: birthdayController,
        ),
        const SizedBox(
          height: 16,
        ),
        Text('${txt.myLevel}: '),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: txt.enterYourLevel,
          ),
          controller: levelController,
        ),
        const SizedBox(
          height: 16,
        ),
        Text('${txt.wantToLearn}: '),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: txt.enterYourWantToLearn,
          ),
          controller: needController,
        ),
        const SizedBox(
          height: 16,
        ),
        Text('${txt.studySchedule}: '),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: txt.enterYourStudySchedule,
          ),
          controller: studyScheduleController,
        ),
        const SizedBox(
          height: 16,
        ),
        FilledButton(
            onPressed: () {
              Map<String, dynamic> data = {
                'name': nameController.text,
                'country': countryController.text,
                'birthday': birthdayController.text,
                'level': levelController.text,
                'studySchedule': studyScheduleController.text,
              };
              ref.read(userControllerProvider.notifier).updateUserProfile(data);
            },
            child: Text(txt.saveChanges)),
        const SizedBox(
          height: 64,
        ),
      ]),
    );
  }
}

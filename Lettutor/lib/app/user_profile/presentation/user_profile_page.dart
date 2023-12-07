

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lettutor/app/user_profile/domain/user.dart';
import 'package:lettutor/app/user_profile/presentation/controller/user_controller.dart';
import 'package:lettutor/core/commom-widgets/async_value_widget.dart';
import 'package:lettutor/core/commom-widgets/common_scaffold.dart';

class UserProfilePage extends ConsumerStatefulWidget {

  const UserProfilePage({super.key});

  @override
  ConsumerState<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends ConsumerState<UserProfilePage> {

  @override
  Widget build(BuildContext context) {
    final userState = ref.watch(userControllerProvider);

    return CommonScaffold(
      body: AsyncValueWidget(
        value: userState,
        data: (user) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 16),
            child: Column(
              children: [
                const Text('User Profile'),
                const SizedBox(
                  height: 16,
                ),
                _buildUserBasicInfo(context, user),
                const SizedBox(
                  height: 16,
                ),
                _buildAccountInfo(context, user),
              ],
            ),
          );
      },
    ));
  }

  Widget _buildUserBasicInfo(BuildContext context, User user) {
    return Row(
      children: [
        CircleAvatar(
          radius: 64,
          backgroundImage: NetworkImage(user.avatar),
        ),
        const SizedBox(width: 16,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(user.name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            const SizedBox(height: 8,),
            Text('Account ID: ${user.id}'),
            TextButton(onPressed: (){}, child: Text('Others reviews')),
            TextButton(onPressed: (){}, child: Text('Change password')),
          ],
        )
      ],
    );
  }

  final _formKey = GlobalKey<FormState>();

  Widget _buildAccountInfo(BuildContext context, User user) {


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
        const Text(
          'Account Information',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Text('Name: '),
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your name',
                ),
                controller: nameController,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Text('Email: '),
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your email',
                ),
                controller: emailController,
                enabled: false,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Text('Phone: '),
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your phone',
                ),
                controller: phoneController,
                enabled: false,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Text('Country: '),
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your country',
                ),
                controller: countryController,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Text('Birthday: '),
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your birthday',
                ),
                controller: birthdayController,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Text('My level:'),
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your level',
                ),
                controller: levelController,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Text('Want to learn: '),
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your need',
                ),
                controller: needController,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Text('Study schedule: '),
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your study schedule',
                ),
                controller: studyScheduleController,
              ),
            )
          ],
        ),
      ]),
    );
  }
}

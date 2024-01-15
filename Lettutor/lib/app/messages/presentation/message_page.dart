import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lettutor/app/messages/presentation/controller/detail_message_controller.dart';
import 'package:lettutor/app/messages/presentation/controller/messagesController.dart';
import 'package:lettutor/app/user_profile/presentation/controller/user_controller.dart';
import 'package:lettutor/core/common-widgets/async_value_widget.dart';
import 'package:lettutor/core/constant.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

class MessagesPage extends ConsumerStatefulWidget {
  const MessagesPage({super.key});

  @override
  ConsumerState<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends ConsumerState<MessagesPage> {
  String otherUserId = '';

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery
        .of(context)
        .size
        .width;
    final messagesState = ref.watch(messagesControllerProvider);
    return AsyncValueWidget(
      value: messagesState,
      data: (messages) {
        if (messages.isEmpty) {
          return Container();
        }
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: ListView(
                      shrinkWrap: true,
                      children: width > mobileWidth
                          ? [
                        ...messages.map((e) =>
                            InkWell(
                              onTap: () {
                                setState(() {
                                  otherUserId = e.toInfo.id;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListTile(
                                  title: Text(e.toInfo.name),
                                  subtitle: Text(
                                    e.content,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  leading: CircleAvatar(
                                    backgroundImage: NetworkImage(e.toInfo.avatar!),
                                  ),
                                ),
                              ),
                            ))
                      ]
                          : [
                        ...messages.map(
                              (e) =>
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    otherUserId = e.toInfo.id;
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                    backgroundImage: NetworkImage(e.toInfo.avatar!),
                                  ),
                                ),
                              ),
                        )
                      ],
                    ),
                  )),
            ),
            const VerticalDivider(thickness: 0.5, width: 0.5),
            AsyncValueWidget(
              value: ref.watch(userControllerProvider),
              data: (user) {
                final currentUser = types.User(id: user.id, firstName: user.name, imageUrl: user.avatar);

                return otherUserId.isNotEmpty ? Expanded(
                  flex: width > mobileWidth ? 3 : 6,
                  child: AsyncValueWidget(
                    value: ref.watch(detailMessageControllerProvider(otherUserId)),
                    data: (msgs) {
                      final messages = msgs
                          .map((e) =>
                          types.TextMessage(
                              author: e.toInfo.id == otherUserId
                                  ? currentUser
                                  : types.User(id: e.fromInfo.id, firstName: e.fromInfo.name, imageUrl: e.fromInfo.avatar),
                              id: e.id,
                              text: e.content,
                            createdAt: DateTime.parse(e.createdAt).millisecondsSinceEpoch,
                          ))
                          .toList();
                      return Chat(
                        messages: messages,
                        onSendPressed: (value) {
                        },
                        user: currentUser,
                        theme: DefaultChatTheme(
                          inputBackgroundColor: Colors.white,
                          inputBorderRadius: BorderRadius.circular(30),
                          inputTextColor: Colors.black,
                          primaryColor: Colors.blue,
                          inputContainerDecoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey.shade300,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          inputMargin: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                          inputPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                        ),
                        inputOptions: const InputOptions(
                          sendButtonVisibilityMode: SendButtonVisibilityMode.always,
                        ),
                        showUserAvatars: true,
                        onEndReached: () async {
                          await ref.read(detailMessageControllerProvider(otherUserId).notifier).loadMore(otherUserId);
                        },
                      );
                    },
                  ),
                ) : Expanded(
                  flex: width > mobileWidth ? 3 : 6,
                  child: const Center(
                    child: Text('Select a user to chat'),
                  ),
                );
              },
            )
          ],
        );
      },
    );
  }
}

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:giphy_picker/giphy_picker.dart';
import 'package:kayvo_flutter/utilities/styles.dart';
import 'package:kayvo_flutter/package/dash_chat/dash_chat.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0),
          child: AppBar(
            automaticallyImplyLeading: false,
            leading: Padding(
              padding: EdgeInsets.only(top: 20),
              child: IconButton(
                icon: Icon(
                  Icons.keyboard_arrow_left,
                  color: AppColors.kBlack,
                ),
                onPressed: () {},
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/default_image.png'),
                    radius: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Column(
                      children: <Widget>[
                        Text(
                          "  Ayodeji Abraham",
                          style: Theme.of(context).textTheme.title,
                        ),
                        Text(
                          "last seen today at 9:41 AM",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle
                              .copyWith(color: AppColors.kGrey),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: IconButton(
                  icon: SvgPicture.asset(
                    "assets/ellipsis-v.svg",
                    width: 28,
                    height: 28,
                  ),
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
        body: Stack(children: <Widget>[
          CustomScrollView(slivers: <Widget>[
            SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(bottom: 48.0),
                            child: Stack(
                              children: <Widget>[
                                ChattingWidget(),
                              ],
                            ),
                          ),
                          _security()
                        ],
                      ),
                    ])),
          ])
        ]));
  }

  Widget _security() {
    return Center(
      child: Container(
        width: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SvgPicture.asset(
              'assets/shield-check.svg',
              height: 20,
              width: 20,
              color: AppColors.kGrey,
            ),
            Text(
              "Messages in this chat are private and protected by Kayvo's end to end encryption",
              //  style: Theme.of(context).textTheme.subtitle,
            )
          ],
        ),
      ),
    );
  }
}

class ChattingWidget extends StatefulWidget {
  @override
  _ChattingWidgetState createState() => _ChattingWidgetState();
}

class _ChattingWidgetState extends State<ChattingWidget> {
  final GlobalKey<DashChatState> _chatViewKey = GlobalKey<DashChatState>();

  final ChatUser user = ChatUser(
    name: "Fayeed",
    uid: "123456789",
    avatar: 'assets/images/profilePic1.png',
  );

  final ChatUser otherUser = ChatUser(
    name: "Mrfatty",
    uid: "25649654",
    avatar: 'assets/images/profilePic2.png',
  );

  List<ChatMessage> messages = List<ChatMessage>();
  var m = List<ChatMessage>();

  var i = 0;

  @override
  void initState() {
    m.addAll([
      ChatMessage(text: "Hi", user: otherUser, createdAt: DateTime.now()),
      ChatMessage(
        text: "How are you?",
        user: otherUser,
        createdAt: DateTime.now(),
      ),
      ChatMessage(
        text: "I am fine",
        user: otherUser,
        createdAt: DateTime.now(),
      ),
      ChatMessage(
        text: "It's Friday",
        user: otherUser,
        createdAt: DateTime.now(),
      ),
      ChatMessage(
        text: "",
        image: "https://media.giphy.com/media/1APaqOO5JHnWKLc7Bi/giphy.gif",
        user: otherUser,
        createdAt: DateTime.now(),
      ),
      ChatMessage(
        text: "Message you in a bit",
        user: otherUser,
        createdAt: DateTime.now(),
      )
    ]);

    super.initState();
  }

  void systemMessage() {
    Timer(Duration(milliseconds: 300), () {
      if (i < 6) {
        setState(() {
          messages = [...messages, m[i]];
        });
        i++;
      }
      Timer(Duration(milliseconds: 300), () {
        _chatViewKey.currentState.scrollController
          ..animateTo(
            _chatViewKey.currentState.scrollController.position.maxScrollExtent,
            curve: Curves.easeOut,
            duration: const Duration(milliseconds: 300),
          );
      });
    });
  }

  void onSend(ChatMessage message) {
    setState(() {
      messages = [...messages, message];
      print(messages.length);
    });

    if (i == 0) {
      systemMessage();
      Timer(Duration(milliseconds: 600), () {
        systemMessage();
      });
    } else {
      systemMessage();
    }
  }

  //ScrollController scrollController  = ScrollController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DashChat(
        //    scrollController: scrollController,
        key: _chatViewKey,
        inverted: false,
        onSend: onSend,
        user: user,
        height: deviceHeight(context) * 0.98,
        inputDecoration: InputDecoration.collapsed(
          hintText: "Type a message",
          hintStyle: TextStyle(
            color: AppColors.kGrey,
            fontFamily: 'Helvetica',
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
        ),
        dateFormat: DateFormat('yyyy-MMM-dd'),
        timeFormat: DateFormat('HH:mm'),
        inputTextStyle: Theme.of(context).textTheme.body1,
        messages: messages,
        scrollToBottom: false,

        //     onScrollToBottomPress :(){
        //       scrollController.animateTo(
        //    0.0,
        //    curve: Curves.easeOut,
        //    duration: const Duration(milliseconds: 300),
        //  );
        //     },
        showTraillingBeforeSend: true,
        trailing: <Widget>[
          IconButton(
            icon: SvgPicture.asset(
              'assets/paperclip.svg',
              height: 20,
              width: 20,
              color: AppColors.kGrey,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.mic,
              color: AppColors.kGrey,
            ),
            onPressed: () {},
          ),
        ],
        sendButtonBuilder: (Function click) {
          return IconButton(
            icon: Icon(
              FontAwesomeIcons.solidPaperPlane,
              color: AppColors.kGrey,
            ),
            onPressed: click,
          );
        },

        avatarBuilder: (user) => CircleAvatar(
          backgroundColor: AppColors.kLightGrey,
          backgroundImage: AssetImage('assets/default_image.png'),
        ),
        showUserAvatar: false,
        showAvatarForEveryMessage: true,
        onPressAvatar: (ChatUser user) {
          print("OnPressAvatar: ${user.name}");
        },
        onLongPressAvatar: (ChatUser user) {
          print("OnLongPressAvatar: ${user.name}");
        },
        inputMaxLines: 5,
        messageContainerPadding: EdgeInsets.only(left: 5.0, right: 5.0),
        alwaysShowSend: false,

        inputContainerStyle: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.kLightGrey),
        onLoadEarlier: () {
          print("laoding...");
        },
        shouldShowLoadEarlier: true,
        messageContainerDecoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10)),
          color: AppColors.kLightGrey,
        ),
      ),
    );
  }
}

import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kayvo_flutter/elements/appBarExtend.dart';
import 'package:kayvo_flutter/utilities/styles.dart';
import 'package:dash_chat/dash_chat.dart';

class security extends StatefulWidget {
  security({
    Key key,
  }) : super(key: key);
  @override
  _securityState createState() => _securityState();
}

bool showsecurity = true;

class _securityState extends State<security> {
  Widget security_msg = Center(
    child: Container(
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SvgPicture.asset(
              'assets/shield-check.svg',
              height: 20,
              width: 20,
              color: AppColors.kGrey,
            ),
          ),
          Text(
            "Messages in this chat are private and protected by Kayvo's end to end encryption",
            //  style: Theme.of(context).textTheme.subtitle,
            textAlign: TextAlign.center,
          )
        ],
      ),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return showsecurity
        ? security_msg
        : SizedBox(
            height: null,
          );
  }
}

class ChatWidgetX extends StatefulWidget {
  const ChatWidgetX({Key key}) : super(key: key);

  @override
  _ChatWidgetXState createState() => _ChatWidgetXState();
}

class _ChatWidgetXState extends State<ChatWidgetX> {
  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  // Widget securtiyWIdget = security;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ChatAppbar(
          height: 228,
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
                          Stack(
                            children: <Widget>[
                              ChattingWidget(
                                onChanged: _handleTapboxChanged,
                              ),
                            ],
                          ),
                          _active ? SizedBox(height: 0) : security(),
                        ],
                      ),
                    ])),
          ])
        ]));
  }

  // void setStatecall() {
  //   setState(() {
  //     if (showsecurity) {
  //       print("Security WIdget");
  //       securtiyWIdget = security;
  //     } else {
  //       print("No Widget");
  //       securtiyWIdget = SizedBox(
  //         height: 0,
  //       );
  //     }
  //   });
  // }
}

class ChattingWidget extends StatefulWidget {
  const ChattingWidget({@required this.onChanged});
  final ValueChanged<bool> onChanged;
  @override
  _ChattingWidgetState createState() => _ChattingWidgetState();
}

class _ChattingWidgetState extends State<ChattingWidget> {
  final GlobalKey<DashChatState> _chatViewKey = GlobalKey<DashChatState>();

  void _handleTap() {
    widget.onChanged(true);
  }

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
    _handleTap();
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

  @override
  Widget build(BuildContext context) {
    return DashChat(
      key: _chatViewKey,
      inverted: false,
      onSend: onSend,
      user: user,
      height: MediaQuery.of(context).size.height - 105,
      inputFooterBuilder: () {
        return SafeArea(
          child: SizedBox(),
        );
      },
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
          borderRadius: BorderRadius.circular(10), color: AppColors.kLightGrey),
      onLoadEarlier: () {
        print("laoding...");
      },
      shouldShowLoadEarlier: true,
    );
  }
}

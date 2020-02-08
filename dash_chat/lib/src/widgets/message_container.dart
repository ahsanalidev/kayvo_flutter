part of dash_chat;

/// MessageContainer is just a wrapper around [Text], [Image]
/// component to present the message
class MessageContainer extends StatelessWidget {
  /// Message Object that will be rendered
  /// Takes a [ChatMessage] object
  final ChatMessage message;

  /// [DateFormat] object to render the date in desired
  /// format, if no format is provided it use
  /// the default `HH:mm:ss`
  final DateFormat timeFormat;

  /// [messageTextBuilder] function takes a function with this
  /// structure [Widget Function(String)] to render the text inside
  /// the container.
  final Widget Function(String) messageTextBuilder;

  /// [messageImageBuilder] function takes a function with this
  /// structure [Widget Function(String)] to render the image inside
  /// the container.
  final Widget Function(String) messageImageBuilder;

  /// [messageTimeBuilder] function takes a function with this
  /// structure [Widget Function(String)] to render the time text inside
  /// the container.
  final Widget Function(String) messageTimeBuilder;

  /// Provides a custom style to the message container
  /// takes [BoxDecoration]
  final BoxDecoration messageContainerDecoration;

  /// Used to parse text to make it linkified text uses
  /// [flutter_parsed_text](https://pub.dev/packages/flutter_parsed_text)
  /// takes a list of [MatchText] in order to parse Email, phone, links
  /// and can also add custom pattersn using regex
  final List<MatchText> parsePatterns;

  /// A flag which is used for assiging styles
  final bool isUser;

  MessageContainer({
    // this.key,
    @required this.message,
    @required this.timeFormat,
    this.messageImageBuilder,
    this.messageTextBuilder,
    this.messageTimeBuilder,
    this.messageContainerDecoration,
    this.parsePatterns = const <MatchText>[],
    this.isUser,
  });
  Rect myRect = const Offset(1.0, 2.0) & const Size(3.0, 4.0);

  @override
  Widget build(BuildContext context) {
    Rect _showRect;

    PopupMenu.context = context;
    PopupMenu menu = PopupMenu(
      items: [
        MenuItem(
            title: 'Home',
            image: Icon(
              Icons.home,
              color: Colors.white,
            )),
        MenuItem(
            title: 'Mail',
            image: Icon(
              Icons.mail,
              color: Colors.white,
            )),
        MenuItem(
            title: 'Power',
            image: Icon(
              Icons.power,
              color: Colors.white,
            )),
        MenuItem(
            title: 'Setting',
            image: Icon(
              Icons.settings,
              color: Colors.white,
            )),
        MenuItem(
            title: 'Traffic',
            image: Icon(
              Icons.traffic,
              color: Colors.white,
            ))
      ],
    );

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.8,
      ),

      //    messageContainerDecoration: BoxDecoration(
      //   borderRadius: BorderRadius.only(
      //       topLeft: Radius.circular(10),
      //       topRight: Radius.circular(10),
      //       bottomLeft: Radius.circular(10)),
      //   color: AppColors.kLightGrey,
      // ),
      child: Container(
        decoration: messageContainerDecoration != null
            ? messageContainerDecoration.copyWith(
                color: message.user.containerColor != null
                    ? message.user.containerColor
                    : messageContainerDecoration.color,
              )
            : BoxDecoration(
                color: message.user.containerColor != null
                    ? message.user.containerColor
                    : isUser
                        ? Theme.of(context).accentColor
                        : Color.fromRGBO(225, 225, 225, 1),
                borderRadius: isUser
                    ? BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10))
                    : BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
              ),
        margin: EdgeInsets.only(
          bottom: 5.0,
        ),
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            if (messageTextBuilder != null)
              messageTextBuilder(message.text)
            else
              ParsedText(
                parse: parsePatterns,
                text: message.text,
                style: TextStyle(
                  color: message.user.color != null
                      ? message.user.color
                      : isUser ? Colors.black87 : Colors.black87,
                ),
              ),
            if (message.image != null)
              if (messageImageBuilder != null)
                messageImageBuilder(message.image)
              else
                Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: FadeInImage.memoryNetwork(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width * 0.7,
                    fit: BoxFit.contain,
                    placeholder: kTransparentImage,
                    image: message.image,
                  ),
                ),
            if (messageTimeBuilder != null)
              messageTimeBuilder(
                timeFormat != null
                    ? timeFormat.format(message.createdAt)
                    : DateFormat('HH:mm:ss').format(message.createdAt),
              )
            else
              Padding(
                padding: EdgeInsets.only(top: 5.0),
                child: Text(
                  timeFormat != null
                      ? timeFormat.format(message.createdAt)
                      : DateFormat('HH:mm:ss').format(message.createdAt),
                  style: TextStyle(
                    fontSize: 10.0,
                    color: message.user.color != null
                        ? message.user.color
                        : Colors.black87,
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}

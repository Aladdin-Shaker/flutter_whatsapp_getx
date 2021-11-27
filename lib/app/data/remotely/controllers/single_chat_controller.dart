import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import 'package:whats_app_clone/app/models/message.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:whats_app_clone/root/contracts/rootController.dart';

class SingleChatController extends RootController {
  // ChatModel get getChat => _chat;
  // ChatModel get getSelectedChat => _selectedChat;

  final TextEditingController msgController = TextEditingController();
  ScrollController scrollController = ScrollController();

  late final FocusNode focusNode;
  late IO.Socket socket;

  RxList<MessageModel> listMessages = <MessageModel>[].obs;
  // late final ChatModel _selectedChat;

  bool emojiShowing = false;
  bool isSendMsgBtn = false;

  @override
  void onInit() {
    super.onInit();
    debugPrint('onInit called in singleChatcontroller');
    socketConnect();
    focusNode = FocusNode();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        emojiShowing = false;
      } else {
        emojiShowing = true;
      }
    });
  }

  @override
  void onClose() {
    // called just before the Controller is deleted from memory
    super.onClose();
  }

  @override
  void onReady() {
    // called after the widget is rendered on screen
    super.onReady();
  }

  @override
  void dispose() {
    super.dispose();
    socket.close();
    socket.onDisconnect((_) => print('socket disconnect'));
  }

  socketConnect() {
    // socket = IO.io(
    //   'http://localhost:5000',
    //   <String, dynamic>{
    //     "transports": ["websocket"],
    //     "autoConnect": false,
    //   },
    // );

    socket = IO.io(
      // 'http://192.168.1.106:5000',
      'https://socket-test-flutter.herokuapp.com/',
      IO.OptionBuilder()
          .setTransports(['websocket']) // for Flutter or Dart VM
          .disableAutoConnect() // disable auto-connection
          .build(),
    );
    socket.connect();
    print('socket is connected 222 ? ${socket.connected}');

    socket.emit('signin', '1');
    socket.onConnect(
      (data) {
        print('socket connected to the server successfuly');
        socket.on('message', (data) {
          print('data from server => $data');
          setMessageLocaly(MessageModel(
            name: data['message'],
            type: 'target',
            time: data['time'],
          ));
        });
        print('socket is connected ? ${socket.connected}');
      },
    );
  }

  onEmojiSelected(Emoji emoji) {
    msgController
      ..text += emoji.emoji
      ..selection = TextSelection.fromPosition(
          TextPosition(offset: msgController.text.length));
  }

  onBackspacePressed() {
    msgController
      ..text = msgController.text.characters.skipLast(1).toString()
      ..selection = TextSelection.fromPosition(
          TextPosition(offset: msgController.text.length));
  }

  void animateChatScrollController() {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  setMessageLocaly(MessageModel msg) {
    if (msg.name == '') return;

    listMessages.add(msg);
    animateChatScrollController();
  }

  Map<String, dynamic>? sendMessage(
    String message,
    String time,
    int sourceId,
    int targetId,
  ) {
    if (message.isEmpty || sourceId.isNaN || targetId.isNaN) {
      return buildResponse(null, false, false, 'missed data !');
    }
    socket.emit('message', {
      "message": message,
      "sourceId": sourceId,
      "targetId": targetId,
    });
    setMessageLocaly(MessageModel(name: message, type: 'source', time: time));
  }
}

// import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:whats_app_clone/app/models/chat.dart';
// import 'package:whats_app_clone/app/models/message.dart';
// import 'package:whats_app_clone/app/models/user.dart';
// import 'package:socket_io_client/socket_io_client.dart' as IO;

// class MainProvider with ChangeNotifier {
//   late ChatModel _chat = new ChatModel(
//     id: '11',
//     name: 'University group',
//     date: '16:41',
//     icon: 'people.svg',
//     currentMessage: 'what is the different ..',
//     isGroup: true,
//     status: '',
//   );

//   ChatModel get getChat => _chat;

//   late final ChatModel _selectedChat;
//   ChatModel get getSelectedChat => _selectedChat;

//   final TextEditingController msgController = TextEditingController();
//   final ScrollController scrollContoleer = ScrollController();
//   bool emojiShowing = false;
//   bool isSendMsgBtn = false;
//   late FocusNode focusNode;
//   late IO.Socket socket;
//   late List<MessageModel> listMessages = [];

//   onEmojiSelected(Emoji emoji) {
//     msgController
//       ..text += emoji.emoji
//       ..selection = TextSelection.fromPosition(
//           TextPosition(offset: msgController.text.length));
//   }

//   onBackspacePressed() {
//     msgController
//       ..text = msgController.text.characters.skipLast(1).toString()
//       ..selection = TextSelection.fromPosition(
//           TextPosition(offset: msgController.text.length));
//   }

//   socketConnect() {
//     // socket = IO.io(
//     //   'http://localhost:5000',
//     //   <String, dynamic>{
//     //     "transports": ["websocket"],
//     //     "autoConnect": false,
//     //   },
//     // );

//     socket = IO.io(
//       // 'http://192.168.1.106:5000',
//       'https://socket-test-flutter.herokuapp.com/',
//       IO.OptionBuilder()
//           .setTransports(['websocket']) // for Flutter or Dart VM
//           .disableAutoConnect() // disable auto-connection
//           .build(),
//     );
//     socket.connect();
//     debugPrint('socket is connected 222 ? ${socket.connected}');

//     socket.emit('signin', '1');
//     socket.onConnect(
//       (data) {
//         debugPrint('socket connected to the server successfuly');
//         socket.on('message', (data) {
//           debugPrint('data from server => $data');
//           setMessageLocaly(MessageModel(name: data['message'], type: 'target'));
//         });
//         debugPrint('socket is connected ? ${socket.connected}');
//       },
//     );
//   }

//   sendMessage(String message, int sourceId, int targetId) {
//     if (message == '') return;
//     socket.emit('message', {
//       "message": message,
//       "sourceId": sourceId,
//       "targetId": targetId,
//     });
//     setMessageLocaly(MessageModel(name: message, type: 'source'));
//   }

//   setMessageLocaly(MessageModel msg) {
//     if (msg.name == '') return;

//     listMessages.add(msg);
//     animateChatScrollController();
//   }

//   void animateChatScrollController() {
//     scrollContoleer.animateTo(
//       scrollContoleer.position.maxScrollExtent,
//       duration: Duration(milliseconds: 300),
//       curve: Curves.easeIn,
//     );
//   }
// }

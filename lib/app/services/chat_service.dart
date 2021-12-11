import 'package:whats_app_clone/app/models/chat.dart';
import 'package:whats_app_clone/root/contracts/rootService.dart';

class ChatService extends RootService {
  // SingleChatController chatCtrl = Get.put(SingleChatController());
  // late IO.Socket socket;

  @override
  Future create({required Map<String, dynamic> data}) {
    throw UnimplementedError();
  }

  @override
  Future<bool> delete({required String id}) {
    throw UnimplementedError();
  }

  @override
  Future<List<ChatModel>>? findAll(
      {Map<String, dynamic>? filters, int? page}) async {
    print('Chat service findAll called ');
    return Future.delayed(Duration(seconds: 1), () {
      final List<ChatModel> chats = [
        ChatModel(
          '1',
          'Family group',
          '12:41',
          'people.svg',
          true,
          '',
          'Hi family',
        ),
        ChatModel(
          '2',
          'Ahmad Kh',
          '10:31',
          'pesone.svg',
          false,
          '',
          'Hi Aladdin, how are you ?',
        ),
        ChatModel(
          '3',
          'Friends :)',
          '09:00',
          'people.svg',
          true,
          '',
          'we can make that ..',
        ),
        ChatModel(
          '4',
          'University group',
          '16:41',
          'people.svg',
          true,
          '',
          'what is the different ..',
        ),
        ChatModel(
          '5',
          'Fatima Ali',
          '18:33',
          'peson.svg',
          false,
          '',
          'are you ready ?',
        ),
        ChatModel(
          '6',
          'Work group',
          '20:22',
          'people.svg',
          true,
          '',
          'very good',
        ),
        ChatModel(
          '7',
          'Mhd Fadi',
          '02:55',
          'peson.svg',
          false,
          '',
          'call me please ',
        ),
        ChatModel(
          '8',
          'Mhd Fadi',
          '02:55',
          'peson.svg',
          false,
          '',
          'call me please ',
        ),
        ChatModel(
          '9',
          'Friends :)',
          '09:00',
          'people.svg',
          true,
          '',
          'we can make that ..',
        ),
        ChatModel(
          '10',
          'University group',
          '16:41',
          'people.svg',
          true,
          '',
          'what is the different ..',
        ),
      ];
      return chats;
    });
  }

  @override
  Future findOne({required String id}) {
    throw UnimplementedError();
  }

  @override
  Future update({required model}) {
    throw UnimplementedError();
  }

  // socketConnect() {
  //   // socket = IO.io(
  //   //   'http://localhost:5000',
  //   //   <String, dynamic>{
  //   //     "transports": ["websocket"],
  //   //     "autoConnect": false,
  //   //   },
  //   // );

  //   socket = IO.io(
  //     // 'http://192.168.1.106:5000',
  //     'https://socket-test-flutter.herokuapp.com/',
  //     IO.OptionBuilder()
  //         .setTransports(['websocket']) // for Flutter or Dart VM
  //         .disableAutoConnect() // disable auto-connection
  //         .build(),
  //   );
  //   socket.connect();
  //   print('socket is connected 222 ? ${socket.connected}');

  //   socket.emit('signin', '1');
  //   socket.onConnect(
  //     (data) {
  //       print('socket connected to the server successfuly');
  //       socket.on('message', (data) {
  //         print('data from server => $data');
  //         // chatCtrl.setMessageLocaly(
  //         //     MessageModel(data['message'], type: 'target'));
  //       });
  //       print('socket is connected ? ${socket.connected}');
  //     },
  //   );
  // }

  // void sendMessage(String message, int sourceId, int targetId) {
  //   if (message == '') return;
  //   print('chat service => $message');
  //   socket.emit('message', {
  //     "message": message,
  //     "sourceId": sourceId,
  //     "targetId": targetId,
  //   });
  //   // chatCtrl.setMessageLocaly(MessageModel(message, type: 'source'));
  // }
}

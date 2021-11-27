import 'package:get/instance_manager.dart';
import 'package:whats_app_clone/app/data/remotely/controllers/single_chat_controller.dart';
import 'package:whats_app_clone/app/models/chat.dart';
import 'package:whats_app_clone/app/models/message.dart';
import 'package:whats_app_clone/root/contracts/rootService.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

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
          id: '1',
          name: 'Family group',
          date: '12:41',
          icon: 'people.svg',
          currentMessage: 'Hi family',
          isGroup: true,
          status: '',
        ),
        ChatModel(
          id: '2',
          name: 'Ahmad Kh',
          date: '10:31',
          icon: 'pesone.svg',
          currentMessage: 'Hi Aladdin, how are you ?',
          isGroup: false,
          status: '',
        ),
        ChatModel(
          id: '3',
          name: 'Friends :)',
          date: '09:00',
          icon: 'people.svg',
          currentMessage: 'we can make that ..',
          isGroup: true,
          status: '',
        ),
        ChatModel(
          id: '4',
          name: 'University group',
          date: '16:41',
          icon: 'people.svg',
          currentMessage: 'what is the different ..',
          isGroup: true,
          status: '',
        ),
        ChatModel(
          id: '5',
          name: 'Fatima Ali',
          date: '18:33',
          icon: 'peson.svg',
          currentMessage: 'are you ready ?',
          isGroup: false,
          status: '',
        ),
        ChatModel(
          id: '6',
          name: 'Work group',
          date: '20:22',
          icon: 'people.svg',
          currentMessage: 'very good',
          isGroup: true,
          status: '',
        ),
        ChatModel(
          id: '7',
          name: 'Mhd Fadi',
          date: '02:55',
          icon: 'peson.svg',
          currentMessage: 'call me please ',
          isGroup: false,
          status: '',
        ),
        ChatModel(
          id: '8',
          name: 'Mhd Fadi',
          date: '02:55',
          icon: 'peson.svg',
          currentMessage: 'call me please ',
          isGroup: false,
          status: '',
        ),
        ChatModel(
          id: '9',
          name: 'Friends :)',
          date: '09:00',
          icon: 'people.svg',
          currentMessage: 'we can make that ..',
          isGroup: true,
          status: '',
        ),
        ChatModel(
          id: '10',
          name: 'University group',
          date: '16:41',
          icon: 'people.svg',
          currentMessage: 'what is the different ..',
          isGroup: true,
          status: '',
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
  //         //     MessageModel(name: data['message'], type: 'target'));
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
  //   // chatCtrl.setMessageLocaly(MessageModel(name: message, type: 'source'));
  // }
}

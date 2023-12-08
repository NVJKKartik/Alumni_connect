// 2
import 'package:alumni_connect/services/cloud/cloud_message/cloud_chat.dart';
import 'package:alumni_connect/services/cloud/cloud_message/cloud_message.dart';
import 'package:alumni_connect/services/cloud/cloud_user/cloud_user.dart';

abstract class CloudMessageProvider {
  // message
  Future<void> createNewMessage(
    CloudUser currentUser,
    CloudUser sendToUser,
    CloudChat cloudChatUser,
    CloudMessage cloudMessage,
  );

  // for chat
  Future<List<CloudChat>> userAllChats(CloudUser currentUser);

  Stream<Iterable<CloudMessage>> userAllMessages(
    CloudUser currentUser,
    CloudUser sendToUser,
  );
}

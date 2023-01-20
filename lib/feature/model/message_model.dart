class MessageModel {
  MessageModel({this.message, this.senderId, this.sentAt});

  String? id;
  String? message;
  int? sentAt;
  String? senderId;

  static const String messageKey = 'message';
  static const String sentAtKey = 'sent_at';
  static const String senderIdKey = 'sender_id';

  Map<String, dynamic> toJson() {
    return {messageKey: message, sentAtKey: sentAt, senderIdKey: senderId};
  }

  MessageModel.fromJson(Map<String, dynamic> json) {
    message = json[messageKey];
    sentAt = json[sentAtKey];
    senderId = json[senderIdKey];
  }
}

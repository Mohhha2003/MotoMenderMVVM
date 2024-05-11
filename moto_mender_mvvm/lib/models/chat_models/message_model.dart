class MessageModel {
  String? sender;
  String? receiver;
  String? content;
  DateTime? timestamp;

  MessageModel({
    this.sender,
    this.receiver,
    this.content,
    this.timestamp,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
        sender: json['sender'] as String?,
        receiver: json['receiver'] as String?,
        content: json['content'] as String?,
        timestamp: json['timestamp'] == null
            ? null
            : DateTime.parse(json['timestamp'] as String),
      );

  Map<String, dynamic> toJson() => {
        'sender': sender,
        'receiver': receiver,
        'content': content,
        'timestamp': timestamp?.toIso8601String(),
      };
}

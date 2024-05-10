class MessageModel {
  String? sender;
  String? receiver;
  String? content;
  String? id;
  DateTime? timestamp;
  int? v;

  MessageModel({
    this.sender,
    this.receiver,
    this.content,
    this.id,
    this.timestamp,
    this.v,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
        sender: json['sender'] as String?,
        receiver: json['receiver'] as String?,
        content: json['content'] as String?,
        id: json['_id'] as String?,
        timestamp: json['timestamp'] == null
            ? null
            : DateTime.parse(json['timestamp'] as String),
        v: json['__v'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'sender': sender,
        'receiver': receiver,
        'content': content,
        '_id': id,
        'timestamp': timestamp?.toIso8601String(),
        '__v': v,
      };
}

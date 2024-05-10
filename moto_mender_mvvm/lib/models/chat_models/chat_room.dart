class ChatRoom {
  List<dynamic>? participants;
  String? chatRoomId;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  ChatRoom({
    this.participants,
    this.chatRoomId,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory ChatRoom.fromJson(Map<String, dynamic> json) => ChatRoom(
        participants: json['participants'] as List<dynamic>?,
        chatRoomId: json['chatRoomId'] as String?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        v: json['__v'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'participants': participants,
        'chatRoomId': chatRoomId,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
      };
}

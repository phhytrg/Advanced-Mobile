

class Message {
  final String id;
  final String content;
  final bool isRead;
  final String createdAt;
  final String updatedAt;
  final Info fromInfo;
  final Info toInfo;

  Message({
    required this.id,
    required this.content,
    required this.isRead,
    required this.createdAt,
    required this.updatedAt,
    required this.fromInfo,
    required this.toInfo,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['id'],
      content: json['content'],
      isRead: json['isRead'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      fromInfo: Info.fromJson(json['fromInfo']),
      toInfo: Info.fromJson(json['toInfo']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'content': content,
      'isRead': isRead,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'fromInfo': fromInfo.toJson(),
      'toInfo': toInfo.toJson(),
    };
  }
}

class Info{
  final String id;
  final String name;
  String? avatar;

  Info({
    required this.id,
    required this.name,
    this.avatar,
  });

  factory Info.fromJson(Map<String, dynamic> json) {
    return Info(
      id: json['id'],
      name: json['name'],
      avatar: json['avatar'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'avatar': avatar,
    };
  }
}
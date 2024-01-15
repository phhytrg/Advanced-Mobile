

import 'package:json_annotation/json_annotation.dart';

part 'ebook.g.dart';

class EbookList {
  final List<Ebook> rows;
  int count;

  EbookList({required this.rows, required this.count});

  factory EbookList.fromJson(Map<String, dynamic> json) {
    return EbookList(
      count: json['count'],
      rows: json['rows'].map<Ebook>((ebook) => Ebook.fromJson(ebook)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['rows'] = rows.map((v) => v.toJson()).toList();
    return data;
  }
}

@JsonSerializable()
class Ebook {
  String? id;
  String? fileUrl;
  String? imageUrl;
  String? level;
  String? name;
  String? description;
  bool? visible;

  Ebook({
     this.id,
     this.fileUrl,
     this.imageUrl,
     this.level,
     this.name,
     this.description,
     this.visible,
  });

  factory Ebook.fromJson(Map<String, dynamic> json) => _$EbookFromJson(json);
  Map<String, dynamic> toJson() => _$EbookToJson(this);
}
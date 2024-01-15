// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ebook.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ebook _$EbookFromJson(Map<String, dynamic> json) => Ebook(
      id: json['id'] as String?,
      fileUrl: json['fileUrl'] as String?,
      imageUrl: json['imageUrl'] as String?,
      level: json['level'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      visible: json['visible'] as bool?,
    );

Map<String, dynamic> _$EbookToJson(Ebook instance) => <String, dynamic>{
      'id': instance.id,
      'fileUrl': instance.fileUrl,
      'imageUrl': instance.imageUrl,
      'level': instance.level,
      'name': instance.name,
      'description': instance.description,
      'visible': instance.visible,
    };

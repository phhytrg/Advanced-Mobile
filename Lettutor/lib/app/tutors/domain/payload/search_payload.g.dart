// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchPayload _$SearchPayloadFromJson(Map<String, dynamic> json) =>
    SearchPayload(
      filters: json['filters'] == null
          ? null
          : Filters.fromJson(json['filters'] as Map<String, dynamic>),
      page: json['page'] as int?,
      perPage: json['perPage'] as int?,
      search: json['search'] as String?,
    );

Map<String, dynamic> _$SearchPayloadToJson(SearchPayload instance) =>
    <String, dynamic>{
      'filters': instance.filters,
      'page': instance.page,
      'perPage': instance.perPage,
      'search': instance.search,
    };

Filters _$FiltersFromJson(Map<String, dynamic> json) => Filters(
      specialties: (json['specialties'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      nationality: json['nationality'] == null
          ? null
          : Nationality.fromJson(json['nationality'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FiltersToJson(Filters instance) => <String, dynamic>{
      'specialties': instance.specialties,
      'nationality': instance.nationality,
    };

Nationality _$NationalityFromJson(Map<String, dynamic> json) => Nationality(
      isVietnamese: json['isVietnamese'] as bool,
      isNative: json['isNative'] as bool,
    );

Map<String, dynamic> _$NationalityToJson(Nationality instance) =>
    <String, dynamic>{
      'isVietnamese': instance.isVietnamese,
      'isNative': instance.isNative,
    };

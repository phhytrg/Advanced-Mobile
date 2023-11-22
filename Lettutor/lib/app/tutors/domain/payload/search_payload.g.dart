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
      page: json['page'] as String?,
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
    );

Map<String, dynamic> _$FiltersToJson(Filters instance) => <String, dynamic>{
      'specialties': instance.specialties,
    };

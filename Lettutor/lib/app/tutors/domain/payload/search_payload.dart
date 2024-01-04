import 'package:json_annotation/json_annotation.dart';

part 'search_payload.g.dart';

@JsonSerializable()
class SearchPayload{
  Filters? filters;
  String? page;
  int? perPage;
  String? search;
  Nationality? nationality;

  SearchPayload({this.filters, this.page, this.perPage, this.search, this.nationality});
  factory SearchPayload.fromJson(Map<String, dynamic> json) => _$SearchPayloadFromJson(json);
  Map<String, dynamic> toJson() => _$SearchPayloadToJson(this);
}

@JsonSerializable()
class Filters{
  List<String>? specialties;

  Filters({this.specialties});

  factory Filters.fromJson(Map<String, dynamic> json) => _$FiltersFromJson(json);
  Map<String, dynamic> toJson() => _$FiltersToJson(this);
}

@JsonSerializable()
class Nationality {
  final bool isVietnamese;
  final bool isNative;

  Nationality({required this.isVietnamese, required this.isNative});

  factory Nationality.fromJson(Map<String, dynamic> json) => _$NationalityFromJson(json);
  Map<String, dynamic> toJson() => _$NationalityToJson(this);
}


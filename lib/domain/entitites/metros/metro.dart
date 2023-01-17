import 'package:json_annotation/json_annotation.dart';

part 'metro.g.dart';

@JsonSerializable()
class Metros {
  final int? id;
  final String? name;

  Metros({required this.id, required this.name});

  factory Metros.fromJson(Map<String, dynamic> json) => _$MetrosFromJson(json);

  Map<String, dynamic> toJson() => _$MetrosToJson(this);
}

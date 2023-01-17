import 'package:json_annotation/json_annotation.dart';

part 'seher.g.dart';

@JsonSerializable()
class Seherler {
  final int? id;
  final String? name;

  Seherler({required this.id, required this.name});

  factory Seherler.fromJson(Map<String, dynamic> json) =>
      _$SeherlerFromJson(json);

  Map<String, dynamic> toJson() => _$SeherlerToJson(this);
}

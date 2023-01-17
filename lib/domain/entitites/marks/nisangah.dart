import 'package:json_annotation/json_annotation.dart';

part 'nisangah.g.dart';

@JsonSerializable()
class Nisangah {
  final int? id;
  final String? name;

  Nisangah({required this.id, required this.name});

  factory Nisangah.fromJson(Map<String, dynamic> json) =>
      _$NisangahFromJson(json);

  Map<String, dynamic> toJson() => _$NisangahToJson(this);
}

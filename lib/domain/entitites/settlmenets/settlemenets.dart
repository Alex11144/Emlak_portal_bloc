import 'package:json_annotation/json_annotation.dart';

part 'settlemenets.g.dart';

@JsonSerializable(explicitToJson: true)
class SettlementsForAnnounces {
  final int? settlementId;
  final String? settlementName;

  SettlementsForAnnounces({
    required this.settlementId,
    required this.settlementName,
  });

  factory SettlementsForAnnounces.fromJson(Map<String, dynamic> json) =>
      _$SettlementsForAnnouncesFromJson(json);

  Map<String, dynamic> toJson() => _$SettlementsForAnnouncesToJson(this);
}

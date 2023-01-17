import 'package:json_annotation/json_annotation.dart';
part 'getImages.g.dart';

@JsonSerializable()
class ImageGetter {
  final List logoImages;

  ImageGetter({required this.logoImages});

  factory ImageGetter.fromJson(Map<String, dynamic> json) =>
      _$ImageGetterFromJson(json);

  Map<String, dynamic> toJson() => _$ImageGetterToJson(this);
}

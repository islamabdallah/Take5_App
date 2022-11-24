import 'package:freezed_annotation/freezed_annotation.dart';
part 'take5_together.freezed.dart';//same name of file
part 'take5_together.g.dart';

@freezed
class Take5TogetherModel with _$Take5TogetherModel{
  const factory Take5TogetherModel({
    int? participantDriverId,
    int? whoStartDriverId ,
    String? notes

  }) = _Take5TogetherModel;

  factory Take5TogetherModel.fromJson(Map<String, dynamic> json) => _$Take5TogetherModelFromJson(json);
}

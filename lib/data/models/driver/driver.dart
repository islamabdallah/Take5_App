import 'package:freezed_annotation/freezed_annotation.dart';
part 'driver.freezed.dart';//same name of file
part 'driver.g.dart';

@freezed
class Driver with _$Driver{
  const factory Driver({
    int? id,
    String? fullName,
  }) = _Driver;
  factory Driver.fromJson(Map<String, dynamic> json) => _$DriverFromJson(json);
}

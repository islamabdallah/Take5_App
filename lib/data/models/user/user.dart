import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'user.freezed.dart';

part 'user.g.dart';
@HiveType(typeId: 0)// unique id
@freezed
class User with _$User  {
  const factory User({
    @HiveField(0)
    required String userId,
    @HiveField(1)
    required int driverId,
    @HiveField(2)
    required String driverName,
    @HiveField(3)
    required int userUnSeenNotificationCount,
  }) = _User;
  factory  User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

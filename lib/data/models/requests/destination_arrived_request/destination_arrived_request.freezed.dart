// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'destination_arrived_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DestinationArrivedRequest _$DestinationArrivedRequestFromJson(
    Map<String, dynamic> json) {
  return _DestinationArrivedRequest.fromJson(json);
}

/// @nodoc
mixin _$DestinationArrivedRequest {
  String get userId => throw _privateConstructorUsedError;
  int get tripId => throw _privateConstructorUsedError;
  int get jobsiteId => throw _privateConstructorUsedError;
  DateTime get destinationArrivedDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DestinationArrivedRequestCopyWith<DestinationArrivedRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DestinationArrivedRequestCopyWith<$Res> {
  factory $DestinationArrivedRequestCopyWith(DestinationArrivedRequest value,
          $Res Function(DestinationArrivedRequest) then) =
      _$DestinationArrivedRequestCopyWithImpl<$Res, DestinationArrivedRequest>;
  @useResult
  $Res call(
      {String userId,
      int tripId,
      int jobsiteId,
      DateTime destinationArrivedDate});
}

/// @nodoc
class _$DestinationArrivedRequestCopyWithImpl<$Res,
        $Val extends DestinationArrivedRequest>
    implements $DestinationArrivedRequestCopyWith<$Res> {
  _$DestinationArrivedRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? tripId = null,
    Object? jobsiteId = null,
    Object? destinationArrivedDate = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      tripId: null == tripId
          ? _value.tripId
          : tripId // ignore: cast_nullable_to_non_nullable
              as int,
      jobsiteId: null == jobsiteId
          ? _value.jobsiteId
          : jobsiteId // ignore: cast_nullable_to_non_nullable
              as int,
      destinationArrivedDate: null == destinationArrivedDate
          ? _value.destinationArrivedDate
          : destinationArrivedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DestinationArrivedRequestCopyWith<$Res>
    implements $DestinationArrivedRequestCopyWith<$Res> {
  factory _$$_DestinationArrivedRequestCopyWith(
          _$_DestinationArrivedRequest value,
          $Res Function(_$_DestinationArrivedRequest) then) =
      __$$_DestinationArrivedRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId,
      int tripId,
      int jobsiteId,
      DateTime destinationArrivedDate});
}

/// @nodoc
class __$$_DestinationArrivedRequestCopyWithImpl<$Res>
    extends _$DestinationArrivedRequestCopyWithImpl<$Res,
        _$_DestinationArrivedRequest>
    implements _$$_DestinationArrivedRequestCopyWith<$Res> {
  __$$_DestinationArrivedRequestCopyWithImpl(
      _$_DestinationArrivedRequest _value,
      $Res Function(_$_DestinationArrivedRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? tripId = null,
    Object? jobsiteId = null,
    Object? destinationArrivedDate = null,
  }) {
    return _then(_$_DestinationArrivedRequest(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      tripId: null == tripId
          ? _value.tripId
          : tripId // ignore: cast_nullable_to_non_nullable
              as int,
      jobsiteId: null == jobsiteId
          ? _value.jobsiteId
          : jobsiteId // ignore: cast_nullable_to_non_nullable
              as int,
      destinationArrivedDate: null == destinationArrivedDate
          ? _value.destinationArrivedDate
          : destinationArrivedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DestinationArrivedRequest implements _DestinationArrivedRequest {
  const _$_DestinationArrivedRequest(
      {required this.userId,
      required this.tripId,
      required this.jobsiteId,
      required this.destinationArrivedDate});

  factory _$_DestinationArrivedRequest.fromJson(Map<String, dynamic> json) =>
      _$$_DestinationArrivedRequestFromJson(json);

  @override
  final String userId;
  @override
  final int tripId;
  @override
  final int jobsiteId;
  @override
  final DateTime destinationArrivedDate;

  @override
  String toString() {
    return 'DestinationArrivedRequest(userId: $userId, tripId: $tripId, jobsiteId: $jobsiteId, destinationArrivedDate: $destinationArrivedDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DestinationArrivedRequest &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.tripId, tripId) || other.tripId == tripId) &&
            (identical(other.jobsiteId, jobsiteId) ||
                other.jobsiteId == jobsiteId) &&
            (identical(other.destinationArrivedDate, destinationArrivedDate) ||
                other.destinationArrivedDate == destinationArrivedDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, userId, tripId, jobsiteId, destinationArrivedDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DestinationArrivedRequestCopyWith<_$_DestinationArrivedRequest>
      get copyWith => __$$_DestinationArrivedRequestCopyWithImpl<
          _$_DestinationArrivedRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DestinationArrivedRequestToJson(
      this,
    );
  }
}

abstract class _DestinationArrivedRequest implements DestinationArrivedRequest {
  const factory _DestinationArrivedRequest(
          {required final String userId,
          required final int tripId,
          required final int jobsiteId,
          required final DateTime destinationArrivedDate}) =
      _$_DestinationArrivedRequest;

  factory _DestinationArrivedRequest.fromJson(Map<String, dynamic> json) =
      _$_DestinationArrivedRequest.fromJson;

  @override
  String get userId;
  @override
  int get tripId;
  @override
  int get jobsiteId;
  @override
  DateTime get destinationArrivedDate;
  @override
  @JsonKey(ignore: true)
  _$$_DestinationArrivedRequestCopyWith<_$_DestinationArrivedRequest>
      get copyWith => throw _privateConstructorUsedError;
}

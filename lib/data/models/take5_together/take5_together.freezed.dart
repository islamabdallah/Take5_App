// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'take5_together.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Take5TogetherModel _$Take5TogetherModelFromJson(Map<String, dynamic> json) {
  return _Take5TogetherModel.fromJson(json);
}

/// @nodoc
mixin _$Take5TogetherModel {
  int? get participantDriverId => throw _privateConstructorUsedError;
  int? get whoStartDriverId => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $Take5TogetherModelCopyWith<Take5TogetherModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $Take5TogetherModelCopyWith<$Res> {
  factory $Take5TogetherModelCopyWith(
          Take5TogetherModel value, $Res Function(Take5TogetherModel) then) =
      _$Take5TogetherModelCopyWithImpl<$Res, Take5TogetherModel>;
  @useResult
  $Res call({int? participantDriverId, int? whoStartDriverId, String? notes});
}

/// @nodoc
class _$Take5TogetherModelCopyWithImpl<$Res, $Val extends Take5TogetherModel>
    implements $Take5TogetherModelCopyWith<$Res> {
  _$Take5TogetherModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? participantDriverId = freezed,
    Object? whoStartDriverId = freezed,
    Object? notes = freezed,
  }) {
    return _then(_value.copyWith(
      participantDriverId: freezed == participantDriverId
          ? _value.participantDriverId
          : participantDriverId // ignore: cast_nullable_to_non_nullable
              as int?,
      whoStartDriverId: freezed == whoStartDriverId
          ? _value.whoStartDriverId
          : whoStartDriverId // ignore: cast_nullable_to_non_nullable
              as int?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_Take5TogetherModelCopyWith<$Res>
    implements $Take5TogetherModelCopyWith<$Res> {
  factory _$$_Take5TogetherModelCopyWith(_$_Take5TogetherModel value,
          $Res Function(_$_Take5TogetherModel) then) =
      __$$_Take5TogetherModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? participantDriverId, int? whoStartDriverId, String? notes});
}

/// @nodoc
class __$$_Take5TogetherModelCopyWithImpl<$Res>
    extends _$Take5TogetherModelCopyWithImpl<$Res, _$_Take5TogetherModel>
    implements _$$_Take5TogetherModelCopyWith<$Res> {
  __$$_Take5TogetherModelCopyWithImpl(
      _$_Take5TogetherModel _value, $Res Function(_$_Take5TogetherModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? participantDriverId = freezed,
    Object? whoStartDriverId = freezed,
    Object? notes = freezed,
  }) {
    return _then(_$_Take5TogetherModel(
      participantDriverId: freezed == participantDriverId
          ? _value.participantDriverId
          : participantDriverId // ignore: cast_nullable_to_non_nullable
              as int?,
      whoStartDriverId: freezed == whoStartDriverId
          ? _value.whoStartDriverId
          : whoStartDriverId // ignore: cast_nullable_to_non_nullable
              as int?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Take5TogetherModel implements _Take5TogetherModel {
  const _$_Take5TogetherModel(
      {this.participantDriverId, this.whoStartDriverId, this.notes});

  factory _$_Take5TogetherModel.fromJson(Map<String, dynamic> json) =>
      _$$_Take5TogetherModelFromJson(json);

  @override
  final int? participantDriverId;
  @override
  final int? whoStartDriverId;
  @override
  final String? notes;

  @override
  String toString() {
    return 'Take5TogetherModel(participantDriverId: $participantDriverId, whoStartDriverId: $whoStartDriverId, notes: $notes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Take5TogetherModel &&
            (identical(other.participantDriverId, participantDriverId) ||
                other.participantDriverId == participantDriverId) &&
            (identical(other.whoStartDriverId, whoStartDriverId) ||
                other.whoStartDriverId == whoStartDriverId) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, participantDriverId, whoStartDriverId, notes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_Take5TogetherModelCopyWith<_$_Take5TogetherModel> get copyWith =>
      __$$_Take5TogetherModelCopyWithImpl<_$_Take5TogetherModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_Take5TogetherModelToJson(
      this,
    );
  }
}

abstract class _Take5TogetherModel implements Take5TogetherModel {
  const factory _Take5TogetherModel(
      {final int? participantDriverId,
      final int? whoStartDriverId,
      final String? notes}) = _$_Take5TogetherModel;

  factory _Take5TogetherModel.fromJson(Map<String, dynamic> json) =
      _$_Take5TogetherModel.fromJson;

  @override
  int? get participantDriverId;
  @override
  int? get whoStartDriverId;
  @override
  String? get notes;
  @override
  @JsonKey(ignore: true)
  _$$_Take5TogetherModelCopyWith<_$_Take5TogetherModel> get copyWith =>
      throw _privateConstructorUsedError;
}

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

TripDestinationArrivedModel _$TripDestinationArrivedModelFromJson(
    Map<String, dynamic> json) {
  return _TripDestinationArrivedModel.fromJson(json);
}

/// @nodoc
mixin _$TripDestinationArrivedModel {
  DateTime get destinationArrivedDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TripDestinationArrivedModelCopyWith<TripDestinationArrivedModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TripDestinationArrivedModelCopyWith<$Res> {
  factory $TripDestinationArrivedModelCopyWith(
          TripDestinationArrivedModel value,
          $Res Function(TripDestinationArrivedModel) then) =
      _$TripDestinationArrivedModelCopyWithImpl<$Res,
          TripDestinationArrivedModel>;
  @useResult
  $Res call({DateTime destinationArrivedDate});
}

/// @nodoc
class _$TripDestinationArrivedModelCopyWithImpl<$Res,
        $Val extends TripDestinationArrivedModel>
    implements $TripDestinationArrivedModelCopyWith<$Res> {
  _$TripDestinationArrivedModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? destinationArrivedDate = null,
  }) {
    return _then(_value.copyWith(
      destinationArrivedDate: null == destinationArrivedDate
          ? _value.destinationArrivedDate
          : destinationArrivedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TripDestinationArrivedModelCopyWith<$Res>
    implements $TripDestinationArrivedModelCopyWith<$Res> {
  factory _$$_TripDestinationArrivedModelCopyWith(
          _$_TripDestinationArrivedModel value,
          $Res Function(_$_TripDestinationArrivedModel) then) =
      __$$_TripDestinationArrivedModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime destinationArrivedDate});
}

/// @nodoc
class __$$_TripDestinationArrivedModelCopyWithImpl<$Res>
    extends _$TripDestinationArrivedModelCopyWithImpl<$Res,
        _$_TripDestinationArrivedModel>
    implements _$$_TripDestinationArrivedModelCopyWith<$Res> {
  __$$_TripDestinationArrivedModelCopyWithImpl(
      _$_TripDestinationArrivedModel _value,
      $Res Function(_$_TripDestinationArrivedModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? destinationArrivedDate = null,
  }) {
    return _then(_$_TripDestinationArrivedModel(
      destinationArrivedDate: null == destinationArrivedDate
          ? _value.destinationArrivedDate
          : destinationArrivedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TripDestinationArrivedModel implements _TripDestinationArrivedModel {
  const _$_TripDestinationArrivedModel({required this.destinationArrivedDate});

  factory _$_TripDestinationArrivedModel.fromJson(Map<String, dynamic> json) =>
      _$$_TripDestinationArrivedModelFromJson(json);

  @override
  final DateTime destinationArrivedDate;

  @override
  String toString() {
    return 'TripDestinationArrivedModel(destinationArrivedDate: $destinationArrivedDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TripDestinationArrivedModel &&
            (identical(other.destinationArrivedDate, destinationArrivedDate) ||
                other.destinationArrivedDate == destinationArrivedDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, destinationArrivedDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TripDestinationArrivedModelCopyWith<_$_TripDestinationArrivedModel>
      get copyWith => __$$_TripDestinationArrivedModelCopyWithImpl<
          _$_TripDestinationArrivedModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TripDestinationArrivedModelToJson(
      this,
    );
  }
}

abstract class _TripDestinationArrivedModel
    implements TripDestinationArrivedModel {
  const factory _TripDestinationArrivedModel(
          {required final DateTime destinationArrivedDate}) =
      _$_TripDestinationArrivedModel;

  factory _TripDestinationArrivedModel.fromJson(Map<String, dynamic> json) =
      _$_TripDestinationArrivedModel.fromJson;

  @override
  DateTime get destinationArrivedDate;
  @override
  @JsonKey(ignore: true)
  _$$_TripDestinationArrivedModelCopyWith<_$_TripDestinationArrivedModel>
      get copyWith => throw _privateConstructorUsedError;
}

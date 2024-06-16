// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'counpon.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Counpon _$CounponFromJson(Map<String, dynamic> json) {
  return _Counpon.fromJson(json);
}

/// @nodoc
mixin _$Counpon {
  int get id => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  bool get active => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CounponCopyWith<Counpon> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CounponCopyWith<$Res> {
  factory $CounponCopyWith(Counpon value, $Res Function(Counpon) then) =
      _$CounponCopyWithImpl<$Res, Counpon>;
  @useResult
  $Res call({int id, String code, bool active});
}

/// @nodoc
class _$CounponCopyWithImpl<$Res, $Val extends Counpon>
    implements $CounponCopyWith<$Res> {
  _$CounponCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? active = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CounponImplCopyWith<$Res> implements $CounponCopyWith<$Res> {
  factory _$$CounponImplCopyWith(
          _$CounponImpl value, $Res Function(_$CounponImpl) then) =
      __$$CounponImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String code, bool active});
}

/// @nodoc
class __$$CounponImplCopyWithImpl<$Res>
    extends _$CounponCopyWithImpl<$Res, _$CounponImpl>
    implements _$$CounponImplCopyWith<$Res> {
  __$$CounponImplCopyWithImpl(
      _$CounponImpl _value, $Res Function(_$CounponImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? active = null,
  }) {
    return _then(_$CounponImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CounponImpl implements _Counpon {
  _$CounponImpl({required this.id, required this.code, required this.active});

  factory _$CounponImpl.fromJson(Map<String, dynamic> json) =>
      _$$CounponImplFromJson(json);

  @override
  final int id;
  @override
  final String code;
  @override
  final bool active;

  @override
  String toString() {
    return 'Counpon(id: $id, code: $code, active: $active)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CounponImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.active, active) || other.active == active));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, code, active);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CounponImplCopyWith<_$CounponImpl> get copyWith =>
      __$$CounponImplCopyWithImpl<_$CounponImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CounponImplToJson(
      this,
    );
  }
}

abstract class _Counpon implements Counpon {
  factory _Counpon(
      {required final int id,
      required final String code,
      required final bool active}) = _$CounponImpl;

  factory _Counpon.fromJson(Map<String, dynamic> json) = _$CounponImpl.fromJson;

  @override
  int get id;
  @override
  String get code;
  @override
  bool get active;
  @override
  @JsonKey(ignore: true)
  _$$CounponImplCopyWith<_$CounponImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

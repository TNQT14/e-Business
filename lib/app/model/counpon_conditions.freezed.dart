// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'counpon_conditions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CounponConditions _$CounponConditionsFromJson(Map<String, dynamic> json) {
  return _CounponConditions.fromJson(json);
}

/// @nodoc
mixin _$CounponConditions {
  int get id => throw _privateConstructorUsedError;
  int get counponId => throw _privateConstructorUsedError;
  String get attribute => throw _privateConstructorUsedError;
  String get operator => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;
  double get discountAmount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CounponConditionsCopyWith<CounponConditions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CounponConditionsCopyWith<$Res> {
  factory $CounponConditionsCopyWith(
          CounponConditions value, $Res Function(CounponConditions) then) =
      _$CounponConditionsCopyWithImpl<$Res, CounponConditions>;
  @useResult
  $Res call(
      {int id,
      int counponId,
      String attribute,
      String operator,
      String value,
      double discountAmount});
}

/// @nodoc
class _$CounponConditionsCopyWithImpl<$Res, $Val extends CounponConditions>
    implements $CounponConditionsCopyWith<$Res> {
  _$CounponConditionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? counponId = null,
    Object? attribute = null,
    Object? operator = null,
    Object? value = null,
    Object? discountAmount = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      counponId: null == counponId
          ? _value.counponId
          : counponId // ignore: cast_nullable_to_non_nullable
              as int,
      attribute: null == attribute
          ? _value.attribute
          : attribute // ignore: cast_nullable_to_non_nullable
              as String,
      operator: null == operator
          ? _value.operator
          : operator // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      discountAmount: null == discountAmount
          ? _value.discountAmount
          : discountAmount // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CounponConditionsImplCopyWith<$Res>
    implements $CounponConditionsCopyWith<$Res> {
  factory _$$CounponConditionsImplCopyWith(_$CounponConditionsImpl value,
          $Res Function(_$CounponConditionsImpl) then) =
      __$$CounponConditionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int counponId,
      String attribute,
      String operator,
      String value,
      double discountAmount});
}

/// @nodoc
class __$$CounponConditionsImplCopyWithImpl<$Res>
    extends _$CounponConditionsCopyWithImpl<$Res, _$CounponConditionsImpl>
    implements _$$CounponConditionsImplCopyWith<$Res> {
  __$$CounponConditionsImplCopyWithImpl(_$CounponConditionsImpl _value,
      $Res Function(_$CounponConditionsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? counponId = null,
    Object? attribute = null,
    Object? operator = null,
    Object? value = null,
    Object? discountAmount = null,
  }) {
    return _then(_$CounponConditionsImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      counponId: null == counponId
          ? _value.counponId
          : counponId // ignore: cast_nullable_to_non_nullable
              as int,
      attribute: null == attribute
          ? _value.attribute
          : attribute // ignore: cast_nullable_to_non_nullable
              as String,
      operator: null == operator
          ? _value.operator
          : operator // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      discountAmount: null == discountAmount
          ? _value.discountAmount
          : discountAmount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CounponConditionsImpl implements _CounponConditions {
  _$CounponConditionsImpl(
      {required this.id,
      required this.counponId,
      required this.attribute,
      required this.operator,
      required this.value,
      required this.discountAmount});

  factory _$CounponConditionsImpl.fromJson(Map<String, dynamic> json) =>
      _$$CounponConditionsImplFromJson(json);

  @override
  final int id;
  @override
  final int counponId;
  @override
  final String attribute;
  @override
  final String operator;
  @override
  final String value;
  @override
  final double discountAmount;

  @override
  String toString() {
    return 'CounponConditions(id: $id, counponId: $counponId, attribute: $attribute, operator: $operator, value: $value, discountAmount: $discountAmount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CounponConditionsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.counponId, counponId) ||
                other.counponId == counponId) &&
            (identical(other.attribute, attribute) ||
                other.attribute == attribute) &&
            (identical(other.operator, operator) ||
                other.operator == operator) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.discountAmount, discountAmount) ||
                other.discountAmount == discountAmount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, counponId, attribute, operator, value, discountAmount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CounponConditionsImplCopyWith<_$CounponConditionsImpl> get copyWith =>
      __$$CounponConditionsImplCopyWithImpl<_$CounponConditionsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CounponConditionsImplToJson(
      this,
    );
  }
}

abstract class _CounponConditions implements CounponConditions {
  factory _CounponConditions(
      {required final int id,
      required final int counponId,
      required final String attribute,
      required final String operator,
      required final String value,
      required final double discountAmount}) = _$CounponConditionsImpl;

  factory _CounponConditions.fromJson(Map<String, dynamic> json) =
      _$CounponConditionsImpl.fromJson;

  @override
  int get id;
  @override
  int get counponId;
  @override
  String get attribute;
  @override
  String get operator;
  @override
  String get value;
  @override
  double get discountAmount;
  @override
  @JsonKey(ignore: true)
  _$$CounponConditionsImplCopyWith<_$CounponConditionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

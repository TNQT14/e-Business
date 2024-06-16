// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'social_account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SocialAccount _$SocialAccountFromJson(Map<String, dynamic> json) {
  return _SocialAccount.fromJson(json);
}

/// @nodoc
mixin _$SocialAccount {
  int get id => throw _privateConstructorUsedError;
  String get provider => throw _privateConstructorUsedError;
  String get providerId => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SocialAccountCopyWith<SocialAccount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SocialAccountCopyWith<$Res> {
  factory $SocialAccountCopyWith(
          SocialAccount value, $Res Function(SocialAccount) then) =
      _$SocialAccountCopyWithImpl<$Res, SocialAccount>;
  @useResult
  $Res call(
      {int id,
      String provider,
      String providerId,
      String email,
      String name,
      int userId});
}

/// @nodoc
class _$SocialAccountCopyWithImpl<$Res, $Val extends SocialAccount>
    implements $SocialAccountCopyWith<$Res> {
  _$SocialAccountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? provider = null,
    Object? providerId = null,
    Object? email = null,
    Object? name = null,
    Object? userId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      provider: null == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String,
      providerId: null == providerId
          ? _value.providerId
          : providerId // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SocialAccountImplCopyWith<$Res>
    implements $SocialAccountCopyWith<$Res> {
  factory _$$SocialAccountImplCopyWith(
          _$SocialAccountImpl value, $Res Function(_$SocialAccountImpl) then) =
      __$$SocialAccountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String provider,
      String providerId,
      String email,
      String name,
      int userId});
}

/// @nodoc
class __$$SocialAccountImplCopyWithImpl<$Res>
    extends _$SocialAccountCopyWithImpl<$Res, _$SocialAccountImpl>
    implements _$$SocialAccountImplCopyWith<$Res> {
  __$$SocialAccountImplCopyWithImpl(
      _$SocialAccountImpl _value, $Res Function(_$SocialAccountImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? provider = null,
    Object? providerId = null,
    Object? email = null,
    Object? name = null,
    Object? userId = null,
  }) {
    return _then(_$SocialAccountImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      provider: null == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String,
      providerId: null == providerId
          ? _value.providerId
          : providerId // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SocialAccountImpl implements _SocialAccount {
  _$SocialAccountImpl(
      {required this.id,
      required this.provider,
      required this.providerId,
      required this.email,
      required this.name,
      required this.userId});

  factory _$SocialAccountImpl.fromJson(Map<String, dynamic> json) =>
      _$$SocialAccountImplFromJson(json);

  @override
  final int id;
  @override
  final String provider;
  @override
  final String providerId;
  @override
  final String email;
  @override
  final String name;
  @override
  final int userId;

  @override
  String toString() {
    return 'SocialAccount(id: $id, provider: $provider, providerId: $providerId, email: $email, name: $name, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SocialAccountImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.providerId, providerId) ||
                other.providerId == providerId) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, provider, providerId, email, name, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SocialAccountImplCopyWith<_$SocialAccountImpl> get copyWith =>
      __$$SocialAccountImplCopyWithImpl<_$SocialAccountImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SocialAccountImplToJson(
      this,
    );
  }
}

abstract class _SocialAccount implements SocialAccount {
  factory _SocialAccount(
      {required final int id,
      required final String provider,
      required final String providerId,
      required final String email,
      required final String name,
      required final int userId}) = _$SocialAccountImpl;

  factory _SocialAccount.fromJson(Map<String, dynamic> json) =
      _$SocialAccountImpl.fromJson;

  @override
  int get id;
  @override
  String get provider;
  @override
  String get providerId;
  @override
  String get email;
  @override
  String get name;
  @override
  int get userId;
  @override
  @JsonKey(ignore: true)
  _$$SocialAccountImplCopyWith<_$SocialAccountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

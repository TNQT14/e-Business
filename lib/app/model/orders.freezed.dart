// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'orders.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Orders _$OrdersFromJson(Map<String, dynamic> json) {
  return _Orders.fromJson(json);
}

/// @nodoc
mixin _$Orders {
  int get id => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get note => throw _privateConstructorUsedError;
  DateTime get orderDate => throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;
  double get totalMoney => throw _privateConstructorUsedError;
  String get shippingMethod => throw _privateConstructorUsedError;
  String get shippingAddress => throw _privateConstructorUsedError;
  DateTime get shippingDate => throw _privateConstructorUsedError;
  String get trackingNumber => throw _privateConstructorUsedError;
  String get paymentMethod => throw _privateConstructorUsedError;
  bool get active => throw _privateConstructorUsedError;
  int get couponId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrdersCopyWith<Orders> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrdersCopyWith<$Res> {
  factory $OrdersCopyWith(Orders value, $Res Function(Orders) then) =
      _$OrdersCopyWithImpl<$Res, Orders>;
  @useResult
  $Res call(
      {int id,
      int userId,
      String fullName,
      String email,
      String phoneNumber,
      String address,
      String note,
      DateTime orderDate,
      Status status,
      double totalMoney,
      String shippingMethod,
      String shippingAddress,
      DateTime shippingDate,
      String trackingNumber,
      String paymentMethod,
      bool active,
      int couponId});
}

/// @nodoc
class _$OrdersCopyWithImpl<$Res, $Val extends Orders>
    implements $OrdersCopyWith<$Res> {
  _$OrdersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? fullName = null,
    Object? email = null,
    Object? phoneNumber = null,
    Object? address = null,
    Object? note = null,
    Object? orderDate = null,
    Object? status = null,
    Object? totalMoney = null,
    Object? shippingMethod = null,
    Object? shippingAddress = null,
    Object? shippingDate = null,
    Object? trackingNumber = null,
    Object? paymentMethod = null,
    Object? active = null,
    Object? couponId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      orderDate: null == orderDate
          ? _value.orderDate
          : orderDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      totalMoney: null == totalMoney
          ? _value.totalMoney
          : totalMoney // ignore: cast_nullable_to_non_nullable
              as double,
      shippingMethod: null == shippingMethod
          ? _value.shippingMethod
          : shippingMethod // ignore: cast_nullable_to_non_nullable
              as String,
      shippingAddress: null == shippingAddress
          ? _value.shippingAddress
          : shippingAddress // ignore: cast_nullable_to_non_nullable
              as String,
      shippingDate: null == shippingDate
          ? _value.shippingDate
          : shippingDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      trackingNumber: null == trackingNumber
          ? _value.trackingNumber
          : trackingNumber // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      couponId: null == couponId
          ? _value.couponId
          : couponId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrdersImplCopyWith<$Res> implements $OrdersCopyWith<$Res> {
  factory _$$OrdersImplCopyWith(
          _$OrdersImpl value, $Res Function(_$OrdersImpl) then) =
      __$$OrdersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int userId,
      String fullName,
      String email,
      String phoneNumber,
      String address,
      String note,
      DateTime orderDate,
      Status status,
      double totalMoney,
      String shippingMethod,
      String shippingAddress,
      DateTime shippingDate,
      String trackingNumber,
      String paymentMethod,
      bool active,
      int couponId});
}

/// @nodoc
class __$$OrdersImplCopyWithImpl<$Res>
    extends _$OrdersCopyWithImpl<$Res, _$OrdersImpl>
    implements _$$OrdersImplCopyWith<$Res> {
  __$$OrdersImplCopyWithImpl(
      _$OrdersImpl _value, $Res Function(_$OrdersImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? fullName = null,
    Object? email = null,
    Object? phoneNumber = null,
    Object? address = null,
    Object? note = null,
    Object? orderDate = null,
    Object? status = null,
    Object? totalMoney = null,
    Object? shippingMethod = null,
    Object? shippingAddress = null,
    Object? shippingDate = null,
    Object? trackingNumber = null,
    Object? paymentMethod = null,
    Object? active = null,
    Object? couponId = null,
  }) {
    return _then(_$OrdersImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      orderDate: null == orderDate
          ? _value.orderDate
          : orderDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      totalMoney: null == totalMoney
          ? _value.totalMoney
          : totalMoney // ignore: cast_nullable_to_non_nullable
              as double,
      shippingMethod: null == shippingMethod
          ? _value.shippingMethod
          : shippingMethod // ignore: cast_nullable_to_non_nullable
              as String,
      shippingAddress: null == shippingAddress
          ? _value.shippingAddress
          : shippingAddress // ignore: cast_nullable_to_non_nullable
              as String,
      shippingDate: null == shippingDate
          ? _value.shippingDate
          : shippingDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      trackingNumber: null == trackingNumber
          ? _value.trackingNumber
          : trackingNumber // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      couponId: null == couponId
          ? _value.couponId
          : couponId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrdersImpl implements _Orders {
  _$OrdersImpl(
      {required this.id,
      required this.userId,
      required this.fullName,
      required this.email,
      required this.phoneNumber,
      required this.address,
      required this.note,
      required this.orderDate,
      required this.status,
      this.totalMoney = 0,
      this.shippingMethod = '',
      this.shippingAddress = '',
      required this.shippingDate,
      this.trackingNumber = '',
      this.paymentMethod = '',
      this.active = false,
      this.couponId = 0});

  factory _$OrdersImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrdersImplFromJson(json);

  @override
  final int id;
  @override
  final int userId;
  @override
  final String fullName;
  @override
  final String email;
  @override
  final String phoneNumber;
  @override
  final String address;
  @override
  final String note;
  @override
  final DateTime orderDate;
  @override
  final Status status;
  @override
  @JsonKey()
  final double totalMoney;
  @override
  @JsonKey()
  final String shippingMethod;
  @override
  @JsonKey()
  final String shippingAddress;
  @override
  final DateTime shippingDate;
  @override
  @JsonKey()
  final String trackingNumber;
  @override
  @JsonKey()
  final String paymentMethod;
  @override
  @JsonKey()
  final bool active;
  @override
  @JsonKey()
  final int couponId;

  @override
  String toString() {
    return 'Orders(id: $id, userId: $userId, fullName: $fullName, email: $email, phoneNumber: $phoneNumber, address: $address, note: $note, orderDate: $orderDate, status: $status, totalMoney: $totalMoney, shippingMethod: $shippingMethod, shippingAddress: $shippingAddress, shippingDate: $shippingDate, trackingNumber: $trackingNumber, paymentMethod: $paymentMethod, active: $active, couponId: $couponId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrdersImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.orderDate, orderDate) ||
                other.orderDate == orderDate) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.totalMoney, totalMoney) ||
                other.totalMoney == totalMoney) &&
            (identical(other.shippingMethod, shippingMethod) ||
                other.shippingMethod == shippingMethod) &&
            (identical(other.shippingAddress, shippingAddress) ||
                other.shippingAddress == shippingAddress) &&
            (identical(other.shippingDate, shippingDate) ||
                other.shippingDate == shippingDate) &&
            (identical(other.trackingNumber, trackingNumber) ||
                other.trackingNumber == trackingNumber) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.couponId, couponId) ||
                other.couponId == couponId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      fullName,
      email,
      phoneNumber,
      address,
      note,
      orderDate,
      status,
      totalMoney,
      shippingMethod,
      shippingAddress,
      shippingDate,
      trackingNumber,
      paymentMethod,
      active,
      couponId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrdersImplCopyWith<_$OrdersImpl> get copyWith =>
      __$$OrdersImplCopyWithImpl<_$OrdersImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrdersImplToJson(
      this,
    );
  }
}

abstract class _Orders implements Orders {
  factory _Orders(
      {required final int id,
      required final int userId,
      required final String fullName,
      required final String email,
      required final String phoneNumber,
      required final String address,
      required final String note,
      required final DateTime orderDate,
      required final Status status,
      final double totalMoney,
      final String shippingMethod,
      final String shippingAddress,
      required final DateTime shippingDate,
      final String trackingNumber,
      final String paymentMethod,
      final bool active,
      final int couponId}) = _$OrdersImpl;

  factory _Orders.fromJson(Map<String, dynamic> json) = _$OrdersImpl.fromJson;

  @override
  int get id;
  @override
  int get userId;
  @override
  String get fullName;
  @override
  String get email;
  @override
  String get phoneNumber;
  @override
  String get address;
  @override
  String get note;
  @override
  DateTime get orderDate;
  @override
  Status get status;
  @override
  double get totalMoney;
  @override
  String get shippingMethod;
  @override
  String get shippingAddress;
  @override
  DateTime get shippingDate;
  @override
  String get trackingNumber;
  @override
  String get paymentMethod;
  @override
  bool get active;
  @override
  int get couponId;
  @override
  @JsonKey(ignore: true)
  _$$OrdersImplCopyWith<_$OrdersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

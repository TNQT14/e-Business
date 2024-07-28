import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String firstName;
  final String lastName;
  final String? image;
  final String verify_account;
  final String email;
  final String citizenPid;
  final String fullName;
  final String birthDate;
  final String gender;
  final String ethnic;
  final String religion;
  final String homeTown;
  final String regPlaceAddress;
  final String identifyCharacteristics;
  final String dateProvide;
  final String outOfDate;
  final String photoBase64;

  const User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.verify_account,
    this.image,
    required this.email,
    this.citizenPid ='',
    this.fullName ='',
    this.birthDate ='',
    this.gender ='',
    this.ethnic ='',
    this.religion ='',
    this.homeTown ='',
    this.regPlaceAddress ='',
    this.identifyCharacteristics ='',
    this.dateProvide ='',
    this.outOfDate ='',
    this.photoBase64 ='',
  });

  @override
  List<Object> get props => [
    id,
    firstName,
    lastName,
    email,
    verify_account,
    citizenPid,
    fullName,
    birthDate,
    gender,
    ethnic,
    religion,
    homeTown,
   regPlaceAddress, identifyCharacteristics,
    dateProvide,
    outOfDate,
    photoBase64,
  ];
}
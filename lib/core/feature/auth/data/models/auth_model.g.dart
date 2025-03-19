// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthModel _$AuthModelFromJson(Map<String, dynamic> json) => AuthModel(
  name: json['name'] as String?,
  surname: json['surname'] as String?,
  password: json['password'] as String?,
  phoneNumber: json['phoneNumber'] as String?,
  email: json['email'] as String?,
  address: json['address'] as String?,
  role: json['role'] as String?,
);

Map<String, dynamic> _$AuthModelToJson(AuthModel instance) => <String, dynamic>{
  'name': instance.name,
  'surname': instance.surname,
  'password': instance.password,
  'phoneNumber': instance.phoneNumber,
  'email': instance.email,
  'address': instance.address,
  'role': instance.role,
};

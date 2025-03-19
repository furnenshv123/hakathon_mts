// To parse this JSON data, do
//
//     final authModel = authModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'auth_model.g.dart';

AuthModel authModelFromJson(String str) => AuthModel.fromJson(json.decode(str));

String authModelToJson(AuthModel data) => json.encode(data.toJson());

@JsonSerializable()
class AuthModel {
    @JsonKey(name: "name")
    final String? name;
    @JsonKey(name: "surname")
    final String? surname;
    @JsonKey(name: "password")
    final String? password;
    @JsonKey(name: "phoneNumber")
    final String? phoneNumber;
    @JsonKey(name: "email")
    final String? email;
    @JsonKey(name: "address")
    final String? address;
    @JsonKey(name: "role")
    final String? role;

    AuthModel({
        this.name,
        this.surname,
        this.password,
        this.phoneNumber,
        this.email,
        this.address,
        this.role,
    });

    AuthModel copyWith({
        String? name,
        String? surname,
        String? password,
        String? phoneNumber,
        String? email,
        String? address,
        String? role,
    }) => 
        AuthModel(
            name: name ?? this.name,
            surname: surname ?? this.surname,
            password: password ?? this.password,
            phoneNumber: phoneNumber ?? this.phoneNumber,
            email: email ?? this.email,
            address: address ?? this.address,
            role: role ?? this.role,
        );

    factory AuthModel.fromJson(Map<String, dynamic> json) => _$AuthModelFromJson(json);

    Map<String, dynamic> toJson() => _$AuthModelToJson(this);
}

// To parse this JSON data, do
//
//     final tokenModel = tokenModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'token_model.g.dart';

TokenModel tokenModelFromJson(String str) => TokenModel.fromJson(json.decode(str));

String tokenModelToJson(TokenModel data) => json.encode(data.toJson());

@JsonSerializable()
class TokenModel {
    @JsonKey(name: "jwt")
    final String? jwt;

    TokenModel({
        this.jwt,
    });

    TokenModel copyWith({
        String? jwt,
    }) => 
        TokenModel(
            jwt: jwt ?? this.jwt,
        );

    factory TokenModel.fromJson(Map<String, dynamic> json) => _$TokenModelFromJson(json);

    Map<String, dynamic> toJson() => _$TokenModelToJson(this);
}

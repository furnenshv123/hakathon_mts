// To parse this JSON data, do
//
//     final sensorModel = sensorModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'sensor_model.g.dart';

SensorModel sensorModelFromJson(String str) => SensorModel.fromJson(json.decode(str));

String sensorModelToJson(SensorModel data) => json.encode(data.toJson());

@JsonSerializable()
class SensorModel {
    @JsonKey(name: "id")
    final int? id;
    @JsonKey(name: "name")
    final String? name;
    @JsonKey(name: "type")
    final String? type;
    @JsonKey(name: "latitude")
    final double? latitude;
    @JsonKey(name: "longitude")
    final double? longitude;

    SensorModel({
        this.id,
        this.name,
        this.type,
        this.latitude,
        this.longitude,
    });

    SensorModel copyWith({
        int? id,
        String? name,
        String? type,
        double? latitude,
        double? longitude,
    }) => 
        SensorModel(
            id: id ?? this.id,
            name: name ?? this.name,
            type: type ?? this.type,
            latitude: latitude ?? this.latitude,
            longitude: longitude ?? this.longitude,
        );

    factory SensorModel.fromJson(Map<String, dynamic> json) => _$SensorModelFromJson(json);

    Map<String, dynamic> toJson() => _$SensorModelToJson(this);
}

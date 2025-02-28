import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

class IconDataConverter
    implements JsonConverter<IconData, Map<String, dynamic>> {
  const IconDataConverter();

  @override
  IconData fromJson(Map<String, dynamic> json) {
    return IconData(
      json['codePoint'] as int,
      fontFamily: json['fontFamily'] as String?,
    );
  }

  @override
  Map<String, dynamic> toJson(IconData object) => {
        'codePoint': object.codePoint,
        'fontFamily': object.fontFamily,
      };
}

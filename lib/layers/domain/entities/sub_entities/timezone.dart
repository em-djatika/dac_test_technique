
import 'dart:convert';

import 'package:test_technique/layers/presentation/shared/constants/strings.dart';

class Timezone {
  String offset;
  String description;
  Timezone({
    required this.offset,
    required this.description,
  });

  Timezone copyWith({
    String? offset,
    String? description,
  }) {
    return Timezone(
      offset: offset ?? this.offset,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'offset': offset,
      'description': description,
    };
  }

  factory Timezone.fromMap(Map<String, dynamic> map) {
    return Timezone(
      offset: map['offset'] as String,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Timezone.fromJson(String source) =>
      Timezone.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Timezone(offset: $offset, description: $description)';

  @override
  bool operator ==(covariant Timezone other) {
    if (identical(this, other)) return true;

    return other.offset == offset && other.description == description;
  }

  @override
  int get hashCode => offset.hashCode ^ description.hashCode;
  static Timezone get empty {
    return Timezone(offset: nulls, description: nulls);
  }
}

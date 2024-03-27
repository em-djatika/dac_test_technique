
import 'dart:convert';

import 'package:test_technique/layers/presentation/shared/constants/strings.dart';

class Coordinates {
  String latitude;
  String longitude;
  Coordinates({
    required this.latitude,
    required this.longitude,
  });

  Coordinates copyWith({
    String? latitude,
    String? longitude,
  }) {
    return Coordinates(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory Coordinates.fromMap(Map<String, dynamic> map) {
    return Coordinates(
      latitude: map['latitude'] as String,
      longitude: map['longitude'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Coordinates.fromJson(String source) =>
      Coordinates.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Coordinates(latitude: $latitude, longitude: $longitude)';

  @override
  bool operator ==(covariant Coordinates other) {
    if (identical(this, other)) return true;

    return other.latitude == latitude && other.longitude == longitude;
  }

  @override
  int get hashCode => latitude.hashCode ^ longitude.hashCode;

  static Coordinates get empty {
    return Coordinates(latitude: nulls, longitude: nulls);
  }
}

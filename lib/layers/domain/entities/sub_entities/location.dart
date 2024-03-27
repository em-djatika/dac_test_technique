import 'dart:convert';

import 'package:test_technique/layers/domain/entities/sub_entities/street.dart';
import 'package:test_technique/layers/domain/entities/sub_entities/timezone.dart';
import 'package:test_technique/layers/presentation/shared/constants/strings.dart';

import 'coordinates.dart';

class Location {
  Street street;
  String city;
  String state;
  String country;
  dynamic postcode;
  Coordinates coordinates;
  Timezone timezone;
  Location({
    required this.street,
    required this.city,
    required this.state,
    required this.country,
    required this.postcode,
    required this.coordinates,
    required this.timezone,
  });

  Location copyWith({
    Street? street,
    String? city,
    String? state,
    String? country,
    int? postcode,
    Coordinates? coordinates,
    Timezone? timezone,
  }) {
    return Location(
      street: street ?? this.street,
      city: city ?? this.city,
      state: state ?? this.state,
      country: country ?? this.country,
      postcode: postcode ?? this.postcode,
      coordinates: coordinates ?? this.coordinates,
      timezone: timezone ?? this.timezone,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'street': street.toMap(),
      'city': city,
      'state': state,
      'country': country,
      'postcode': postcode,
      'coordinates': coordinates.toMap(),
      'timezone': timezone.toMap(),
    };
  }

  factory Location.fromMap(Map<String, dynamic> map) {
    return Location(
      street: Street.fromMap(map['street'] as Map<String, dynamic>),
      city: map['city'] as String,
      state: map['state'] as String,
      country: map['country'] as String,
      postcode: map['postcode'],
      coordinates:
          Coordinates.fromMap(map['coordinates'] as Map<String, dynamic>),
      timezone: Timezone.fromMap(map['timezone'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Location.fromJson(String source) =>
      Location.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Location(street: $street, city: $city, state: $state, country: $country, postcode: $postcode, coordinates: $coordinates, timezone: $timezone)';
  }

  @override
  bool operator ==(covariant Location other) {
    if (identical(this, other)) return true;

    return other.street == street &&
        other.city == city &&
        other.state == state &&
        other.country == country &&
        other.postcode == postcode &&
        other.coordinates == coordinates &&
        other.timezone == timezone;
  }

  @override
  int get hashCode {
    return street.hashCode ^
        city.hashCode ^
        state.hashCode ^
        country.hashCode ^
        postcode.hashCode ^
        coordinates.hashCode ^
        timezone.hashCode;
  }

  static Location get empty {
    return Location(
        street: Street.empty,
        city: nulls,
        state: nulls,
        country: nulls,
        postcode: nulls,
        coordinates: Coordinates.empty,
        timezone: Timezone.empty);
  }
}

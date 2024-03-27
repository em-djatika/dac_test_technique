// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:test_technique/layers/domain/entities/sub_entities/datage.dart';
import 'package:test_technique/layers/domain/entities/sub_entities/location.dart';
import 'package:test_technique/layers/domain/entities/sub_entities/name.dart';
import 'package:test_technique/layers/domain/entities/sub_entities/picture.dart';
import 'package:test_technique/layers/presentation/shared/constants/strings.dart';

class User {
  //For sqflite
  static String userTable = "Users";
  static String maleGender = "male";
  static String femaleGender = "female";
  static String allGender = "all";

  int? id;
  String gender;
  Name name;
  Location location;
  Datage dob;
  String phone;
  Picture picture;
  User({
    this.id,
    required this.gender,
    required this.name,
    required this.location,
    required this.dob,
    required this.phone,
    required this.picture,
  });

  User copyWith({
    int? id,
    String? gender,
    Name? name,
    Location? location,
    Datage? dob,
    String? phone,
    Picture? picture,
  }) {
    return User(
      id: id ?? this.id,
      gender: gender ?? this.gender,
      name: name ?? this.name,
      location: location ?? this.location,
      dob: dob ?? this.dob,
      phone: phone ?? this.phone,
      picture: picture ?? this.picture,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'gender': gender,
      'name': jsonEncode(name.toMap()),
      'location': jsonEncode(location.toMap()),
      'dob': jsonEncode(dob.toMap()),
      'phone': phone,
      'picture': jsonEncode(picture.toMap()),
    };
  }

  factory User.sqFromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] != null ? map['id'] as int : null,
      gender: map['gender'] as String,
      name: Name.fromMap(jsonDecode(map['name'])),
      location: Location.fromMap(jsonDecode(map['location'])),
      dob: Datage.fromMap(jsonDecode(map['dob'])),
      phone: map['phone'] as String,
      picture: Picture.fromMap(jsonDecode(map['picture'])),
    );
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      gender: map['gender'] as String,
      name: Name.fromMap(map['name'] as Map<String, dynamic>),
      location: Location.fromMap(map['location'] as Map<String, dynamic>),
      dob: Datage.fromMap(map['dob'] as Map<String, dynamic>),
      phone: map['phone'] as String,
      picture: Picture.fromMap(map['picture'] as Map<String, dynamic>),
    );
  }

  @override
  String toString() {
    return 'User(id: $id, gender: $gender, name: $name, location: $location, dob: $dob, phone: $phone, picture: $picture)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.gender == gender &&
        other.name == name &&
        other.location == location &&
        other.dob == dob &&
        other.phone == phone &&
        other.picture == picture;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        gender.hashCode ^
        name.hashCode ^
        location.hashCode ^
        dob.hashCode ^
        phone.hashCode ^
        picture.hashCode;
  }

  static User get empty {
    return User(
        gender: "male",
        name: Name.empty,
        location: Location.empty,
        dob: Datage.empty,
        phone: nulls,
        picture: Picture.empty);
  }
}





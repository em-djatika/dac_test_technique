
import 'dart:convert';

import 'package:test_technique/layers/presentation/shared/constants/strings.dart';

class Datage {
  String date;
  int age;
  Datage({
    required this.date,
    required this.age,
  });

  Datage copyWith({
    String? date,
    int? age,
  }) {
    return Datage(
      date: date ?? this.date,
      age: age ?? this.age,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'date': date,
      'age': age,
    };
  }

  factory Datage.fromMap(Map<String, dynamic> map) {
    return Datage(
      date: map['date'] as String,
      age: map['age'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Datage.fromJson(String source) =>
      Datage.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Datage(date: $date, age: $age)';

  @override
  bool operator ==(covariant Datage other) {
    if (identical(this, other)) return true;

    return other.date == date && other.age == age;
  }

  @override
  int get hashCode => date.hashCode ^ age.hashCode;
  static Datage get empty {
    return Datage(date: nulls, age: 0);
  }
}

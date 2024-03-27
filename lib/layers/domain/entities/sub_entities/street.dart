
import 'dart:convert';

import 'package:test_technique/layers/presentation/shared/constants/strings.dart';

class Street {
  int number;
  String name;
  Street({
    required this.number,
    required this.name,
  });

  Street copyWith({
    int? number,
    String? name,
  }) {
    return Street(
      number: number ?? this.number,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'number': number,
      'name': name,
    };
  }

  factory Street.fromMap(Map<String, dynamic> map) {
    return Street(
      number: map['number'] as int,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Street.fromJson(String source) =>
      Street.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Street(number: $number, name: $name)';

  @override
  bool operator ==(covariant Street other) {
    if (identical(this, other)) return true;

    return other.number == number && other.name == name;
  }

  @override
  int get hashCode => number.hashCode ^ name.hashCode;

  static Street get empty {
    return Street(number: 0, name: nulls);
  }
}

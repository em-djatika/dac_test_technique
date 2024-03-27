import 'dart:convert';

import 'package:test_technique/layers/presentation/shared/constants/strings.dart';

class Name {
  String title;
  String first;
  String last;
  Name({
    required this.title,
    required this.first,
    required this.last,
  });

  Name copyWith({
    String? title,
    String? first,
    String? last,
  }) {
    return Name(
      title: title ?? this.title,
      first: first ?? this.first,
      last: last ?? this.last,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'first': first,
      'last': last,
    };
  }

  factory Name.fromMap(Map<String, dynamic> map) {
    return Name(
      title: map['title'] as String,
      first: map['first'] as String,
      last: map['last'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Name.fromJson(String source) =>
      Name.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Name(title: $title, first: $first, last: $last)';

  @override
  bool operator ==(covariant Name other) {
    if (identical(this, other)) return true;

    return other.title == title && other.first == first && other.last == last;
  }

  @override
  int get hashCode => title.hashCode ^ first.hashCode ^ last.hashCode;

  static Name get empty {
    return Name(title: nulls, first: nulls, last: nulls);
  }
}

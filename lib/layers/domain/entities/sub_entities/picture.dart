import 'dart:convert';

import 'package:test_technique/layers/presentation/shared/constants/strings.dart';

class Picture {
  String large;
  String medium;
  String thumbnail;
  Picture({
    required this.large,
    required this.medium,
    required this.thumbnail,
  });

  Picture copyWith({
    String? large,
    String? medium,
    String? thumbnail,
  }) {
    return Picture(
      large: large ?? this.large,
      medium: medium ?? this.medium,
      thumbnail: thumbnail ?? this.thumbnail,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'large': large,
      'medium': medium,
      'thumbnail': thumbnail,
    };
  }

  factory Picture.fromMap(Map<String, dynamic> map) {
    return Picture(
      large: map['large'] as String,
      medium: map['medium'] as String,
      thumbnail: map['thumbnail'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Picture.fromJson(String source) =>
      Picture.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Picture(large: $large, medium: $medium, thumbnail: $thumbnail)';

  @override
  bool operator ==(covariant Picture other) {
    if (identical(this, other)) return true;

    return other.large == large &&
        other.medium == medium &&
        other.thumbnail == thumbnail;
  }

  @override
  int get hashCode => large.hashCode ^ medium.hashCode ^ thumbnail.hashCode;

  static Picture get empty {
    return Picture(large: nulls, medium: nulls, thumbnail: nulls);
  }
}

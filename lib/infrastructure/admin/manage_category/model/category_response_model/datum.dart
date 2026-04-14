import 'dart:convert';

class Datum {
  String? id;
  String? name;
  String? image;

  Datum({this.id, this.name, this.image});

  factory Datum.fromMap(Map<String, dynamic> data) => Datum(
    id: data['id'] as String?,
    name: data['name'] as String?,
    image: data['image'] as String?,
  );

  Map<String, dynamic> toMap() => {'id': id, 'name': name, 'image': image};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Datum].
  factory Datum.fromJson(String data) {
    return Datum.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Datum] to a JSON string.
  String toJson() => json.encode(toMap());
}

import 'dart:convert';

class StatusHistory {
  String? status;
  String? note;
  String? id;
  DateTime? updatedAt;
  String? updatedBy;

  StatusHistory({
    this.status,
    this.note,
    this.id,
    this.updatedAt,
    this.updatedBy,
  });

  factory StatusHistory.fromMap(Map<String, dynamic> data) => StatusHistory(
    status: data['status'] as String?,
    note: data['note'] as String?,
    id: data['_id'] as String?,
    updatedAt: data['updated_at'] == null
        ? null
        : DateTime.parse(data['updated_at'] as String),
    updatedBy: data['updated_by'] as String?,
  );

  Map<String, dynamic> toMap() => {
    'status': status,
    'note': note,
    '_id': id,
    'updated_at': updatedAt?.toIso8601String(),
    'updated_by': updatedBy,
  };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [StatusHistory].
  factory StatusHistory.fromJson(String data) {
    return StatusHistory.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [StatusHistory] to a JSON string.
  String toJson() => json.encode(toMap());
}

import 'dart:convert';

class unknowndatamodel {
  final int page;
  final int totalpages;
  final List<unknownmodel> data;
  unknowndatamodel({
    required this.page,
    required this.totalpages,
    required this.data,
  });

  factory unknowndatamodel.fromMap(Map<String, dynamic> map) {
    return unknowndatamodel(
      page: map['page']?.toInt() ?? 0,
      totalpages: map['total_pages']?.toInt() ?? 0,
      data: List.from(map['data'])
          .map((obj) => unknownmodel.fromMap(obj))
          .toList(),
    );
  }
}

class unknownmodel {
  final int id;
  final String name;
  final int year;
  final String color;
  // ignore: non_constant_identifier_names
  final String pantone_value;
  unknownmodel({
    required this.id,
    required this.name,
    required this.year,
    required this.color,
    // ignore: non_constant_identifier_names
    required this.pantone_value,
  });

  factory unknownmodel.fromMap(Map<String, dynamic> map) {
    return unknownmodel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      year: map['year']?.toInt() ?? 0,
      color: map['color'] ?? '',
      pantone_value: map['pantone_value'] ?? '',
    );
  }
}

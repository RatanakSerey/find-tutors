class Language {
  final String code;
  final String name;
  Language({this.code, this.name});

  factory Language.fromMap(Map map) {
    return Language(
      code: map['code'],
      name: map['name'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'name': name,
    };
  }
}

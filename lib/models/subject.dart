class Subject {
  String id;
  String khName;
  String enName;
  String path;

  Subject({this.id, this.khName, this.enName, this.path});

  factory Subject.fromMap(Map map) {
    return Subject(
      id: map['_id'],
      khName: map['khName'],
      enName: map['enName'],
      path: map['path'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'khName': khName,
      'enName': enName,
      'path': path,
    };
  }
}

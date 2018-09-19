class Subject {
  String id;
  String khName;
  String enName;

  Subject({this.id, this.khName, this.enName});

factory Subject.fromMap(Map map) {
    return Subject(
      khName: map['khName'],
      enName: map['enName'],
      id: map['_id'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'khName': khName,
      'enName': enName,
      '_id': id,
    };
  }
}
class Subject {
  String id;
  String khName;
  String enName;

  Subject({this.id, this.khName, this.enName});

  Subject.fromMap(Map<String, dynamic> map)
      : khName = map['khName'] as String,
        enName = map['enName'] as String,
        id = map['_id'] as String;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['khName'] = khName;
    map['enName'] = enName;
    map['_id'] = id;
    return map;
  }
}
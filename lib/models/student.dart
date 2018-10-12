class LocationData {
  final String longitude;
  final String latitude;
  LocationData({this.longitude, this.latitude});

  factory LocationData.fromMap(Map map) {
    return LocationData(
      longitude: map['longitude'],
      latitude: map['latitude'],
    );
  }
  Map<String, String> toMap() {
    return {'longitude': longitude, 'latitude': latitude};
  }
}

class Student {
  final String id;
  final String khName;
  final String enName;
  final String gender;
  final DateTime dob;
  final String password;
  final String photo;
  final String email;
  final String address;
  final LocationData location;
  final String phoneNumber;
  final DateTime createdDate;
  Student({
    this.id,
    this.khName,
    this.enName,
    this.gender,
    this.dob,
    this.password,
    this.photo,
    this.email,
    this.address,
    this.location,
    this.phoneNumber,
    this.createdDate,
  });

  factory Student.fromMap(Map map) {
    return Student(
      id: map['_id'],
      khName: map['khName'],
      enName: map['enName'],
      gender: map['gender'],
      dob: map['dob'],
      password: map['password'],
      photo: map['photo'],
      email: map['email'],
      address: map['address'],
      location: map['loaction'] as LocationData,
      phoneNumber: map['phoneNumber'],
      createdDate: map['createdDate'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'khName': khName,
      'enName': enName,
      'gender': gender,
      'dob': dob,
      'password': password,
      'photo': photo,
      'email': email,
      'address': address,
      'location': location,
      'phoneNumber': phoneNumber,
      'createdDate': createdDate,
    };
  }
}

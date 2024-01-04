class StudentModel {
  StudentModel({
    this.id,
    this.contactInfo,
    this.registeredCourses,
    required this.averageScore,
    required this.dateOfBirth,
    required this.className,
    required this.fullName,
    this.createdAt,
    this.updatedAt,
  });

  late final String? id;
  late final ContactInfo? contactInfo; // Make it nullable
  late final List<String>? registeredCourses; // Make it nullable
  late final double averageScore;
  late final int? dateOfBirth; // Make it nullable
  late final String? className; // Make it nullable
  late final String? fullName; // Make it nullable
  late final String? createdAt; // Make it nullable
  late final String? updatedAt; // Make it nullable

  StudentModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    contactInfo = json['contactInfo'] != null ? ContactInfo.fromJson(json['contactInfo']) : null;
    registeredCourses = List<String>.from(json['registeredCourses'] ?? const []);
    averageScore = (json['averageScore'] ?? 0).toDouble(); // Convert to double
    dateOfBirth = json['dateOfBirth'];
    className = json['class'];
    fullName = json['fullName'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['contactInfo'] = contactInfo?.toJson();
    _data['registeredCourses'] = registeredCourses ?? [];
    _data['averageScore'] = averageScore ?? 0.0;
    _data['dateOfBirth'] = dateOfBirth ?? 0;
    _data['class'] = className ?? '';
    _data['fullName'] = fullName ?? '';
    return _data;
  }
}

class ContactInfo {
  ContactInfo({
    required this.address,
    required this.email,
    required this.phoneNumber,
    // this.id,
  });

  late final String address;
  late final String email;
  late final String phoneNumber;

  ContactInfo.fromJson(Map<String, dynamic> json) {
    address = json['address'] ?? '';
    email = json['email'] ?? '';
    phoneNumber = json['phoneNumber'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['address'] = address;
    _data['email'] = email;
    _data['phoneNumber'] = phoneNumber;
    return _data;
  }
}

List<Map<String, dynamic>> data_student = [
  {
    "_id": "6594f74f64fb8a6010196d2b",
    "contactInfo": {"address": "Lý Sơn", "email": "bigdipper201201@gmail.com", "phoneNumber": "", "_id": "6594f74f64fb8a6010196d2a"},
    "registeredCourses": ["[]"],
    "averageScore": 3.90,
    "dateOfBirth": 22102003,
    "class": "1811",
    "fullName": "Nguyen Thi Mai Thi",
    "createdAt": "2024-01-03T05:57:35.544Z",
    "updatedAt": "2024-01-03T06:08:27.206Z"
  },
  {
    "_id": "6594f74f64fb8a6010196d2b",
    "contactInfo": {"address": "Lý Sơn", "email": "bigdipper201201@gmail.com", "phoneNumber": "", "_id": "6594f74f64fb8a6010196d2a"},
    "registeredCourses": ["[]"],
    "averageScore": 3.90,
    "dateOfBirth": 22102003,
    "class": "1811",
    "fullName": "Nguyen Thi Mai Thi",
    "createdAt": "2024-01-03T05:57:35.544Z",
    "updatedAt": "2024-01-03T06:08:27.206Z"
  },
  {
    "_id": "6594f74f64fb8a6010196d2b",
    "contactInfo": {"address": "Lý Sơn", "email": "bigdipper201201@gmail.com", "phoneNumber": "", "_id": "6594f74f64fb8a6010196d2a"},
    "registeredCourses": ["[]"],
    "averageScore": 3.90,
    "dateOfBirth": 22102003,
    "class": "1811",
    "fullName": "Nguyen Thi Mai Thi",
    "createdAt": "2024-01-03T05:57:35.544Z",
    "updatedAt": "2024-01-03T06:08:27.206Z"
  },
  {
    "_id": "6594f74f64fb8a6010196d2b",
    "contactInfo": {"address": "Lý Sơn", "email": "bigdipper201201@gmail.com", "phoneNumber": "", "_id": "6594f74f64fb8a6010196d2a"},
    "registeredCourses": ["[]"],
    "averageScore": 3.90,
    "dateOfBirth": 22102003,
    "class": "1811",
    "fullName": "Nguyen Thi Mai Thi",
    "createdAt": "2024-01-03T05:57:35.544Z",
    "updatedAt": "2024-01-03T06:08:27.206Z"
  },
  {
    "_id": "6594f74f64fb8a6010196d2b",
    "contactInfo": {"address": "Lý Sơn", "email": "bigdipper201201@gmail.com", "phoneNumber": "", "_id": "6594f74f64fb8a6010196d2a"},
    "registeredCourses": ["[]"],
    "averageScore": 3.90,
    "dateOfBirth": 22102003,
    "class": "1811",
    "fullName": "Nguyen Thi Mai Thi",
    "createdAt": "2024-01-03T05:57:35.544Z",
    "updatedAt": "2024-01-03T06:08:27.206Z"
  },
  {
    "_id": "6594f74f64fb8a6010196d2b",
    "contactInfo": {"address": "Lý Sơn", "email": "bigdipper201201@gmail.com", "phoneNumber": "", "_id": "6594f74f64fb8a6010196d2a"},
    "registeredCourses": ["[]"],
    "averageScore": 3.90,
    "dateOfBirth": 22102003,
    "class": "1811",
    "fullName": "Nguyen Thi Mai Thi",
    "createdAt": "2024-01-03T05:57:35.544Z",
    "updatedAt": "2024-01-03T06:08:27.206Z"
  },
  {
    "_id": "6594f74f64fb8a6010196d2b",
    "contactInfo": {"address": "Lý Sơn", "email": "bigdipper201201@gmail.com", "phoneNumber": "", "_id": "6594f74f64fb8a6010196d2a"},
    "registeredCourses": ["[]"],
    "averageScore": 3.90,
    "dateOfBirth": 22102003,
    "class": "1811",
    "fullName": "Nguyen Thi Mai Thi",
    "createdAt": "2024-01-03T05:57:35.544Z",
    "updatedAt": "2024-01-03T06:08:27.206Z"
  },
  {
    "_id": "6594f74f64fb8a6010196d2b",
    "contactInfo": {"address": "Lý Sơn", "email": "bigdipper201201@gmail.com", "phoneNumber": "", "_id": "6594f74f64fb8a6010196d2a"},
    "registeredCourses": ["[]"],
    "averageScore": 3.90,
    "dateOfBirth": 22102003,
    "class": "1811",
    "fullName": "Nguyen Thi Mai Thi",
    "createdAt": "2024-01-03T05:57:35.544Z",
    "updatedAt": "2024-01-03T06:08:27.206Z"
  },
  {
    "_id": "6594f74f64fb8a6010196d2b",
    "contactInfo": {"address": "Lý Sơn", "email": "bigdipper201201@gmail.com", "phoneNumber": "", "_id": "6594f74f64fb8a6010196d2a"},
    "registeredCourses": ["[]"],
    "averageScore": 3.90,
    "dateOfBirth": 22102003,
    "class": "1811",
    "fullName": "Nguyen Thi Mai Thi",
    "createdAt": "2024-01-03T05:57:35.544Z",
    "updatedAt": "2024-01-03T06:08:27.206Z"
  },
  {
    "_id": "6594f74f64fb8a6010196d2b",
    "contactInfo": {"address": "Lý Sơn", "email": "bigdipper201201@gmail.com", "phoneNumber": "", "_id": "6594f74f64fb8a6010196d2a"},
    "registeredCourses": ["[]"],
    "averageScore": 3.90,
    "dateOfBirth": 22102003,
    "class": "1811",
    "fullName": "Nguyen Thi Mai Thi",
    "createdAt": "2024-01-03T05:57:35.544Z",
    "updatedAt": "2024-01-03T06:08:27.206Z"
  },
  {
    "_id": "6594f74f64fb8a6010196d2b",
    "contactInfo": {"address": "Lý Sơn", "email": "bigdipper201201@gmail.com", "phoneNumber": "", "_id": "6594f74f64fb8a6010196d2a"},
    "registeredCourses": ["[]"],
    "averageScore": 3.90,
    "dateOfBirth": 22102003,
    "class": "1811",
    "fullName": "Nguyen Thi Mai Thi",
    "createdAt": "2024-01-03T05:57:35.544Z",
    "updatedAt": "2024-01-03T06:08:27.206Z"
  },
  {
    "_id": "6594f74f64fb8a6010196d2b",
    "contactInfo": {"address": "Lý Sơn", "email": "bigdipper201201@gmail.com", "phoneNumber": "", "_id": "6594f74f64fb8a6010196d2a"},
    "registeredCourses": ["[]"],
    "averageScore": 3.90,
    "dateOfBirth": 22102003,
    "class": "1811",
    "fullName": "Nguyen Thi Mai Thi",
    "createdAt": "2024-01-03T05:57:35.544Z",
    "updatedAt": "2024-01-03T06:08:27.206Z"
  },
];

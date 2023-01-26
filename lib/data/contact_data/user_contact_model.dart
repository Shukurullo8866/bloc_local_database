
class UserFields {
  static String id = "id";
  static String name = "name";
  static String phoneNumber = "phoneNumber";
  static String createdAt = "createdAt";
}

class UserModel {
  final int? id;
  final String name;
  final String phoneNumber;
  final String createdAt;

  UserModel({
    this.id,
    required this.name,
    required this.phoneNumber,
    required this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int? ?? -1,
      name: json['name'] as String? ?? '',
      phoneNumber: json['phoneNumber'] as String? ?? '',
      createdAt: json['createdAt'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phoneNumber': phoneNumber,
      'createdAt': createdAt,
    };
  }

  UserModel copyWith({
    int? id,
    String? name,
    String? phoneNumber,
    String? createdAt,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

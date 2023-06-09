import 'dart:convert';

class User {
  int? id;
  String? name;
  String? avatar;
  String? createdDate;

  User({this.id, this.name, this.avatar, this.createdDate});

  @override
  String toString() {
    return 'User(id: $id, name: $name, avatar: $avatar, createdDate: $createdDate)';
  }

  factory User.fromMap(Map<String, dynamic> data) => User(
        id: data['id'] as int?,
        name: data['name'] as String?,
        avatar: data['avatar'] as String?,
        createdDate: data['createdDate'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'avatar': avatar,
        'createdDate': createdDate,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [User].
  factory User.fromJson(String data) {
    return User.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [User] to a JSON string.
  String toJson() => json.encode(toMap());
}

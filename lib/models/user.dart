part of 'models.dart';

class User extends Equatable {
  final int? id;
  final String? email;
  final String? name;
  final String? avatar;
  static String? token;

  const User({
    this.id,
    this.email,
    this.name,
    this.avatar,
  });

  User copyWith({int? id, String? email, String? name, String? avatar}) => User(
        id: id ?? this.id,
        email: email ?? this.email,
        name: name ?? this.name,
        avatar: avatar ?? this.avatar,
      );

  factory User.fromJSON(Map<String, dynamic> data) => User(
        id: data['id'],
        name: data['name'],
        email: data['email'],
        avatar: data['avatar'],
      );

  @override
  List<Object?> get props => [id, name, email, avatar];
}

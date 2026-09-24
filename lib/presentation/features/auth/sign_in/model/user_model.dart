import 'package:base_project/util/validator.dart';
import 'package:equatable/equatable.dart';

/// Logged in user. Change the fields to match your API.
class UserModel extends Equatable {
  final String id;
  final String name;
  final String email;
  final String token;
  final String profileImage;

  const UserModel({
    this.id = '',
    this.name = '',
    this.email = '',
    this.token = '',
    this.profileImage = '',
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: Types.getString(json['id']),
        name: Types.getString(json['name']),
        email: Types.getString(json['email']),
        token: Types.getString(json['token']),
        profileImage: Types.getString(json['profile_image']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'token': token,
        'profile_image': profileImage,
      };

  @override
  List<Object?> get props => [id, name, email, token, profileImage];
}

import 'package:json_annotation/json_annotation.dart';

part 'user_response_model.g.dart';
@JsonSerializable()
class User {
  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.website,
  });
  late final int id;
  late final String name;
  late final String username;
  late final String email;
  late final String phone;
  late final String website;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

}


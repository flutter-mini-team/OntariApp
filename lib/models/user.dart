
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: 'id')
  final String? id;

  @JsonKey(name: 'username')
  final String? username;

  @JsonKey(name: 'first_name')
  final String? firstName;

  @JsonKey(name: 'last_name')
  final String? lastName;

  @JsonKey(name: 'email')
  final String? email;

  @JsonKey(name: 'avatar')
  final String? avatar;

  User({
    this.id,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.avatar
  });

  // String get displayFirstName => firstName ?? '';

  // String get displayName => [firstName ?? '', lastName ?? ''].join(' ').trim();

  // String get displayUsername => '@${username ?? ""}';

  // String get imgUrl {
  //   return avatar?.cloudUrl() ?? '';
  // }

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

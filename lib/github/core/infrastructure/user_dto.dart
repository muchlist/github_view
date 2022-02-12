// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:github_view/github/core/domain/user.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
class UserDTO with _$UserDTO {
  const UserDTO._();
  const factory UserDTO({
    @JsonKey(name: 'login')
    required String name,
    @JsonKey(name: 'avatar_url')
    required String avatarUrl,
  }) = _UserDTO;

  // factory UserDTO.fromJson(Map<String, dynamic> json) {
  //   return UserDTO(
  //     name: json['login'] as String,
  //     avatarUrl: json['avatar_url'] as String,
  //   );
  // }
  factory UserDTO.fromJson(Map<String, dynamic> json) =>
      _$UserDTOFromJson(json);

  factory UserDTO.fromDomain(User u) {
    return UserDTO(name: u.name, avatarUrl: u.avatarUrl);
  }

  User toDomain() {
    return User(name: name, avatarUrl: avatarUrl);
  }
}

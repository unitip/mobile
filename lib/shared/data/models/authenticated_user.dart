import 'package:freezed_annotation/freezed_annotation.dart';

part 'authenticated_user.freezed.dart';
part 'authenticated_user.g.dart';

@freezed
class AuthenticatedUser with _$AuthenticatedUser {
  const factory AuthenticatedUser({
    required String id,
    required String name,
    required String email,
    required String token,
  }) = _AuthenticatedUser;

  factory AuthenticatedUser.fromJson(Map<String, dynamic> json) =>
      _$AuthenticatedUserFromJson(json);
}

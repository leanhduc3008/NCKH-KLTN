import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  @JsonSerializable(explicitToJson: true)
  const factory User({
    String? id,
    @Default('') String username,
    @Default('') String fullName,
    @Default(false) bool isAdmin,
  }) = _User;
  // From JSON
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  // To JSON
  const User._();
}

import 'package:api/api.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()

/// {@template note}
/// Class that containts user data
/// {@endtemplate}
class User {
  /// {@macro note}
  User({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.dateOfBirth,
  });

  /// Converts a JSON [Map] into a [User] instance.
  factory User.fromJson(JsonMap json) => _$UserFromJson(json);

  ///
  final String firstName;

  ///
  final String lastName;

  ///
  final String email;

  ///
  final DateTime dateOfBirth;

  /// Converts this [User] instance into a JSON [Map].
  JsonMap toJson() => _$UserToJson(this);
}

import 'package:api/api.dart';
import 'package:json_annotation/json_annotation.dart';

part 'note.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)

/// {@template note}
/// Class that containts user data
/// {@endtemplate}
class Note {
  /// {@macro note}
  Note({
    required this.id,
    required this.title,
    required this.body,
    required this.date,
    required this.color,
  });

  /// Converts a JSON [Map] into a [Note] instance.
  factory Note.fromJson(JsonMap json) => _$NoteFromJson(json);

  ///
  final int id;

  ///
  final String title;

  ///
  final String body;

  ///
  final DateTime date;

  ///
  final int color;

  /// Converts this [Note] instance into a JSON [Map].
  JsonMap toJson() => _$NoteToJson(this);
}

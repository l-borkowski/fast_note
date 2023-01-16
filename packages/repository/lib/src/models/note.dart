// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api/api.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'note.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)

/// {@template note}
/// Class that containts user data
/// {@endtemplate}
class Note extends Equatable {
  /// {@macro note}
  const Note({
    required this.id,
    required this.title,
    required this.body,
    required this.color,
  });

  ///
  factory Note.empty() => const Note(id: 0, title: '', body: '', color: 1);

  /// Converts a JSON [Map] into a [Note] instance.
  factory Note.fromJson(JsonMap json) => _$NoteFromJson(json);

  ///
  final int id;

  @JsonKey(name: 'noteTitle')

  ///
  final String title;

  @JsonKey(name: 'noteBody')

  ///
  final String body;

  ///
  final int color;

  /// Converts this [Note] instance into a JSON [Map].
  JsonMap toJson() => <String, dynamic>{
        'noteTitle': title,
        'noteBody': body,
        'color': color,
        'isImportant': true,
      };

  Note copyWith({
    int? id,
    String? title,
    String? body,
    int? color,
  }) {
    return Note(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      color: color ?? this.color,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      title,
      body,
      color,
    ];
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Note _$NoteFromJson(Map<String, dynamic> json) => Note(
      id: json['id'] as int,
      title: json['noteTitle'] as String,
      body: json['noteBody'] as String,
      color: json['color'] as int,
    );

Map<String, dynamic> _$NoteToJson(Note instance) => <String, dynamic>{
      'id': instance.id,
      'noteTitle': instance.title,
      'noteBody': instance.body,
      'color': instance.color,
    };

import 'package:api/api.dart';

import 'package:repository/src/models/models.dart';

/// Thrown when an error occurs while up auth.
class AuthException implements Exception {}

/// {@template repository}
/// Repository for auth related methods
/// {@endtemplate}
class Repository {
  /// {@macro repository}
  Repository(this.dataSource);

  ///
  final DataSource dataSource;

  ///
  Future<void> register(
    String login,
    String password,
    String firstNamne,
    String password2,
    String lastName,
  ) async {
    try {
      await dataSource.register(
        login,
        password,
        firstNamne,
        password2,
        lastName,
      );

      return;
    } on Exception {
      rethrow;
    } catch (_) {
      throw AuthException();
    }
  }

  ///
  Future<void> login(String login, String password) async {
    try {
      await dataSource.login(login, password);

      return;
    } on Exception {
      rethrow;
    } catch (_) {
      throw AuthException();
    }
  }

  Future<User> getUser() async {
    try {
      final response = await dataSource.getUser();

      final user = User.fromJson(response);

      return user;
    } on Exception {
      rethrow;
    } catch (_) {
      throw AuthException();
    }
  }

  ///
  Future<Note> getNote(int id) async {
    try {
      final repsonse = await dataSource.getNote(id);

      final note = Note.fromJson(repsonse);

      return note;
    } on Exception {
      rethrow;
    } catch (_) {
      throw AuthException();
    }
  }

  ///
  Future<void> saveNote(Note note) async {
    try {
      final noteJson = note.toJson();

      await dataSource.saveNote(noteJson);

      return;
    } on Exception {
      rethrow;
    } catch (_) {
      throw AuthException();
    }
  }

  ///
  Future<void> editNote(Note note, int id) async {
    try {
      final noteJson = note.toJson();

      await dataSource.editNote(noteJson, id);

      return;
    } on Exception {
      rethrow;
    } catch (_) {
      throw AuthException();
    }
  }

  /// Gets user data.
  Future<List<Note>> getNotes() async {
    try {
      /* final test = <Note>[
        Note(
          id: 1,
          title: 'Tytuł 1',
          body: 'Nie wiem, ale się dowiem',
          date: DateTime(2022, 2, 12),
          color: 1,
        ),
        Note(
          id: 1,
          title: 'Jak poprawnie tworzyć design',
          body:
              '''Spójne marginesy, grające ze sobą kolory, ekrany powinno robić się na frame’ach a  cos dalej do overfloww''',
          date: DateTime(2022, 2, 12),
          color: 1,
        ),
        Note(
          id: 1,
          title: 'Kocham gotować, dlaczego warto',
          body: 'Kochanie gotowania, dlaczego warto',
          date: DateTime(2022, 2, 12),
          color: 1,
        ),
        Note(
          id: 1,
          title: 'Tytuł 2',
          body: 'Nie wiem, ale się dowiem',
          date: DateTime(2022, 2, 12),
          color: 1,
        ),
        Note(
          id: 1,
          title: 'Tytuł 3',
          body: 'Nie wiem, ale się dowiem',
          date: DateTime(2022, 2, 12),
          color: 1,
        ),
        Note(
          id: 1,
          title: 'Tytuł 4',
          body: 'Nie wiem, ale się dowiem',
          date: DateTime(2022, 2, 12),
          color: 1,
        ),
      ];

      return test; */
      final response = await dataSource.getNotes();
      final notes = <Note>[];
      for (final element in response) {
        notes.add(Note.fromJson(element as JsonMap));
      }

      return notes;
    } on Exception {
      rethrow;
    } catch (_) {
      throw AuthException();
    }
  }
}

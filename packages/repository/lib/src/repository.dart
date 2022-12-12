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

  /// Gets user data.
  Future<List<Note>> getNotes(int id) async {
    try {
      final test = <Note>[
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

      return test;
      /* final response = await dataSource.getNotes(id);
      final note = Note.fromJson(response);

      return 'user'; */
    } on Exception {
      rethrow;
    } catch (_) {
      throw AuthException();
    }
  }
}

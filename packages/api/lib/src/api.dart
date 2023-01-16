import 'package:api/api.dart';
import 'package:dio/dio.dart';

/// Shorter definition of Map<String, dynamic>
typedef JsonMap = Map<String, dynamic>;

/// {@template tc_api}
/// An api client package for TimeCamp project
/// {@endtemplate}

/// {@template auth_data_source}
/// Data source for auth related calls
/// {@endtemplate}
class DataSource {
  /// {@macro auth_data_source}
  const DataSource(this._dio);

  /// Dio api client
  final Dio _dio;

  /// Gets user data
  ///
  /// REST call: `GET /user`
  Future<void> register(
    String login,
    String password,
    String firstNamne,
    String password2,
    String lastName,
  ) async {
    try {
      await _dio.post<dynamic>(
        '/account/register',
        data: {
          'email': login,
          'password': password,
          'confirmPassword': password2,
          'firstName': firstNamne,
          'lastName': lastName
        },
      );

      return;
    } on DioError catch (e) {
      throw RequestException(e, e.response?.statusCode);
    } catch (_) {
      throw JsonDeserializationException();
    }
  }

  /// Gets user data
  ///
  /// REST call: `GET /user`
  Future<void> login(String login, String passowrd) async {
    try {
      final result = await _dio.post<dynamic>(
        '/account/login',
        data: {
          'email': login,
          'password': passowrd,
        },
      );

      _dio.options.headers.addAll({'Authorization': 'Bearer ${result.data}'});

      return;
    } on DioError catch (e) {
      throw RequestException(e, e.response?.statusCode);
    } catch (_) {
      throw JsonDeserializationException();
    }
  }

  /// Gets user data
  ///
  /// REST call: `GET /user`
  Future<JsonMap> getUser() async {
    try {
      final result = await _dio.get<dynamic>(
        '/account/current',
      );

      return result.data! as JsonMap;
    } on DioError catch (e) {
      throw RequestException(e, e.response?.statusCode);
    } catch (_) {
      throw JsonDeserializationException();
    }
  }

  /// Gets user data
  ///
  /// REST call: `GET /third_party/api/me`
  Future<List<dynamic>> getNotes() async {
    try {
      final result = await _dio.get<dynamic>(
        '/note',
      );

      return result.data! as List;
    } on DioError catch (e) {
      throw RequestException(e, e.response?.statusCode);
    } catch (_) {
      throw JsonDeserializationException();
    }
  }

  /// Gets user data
  ///
  /// REST call: `GET /third_party/api/me`
  Future<JsonMap> getNote(int id) async {
    try {
      final result = await _dio.get<dynamic>(
        '/note/$id',
      );

      return result.data! as JsonMap;
    } on DioError catch (e) {
      throw RequestException(e, e.response?.statusCode);
    } catch (_) {
      throw JsonDeserializationException();
    }
  }

  /// Gets user data
  ///
  /// REST call: `GET /third_party/api/me`
  Future<void> saveNote(JsonMap note) async {
    try {
      await _dio.post<dynamic>(
        '/note',
        data: note,
      );

      return;
    } on DioError catch (e) {
      throw RequestException(e, e.response?.statusCode);
    } catch (_) {
      throw JsonDeserializationException();
    }
  }

  /// Gets user data
  ///
  /// REST call: `GET /third_party/api/me`
  Future<void> editNote(JsonMap note, int id) async {
    try {
      await _dio.patch<dynamic>(
        '/note/$id',
        data: note,
      );

      return;
    } on DioError catch (e) {
      throw RequestException(e, e.response?.statusCode);
    } catch (_) {
      throw JsonDeserializationException();
    }
  }
}

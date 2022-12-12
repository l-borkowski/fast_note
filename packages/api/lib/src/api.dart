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
  /// REST call: `GET /third_party/api/me`
  Future<JsonMap> getNotes(int id) async {
    try {
      return {'foo': 'bar'};
      final result = await _dio.get<dynamic>(
        '/third_party/api/me',
      );

      return result.data! as JsonMap;
    } on DioError catch (e) {
      throw RequestException(e, e.response?.statusCode);
    } catch (_) {
      throw JsonDeserializationException();
    }
  }
}

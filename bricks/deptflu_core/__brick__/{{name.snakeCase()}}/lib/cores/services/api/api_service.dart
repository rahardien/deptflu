import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:{{name.snakeCase()}}/common/data/models/user_model.dart';
import 'package:{{name.snakeCase()}}/cores/injection.dart';
import 'package:{{name.snakeCase()}}/cores/models/base_list_response.dart';
import 'package:{{name.snakeCase()}}/cores/models/base_response.dart';
import 'package:{{name.snakeCase()}}/cores/services/api/api_dio.dart';
import 'package:{{name.snakeCase()}}/cores/services/secure_storage_service.dart';
import 'package:{{name.snakeCase()}}/features/login/data/models/login_model.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService._(Dio dio, {String? baseUrl}) = _ApiService;

  static Future<ApiService> create({
    String? baseUrl,
    Map<String, dynamic> header = const {},
    String contentType = "application/json",
  }) async {
    final newHeader = <String, dynamic>{};

    newHeader.addAll(header);

    // Attach access token herea
    final accessToken = await sl.get<SecureStorageService>().accessToken;

    if (newHeader['Authorization'] == null) {
      newHeader['Authorization'] = 'Bearer $accessToken';
    }

    final dio = ApiDio.getDio(
      baseUrl: baseUrl,
      header: newHeader,
      contentType: contentType,
    );

    return ApiService._(dio);
  }

  @POST("/login")
  Future<BaseResponse<LoginModel>> login(
    @Body() Map<String, dynamic> json,
  );

  @GET("/users")
  Future<BaseListResponse<UserModel>> getUsers({
    @Query('page') int page = 1,
  });

  @GET("/users/{id}")
  Future<BaseResponse<UserModel>> getUserById({
    @Path('id') required int id,
  });
}

import 'package:dio/dio.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:mobile_app/posts/models/user_models/auth_user_created_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class UserRepository {
  ///Throws [NetworkException]
  Future<AuthUserModel?> postUserOnLogin();
}

class UserRepositoryProvider implements UserRepository {
  final String _url = "https://app-gradcoin-api-uat.azurewebsites.net/api/User";
  final Dio _dio = Dio();
  late SharedPreferences _prefs;
  UserRepositoryProvider() {
    _dio.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      var token = await getToken();
      options.headers['Authorization'] = 'Bearer $token';
      return handler.next(options);
      // }, onError: (DioError error, handler) async {
      //   if ((error.response?.statusCode == 401 &&
      //       error.response?.data['message'] == "Invalid JWT")) {
      //     print("Token expired");
      //   }
    }));
  }

  getToken() async {
    _prefs = await SharedPreferences.getInstance();
    var token = _prefs.getString('token');
    return token;
  }

  //Get All The Users
  getAllUsers() async {
    try {
      Response res = await _dio.get(_url);
      return res;
    } catch (e) {
      return 'Error: Getting All Users Failed';
    }
  }

  //Get A Single User
  getSingleUser(String userId) async {
    try {
      Response res = await _dio.get('$_url/$userId');
      return res;
    } catch (e) {
      return 'Error: User Not Found';
    }
  }

  //Create A User On Login
  @override
  Future<AuthUserModel?> postUserOnLogin() async {
    _prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> payload =
        Jwt.parseJwt(_prefs.getString('token').toString());
    try {
      Response res = await _dio.post(_url, data: {
        'email': payload['emails'][0].toString(),
        'name': payload['given_name'].toString(),
        'surname': payload['family_name'].toString(),
        'externalAuthId': payload['oid'].toString()
      });
      AuthUserModel user = AuthUserModel.fromJson(res.data);
      _prefs.setString('userId', user.id);
      String name = user.name + ' ' + user.surname;
      _prefs.setString('userName', name);
      return user;
    } catch (e) {
      return null;
    }
  }
}

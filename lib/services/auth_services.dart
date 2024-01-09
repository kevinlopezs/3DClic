import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:teka_3dclic/manager/hive_manager.dart';

class AuthServices {
  //Env configuration
  final url = dotenv.env['API_URL']!;
  final apiKey = dotenv.env['API_KEY']!;
  //Service to signUp a new user
  Future<Response> signUpNewUser(
      {required String email, required String pwd}) async {
    try {
      Response response = await Dio().post("$url/auth/v1/signup",
          options: Options(headers: {
            'ContentType': 'application/json',
            'apikey': apiKey,
          }),
          data: {'email': email, 'password': pwd});

      final dataresponse = response.data;
      return dataresponse;
    } catch (e) {
      throw Exception('Unexpected error ocurred. Error creating new user:$e');
    }
  }

  //Service to signIn an user
  Future<Response<dynamic>> signIn(
      {required String email, required String pwd}) async {
    try {
      Response response =
          await Dio().post("$url/auth/v1/token?grant_type=password",
              options: Options(headers: {
                'ContentType': 'application/json',
                'apikey': apiKey,
              }),
              data: {'email': email, 'password': pwd});

      return response;
    } on DioException catch (e) {
      final String dioError = e.response?.data['error_description'] ?? '';
      throw Exception(dioError);
    } catch (e) {
      throw Exception('Unexpected error ocurred. Error creating new user:$e ');
    }
  }

  //Service created with a custom function in PostgresSQL to check if email user already exists
  Future<bool> checkEmailExists(String email) async {
    try {
      Response response = await Dio().post("$url/rest/v1/rpc/another",
          options: Options(headers: {
            'ContentType': 'application/json',
            'apikey': apiKey,
          }),
          data: {'email_address': email});

      final dataresponse = response.data;
      return dataresponse;
    } catch (e) {
      throw Exception('Error cheking if email already exists: $e');
    }
  }

  //Service to get user info by id, required bearer token
  Future<bool> getUser({required String id}) async {
    try {
      Response response = await Dio().get(
        "$url/rest/v1/profiles?id=eq.$id",
        options: Options(headers: {
          'apikey': apiKey,
          'Authorization': 'Bearer ${hiveManager.token}'
        }),
      );

      final dataresponse = response.data;
      return dataresponse;
    } catch (e) {
      throw Exception('Error getting user by id : $e');
    }
  }

  //Service to get user sessions info by id, required bearer token
  Future<bool> getUserSessionInfo({required String id}) async {
    try {
      Response response = await Dio().get(
        "$url/auth/v1/user",
        options: Options(headers: {
          'apikey': apiKey,
          'Authorization': 'Bearer ${hiveManager.token}'
        }),
      );

      final dataresponse = response.data;
      return dataresponse;
    } catch (e) {
      throw Exception('Error getting user sessions info by id : $e');
    }
  }

  //Service to password recovery
  Future<bool> pwdRecovery({required String email}) async {
    try {
      Response response = await Dio().post("$url/auth/v1/recover",
          options: Options(headers: {
            'ContentType': 'application/json',
            'apikey': apiKey,
          }),
          data: {'email_address': email});

      final dataresponse = response.data;
      return dataresponse;
    } catch (e) {
      throw Exception('Error recovering account: $e');
    }
  }

  //Service to update rows user info in database
  Future<bool> updateUserDb(
      {required String email,
      required String username,
      required int phone,
      required String country,
      required String token}) async {
    try {
      Response response = await Dio().patch("$url/rest/v1/users?id=eq.$token",
          options: Options(headers: {
            'ContentType': 'application/json',
            'apikey': apiKey,
          }),
          data: {
            'email': email,
            'username': username,
            'phone': phone,
            'country': country,
          });

      final dataresponse = response.data;
      return dataresponse;
    } catch (e) {
      throw Exception('Error updating user info: $e');
    }
  }

  //Service to update user info meta_data in AUTH supabase
  Future<bool> updateUser({required String email}) async {
    try {
      Response response = await Dio().put("$url/auth/v1/user",
          options: Options(headers: {
            'ContentType': 'application/json',
            'apikey': apiKey,
            'Authorization': 'Bearer ${hiveManager.token}'
          }),
          data: {'email_address': email});

      final dataresponse = response.data;
      return dataresponse;
    } catch (e) {
      throw Exception('Error updating user metadata: $e');
    }
  }

  //Service to sign out an user
  Future<int?> signOut() async {
    try {
      Response response = await Dio().post(
        "$url/auth/v1/logout",
        options: Options(headers: {
          'ContentType': 'application/json',
          'apikey': apiKey,
          'Authorization': 'Bearer ${hiveManager.token}'
        }),
      );

      final dataresponse = response.statusCode;
      return dataresponse;
    } catch (e) {
      throw Exception('Error recovering account: $e');
    }
  }
}

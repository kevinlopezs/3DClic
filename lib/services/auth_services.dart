import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AuthServices {
  Future<bool> checkEmailExists(String email) async {
    final url = dotenv.env['API_URL']!;
    final apiKey = dotenv.env['API_KEY']!;

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
      throw Exception('Error al verificar el correo electrónico: $e');
    }
  }
}

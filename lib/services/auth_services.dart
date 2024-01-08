import 'package:dio/dio.dart';

class AuthServices {
  Future<bool> checkEmailExists(String email) async {
    try {
      Response response = await Dio()
          .post("https://gxvmkcsgwrglqdrcraqx.supabase.co/rest/v1/rpc/another",
              options: Options(headers: {
                'ContentType': 'application/json',
                'apikey':
                    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imd4dm1rY3Nnd3JnbHFkcmNyYXF4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDQ1NzI4MTEsImV4cCI6MjAyMDE0ODgxMX0.nOhfk8NZ-jeyIhmbrdKsgANGqadqUiqQ7xBLV_h-YNA',
              }),
              data: {'email_address': email});

      final dataresponse = response.data;
      return dataresponse;
    } catch (e) {
      throw Exception('Error al verificar el correo electrónico: $e');
    }
  }
}

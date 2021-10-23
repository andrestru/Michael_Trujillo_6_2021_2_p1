import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:michael_trujillo_6_2021_2_p1/models/Notice.dart';
import 'package:michael_trujillo_6_2021_2_p1/models/response.dart';

import 'constants.dart';

class ApiHelper {
  static Future<Response> getNotice(String type_notice) async {
    var url = Uri.parse('${Constans.apiUrl}=${type_notice}');
    var response = await http.get(
      url,
      headers: {
        'content-type': 'application/json',
        'accept': 'application/json'
      },
    );

    var body = response.body;
    if (response.statusCode >= 400) {
      return Response(isSuccess: false, message: body);
    }

    List<Notice> list = [];

    var decodedJson = jsonDecode(body);

    if (decodedJson != null) {
      for (var item in decodedJson['data']) {
        list.add(Notice.fromJson(item));
      }
    }

    return Response(isSuccess: true, result: list);
  }
}

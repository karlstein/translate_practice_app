import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:translatepracticeapp/model/data_body_model.dart';
import 'package:translatepracticeapp/model/translate_model.dart';

class Services {
  Future<TranslateModel?> translate(DataBodyModel dataBody) async {
    try {
      var baseUrl =
          'https://translate.google.com/translate_a/single?client=at&dt=t&dt=ld&dt=qca&dt=rm&dt=bd&dj=1&ie=UTF-8&oe=UTF-8&inputm=2&otf=2&iid=1dd3b944-fa62-4b55-b330-74909a99969e';
      var headers = {'Content-Type': 'application/x-www-form-urlencoded'};

      var data =
          'sl=${dataBody.sourceLang}&tl=${dataBody.targetLang}&q=${dataBody.sourceText}';

      var url = Uri.parse('${baseUrl}');
      var response = await http
          .post(url, headers: headers, body: data)
          .timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("Connection timeout, try again");
      });
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        return TranslateModel.fromJson(jsonResponse);
      } else {
        return null;
      }
    } on TimeoutException catch (e) {
      print("response timeout. Error message: ${e.message}");
    }
  }
}

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toonflix/models/webtoon_model.dart';

// wjdfl
// HTTP 패키지 인스톨
// Future 당장 완료될 작업이 아님을 의미. = 비동기 처리 (async/await)
// named constructor 연습
// jsonDecode에 대한 연습

class ApiService {
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";

  static const String today = "today";

  // async 라서 리턴타입이 Future
  static Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = [];
    final url = Uri.parse('$baseUrl/$today');
    // 다트가 이 부분이 제대로 완료될때까지 기다리기를 원한다. = 비동기.
    // await - Future 연관.
    final response =
        await http.get(url); // 반환타입이 Future (미래에 받을 값을 알려준다.) 즉각적인 응답이 아니다.
    if (response.statusCode == 200) {
      // print(response.body);

      final List<dynamic> webtoons =
          jsonDecode(response.body); // ㄷ다이나믹이라서 타입 지ㅇ
      for (var webtoon in webtoons) {
        final toon = WebtoonModel.fromJson(webtoon);
        webtoonInstances.add(toon);
      }

      return webtoonInstances;
    }
    throw Error();
  }
}

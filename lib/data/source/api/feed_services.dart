import 'package:dio/dio.dart';
import '../../feed.dart';

class FeedServices {
  final Dio _httpClient;

  FeedServices(this._httpClient);

  Future<Feed> getFeed() async {
    final response = await _httpClient.get('v2/feeds/',
        options: Options(responseType: ResponseType.json));
    return Feed.fromJson(response.data);
  }
}
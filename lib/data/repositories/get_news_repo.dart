import 'package:dio/dio.dart';
import 'package:iti_summer_7_newsapp/data/models/get_news_model.dart';

class GetNewsRepo {
  Dio dio = Dio();

  Future<GetNewsModel?> getNews() async {
    Response response;

    try {
      response = await dio.get(
          'https://newsapi.org/v2/everything?q=tesla&from=2024-06-16&sortBy=publishedAt&apiKey=7c07f0c86d484b30a5af1289c531cff1');

      if (response.statusCode == 200) {
        GetNewsModel modelResponse = GetNewsModel.fromJson(response.data);

        return modelResponse;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}

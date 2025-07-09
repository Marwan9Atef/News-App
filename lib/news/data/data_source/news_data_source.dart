import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news/shared/api_constant.dart';
import 'package:news/news/data/models/article_respone.dart';
class NewsDataSource {
   Future<ArticleRespone>getArticle (String sourceId)async{
    Uri uri=Uri.https(APIConstant.baseUrl,APIConstant.headlinesEndpoint,{
      "apiKey":APIConstant.aPIKey,
      "sources":sourceId
    });
    http.Response response =await http.get(uri);
    Map<String,dynamic>json=jsonDecode(response.body);
    return ArticleRespone.fromJson(json);

  }

}
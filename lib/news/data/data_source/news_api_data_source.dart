import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news/news/data/data_source/news_data_source.dart';
import 'package:news/shared/api_constant.dart';
import 'package:news/news/data/models/article_respone.dart';
class NewsAPIDataSource extends NewsDataSource {
   @override
  Future<List<Articles>>getArticle (String sourceId)async{
    Uri uri=Uri.https(APIConstant.baseUrl,APIConstant.headlinesEndpoint,{
      "apiKey":APIConstant.aPIKey,
      "sources":sourceId
    });
    http.Response response =await http.get(uri);
    Map<String,dynamic>json=jsonDecode(response.body);
    ArticleRespone respone= ArticleRespone.fromJson(json);
    if(respone.status=="ok"&&respone.articles!=null){
      return respone.articles!;
    }else{
      throw Exception("Something went wrong");
    }

  }

}
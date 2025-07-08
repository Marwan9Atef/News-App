import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news/api/api_constant.dart';
import 'package:news/models/article_respone.dart';
import 'package:news/models/source_respone.dart';
class APIServices {
  static Future<SourceRespone>getSources (String categoryId)async{
    Uri uri=Uri.https(APIConstant.baseUrl,APIConstant.sourceEndpoint,{
      "apiKey":APIConstant.aPIKey,
      "category":categoryId
    });
http.Response response =await http.get(uri);
Map<String,dynamic>json=jsonDecode(response.body);
return SourceRespone.fromJson(json);

  }
  static Future<ArticleRespone>getArticle (String sourceId)async{
    Uri uri=Uri.https(APIConstant.baseUrl,APIConstant.headlinesEndpoint,{
      "apiKey":APIConstant.aPIKey,
      "sources":sourceId
    });
    http.Response response =await http.get(uri);
    Map<String,dynamic>json=jsonDecode(response.body);
    return ArticleRespone.fromJson(json);

  }


}
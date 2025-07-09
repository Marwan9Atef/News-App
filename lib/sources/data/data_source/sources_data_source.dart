import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news/shared/api_constant.dart';
import 'package:news/sources/data/models/source_respone.dart';
class SourcesDataSource {
   Future<SourceRespone>getSources (String categoryId)async{
    Uri uri=Uri.https(APIConstant.baseUrl,APIConstant.sourceEndpoint,{
      "apiKey":APIConstant.aPIKey,
      "category":categoryId
    });
    http.Response response =await http.get(uri);
    Map<String,dynamic>json=jsonDecode(response.body);
    return SourceRespone.fromJson(json);

  }


}
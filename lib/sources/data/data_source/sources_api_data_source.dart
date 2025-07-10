import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news/shared/api_constant.dart';
import 'package:news/sources/data/data_source/sources_data_source.dart';
import 'package:news/sources/data/models/source_respone.dart';
class SourcesAPIDataSource extends SourcesDataSource {
   @override
  Future<List<Sources>>getSources (String categoryId)async{
    Uri uri=Uri.https(APIConstant.baseUrl,APIConstant.sourceEndpoint,{
      "apiKey":APIConstant.aPIKey,
      "category":categoryId
    });
    http.Response response =await http.get(uri);
    Map<String,dynamic>json=jsonDecode(response.body);
    SourceRespone respone= SourceRespone.fromJson(json);
    if(respone.status=="ok"&&respone.sources!=null){
      return respone.sources!;
    }else{
      throw Exception("Something went wrong");
    }

  }


}
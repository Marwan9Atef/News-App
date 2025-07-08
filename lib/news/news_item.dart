import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/models/article_respone.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsItem extends StatelessWidget {
  Articles article;
  NewsItem({required this.article});

  @override
  Widget build(BuildContext context) {
    TextTheme textStyle=Theme.of(context).textTheme;
    return Container(
      padding:EdgeInsetsDirectional.all(8),
      decoration:BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(16),
        border:Border.all(width: 1,color: AppTheme.white)
        
      ) ,
      child: Column(

        children: [
          ClipRRect(
            borderRadius:BorderRadius.circular(8) ,
            child: Image.network(article.urlToImage??"https://i.sstatic.net/y9DpT.jpg",width:double.infinity,height: MediaQuery.sizeOf(context).height*.20,fit: BoxFit.fill, errorBuilder: (context, error, stackTrace) {
              return Image.asset("assets/images/notfoundimage.jpg");
            },),
            
          ),
          Text(article.title??"",style: textStyle.labelMedium,),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(article.source!.name??"",style: textStyle.displaySmall,),
            Text(timeago.format(DateTime.parse(article.publishedAt!) ??DateTime.now()),style: textStyle.displaySmall,)
            
            
            
          ],
          
        )  
          
          
        ],
        
      ),
      
      
      
    );
  }
}

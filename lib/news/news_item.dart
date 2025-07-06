import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsItem extends StatelessWidget {
  final fifteenAgo = DateTime.now().subtract(Duration(minutes: 20));

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
            child: Image.asset("assets/images/newitem.png",width:double.infinity,height: MediaQuery.sizeOf(context).height*.20,fit: BoxFit.fill,),
            
          ),
          Text("40-year-old man falls 200 feet to his death while canyoneering at national park",style: textStyle.labelMedium,),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("By : Jon Haworth",style: textStyle.displaySmall,),
            Text(timeago.format(fifteenAgo),style: textStyle.displaySmall,)
            
            
            
          ],
          
        )  
          
          
        ],
        
      ),
      
      
      
    );
  }
}

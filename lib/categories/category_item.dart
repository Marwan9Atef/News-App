import 'package:flutter/widgets.dart';
import 'package:news/models/category_model.dart';

class CategoryItem extends StatelessWidget {
 CategoryModel category;
 CategoryItem({required this.category});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius:BorderRadiusDirectional.circular(24),
        child: Image.asset("assets/images/${category.imageName}.png",height:MediaQuery.sizeOf(context).height*.25,width: double.infinity,)

    );
  }
}

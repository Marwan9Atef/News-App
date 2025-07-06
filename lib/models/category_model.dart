class CategoryModel {
String id;
String imageName;
String name;
CategoryModel({required this.id,required this.imageName,required this.name});
static List<CategoryModel>category=[
  CategoryModel(id: "general",name:"General"  ,imageName: "general"),
  CategoryModel(id: "business", name:"Business" ,imageName: "business"),
  CategoryModel(id: "entertainment", name:"Entertainment" ,imageName: "entertainment"),
  CategoryModel(id: "health",name:"Health"  ,imageName: "health"),
  CategoryModel(id: "science",name:"Science"  ,imageName: "science"),
  CategoryModel(id: "technology",name:"Technology"  ,imageName: "technology"),
  CategoryModel(id: "sports",name:"Sports"  ,imageName: "sports")


];

}
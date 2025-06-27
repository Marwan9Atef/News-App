class CategoryModel {
String id;
String imageName;
CategoryModel({required this.id,required this.imageName});
static List<CategoryModel>category=[
  CategoryModel(id: "general", imageName: "general"),
  CategoryModel(id: "business", imageName: "business"),
  CategoryModel(id: "entertainment", imageName: "entertainment"),
  CategoryModel(id: "health", imageName: "health"),
  CategoryModel(id: "science", imageName: "science"),
  CategoryModel(id: "technology", imageName: "technology"),
  CategoryModel(id: "sports", imageName: "sports")


];

}
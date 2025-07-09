class CategoryViewModel {
String id;
String imageName;
String name;
CategoryViewModel({required this.id,required this.imageName,required this.name});
static List<CategoryViewModel>category=[
  CategoryViewModel(id: "general",name:"General"  ,imageName: "general"),
  CategoryViewModel(id: "business", name:"Business" ,imageName: "business"),
  CategoryViewModel(id: "entertainment", name:"Entertainment" ,imageName: "entertainment"),
  CategoryViewModel(id: "health",name:"Health"  ,imageName: "health"),
  CategoryViewModel(id: "science",name:"Science"  ,imageName: "science"),
  CategoryViewModel(id: "technology",name:"Technology"  ,imageName: "technology"),
  CategoryViewModel(id: "sports",name:"Sports"  ,imageName: "sports")


];

}
class CategoryModel {
   String? name;
   String ?image;
  CategoryModel({
    required this.name,
    required this.image,
  });
  CategoryModel.fromJson(Map<dynamic,dynamic> categroy){
    if(categroy==null){
      return;
    }
    name=categroy['name'];
    image=categroy['image'];
  }
  toJson(){
    return {
      "name":name,
      "image":image,

    };

  }
  @override
  String toString() {
    // TODO: implement toString
    return super.toString();
  }

}

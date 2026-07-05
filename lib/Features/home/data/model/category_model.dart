
class CategoryModel {
  String? idCategory;
  String? strCategory;
  String? strCategoryThumb;
  String? strCategoryDescription;

  CategoryModel({this.idCategory, this.strCategory, this.strCategoryThumb, this.strCategoryDescription});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    if(json["idCategory"] is String) {
      idCategory = json["idCategory"];
    }
    if(json["strCategory"] is String) {
      strCategory = json["strCategory"];
    }
    if(json["strCategoryThumb"] is String) {
      strCategoryThumb = json["strCategoryThumb"];
    }
    if(json["strCategoryDescription"] is String) {
      strCategoryDescription = json["strCategoryDescription"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["idCategory"] = idCategory;
    data["strCategory"] = strCategory;
    data["strCategoryThumb"] = strCategoryThumb;
    data["strCategoryDescription"] = strCategoryDescription;
    return data;
  }
}
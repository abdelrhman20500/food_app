
class CategoryMealsModel {
  String? strMeal;
  String? strMealThumb;
  String? idMeal;
  String? strArea;
  String? strCountry;

  CategoryMealsModel({this.strMeal, this.strMealThumb, this.idMeal, this.strArea, this.strCountry});

  CategoryMealsModel.fromJson(Map<String, dynamic> json) {
    if(json["strMeal"] is String) {
      strMeal = json["strMeal"];
    }
    if(json["strMealThumb"] is String) {
      strMealThumb = json["strMealThumb"];
    }
    if(json["idMeal"] is String) {
      idMeal = json["idMeal"];
    }
    if(json["strArea"] is String) {
      strArea = json["strArea"];
    }
    if(json["strCountry"] is String) {
      strCountry = json["strCountry"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["strMeal"] = strMeal;
    data["strMealThumb"] = strMealThumb;
    data["idMeal"] = idMeal;
    data["strArea"] = strArea;
    data["strCountry"] = strCountry;
    return data;
  }
}
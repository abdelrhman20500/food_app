
class MealsDetailsModel {
  List<Meals>? meals;

  MealsDetailsModel({this.meals});

  MealsDetailsModel.fromJson(Map<String, dynamic> json) {
    if(json["meals"] is List) {
      meals = json["meals"] == null ? null : (json["meals"] as List).map((e) => Meals.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if(meals != null) {
      data["meals"] = meals?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class Meals {
  String? idMeal;
  String? strMeal;
  dynamic strMealAlternate;
  String? strCategory;
  String? strArea;
  String? strCountry;
  String? strInstructions;
  String? strMealThumb;
  String? strTags;
  String? strYoutube;
  String? strIngredient1;
  String? strIngredient2;
  String? strIngredient3;
  String? strIngredient4;
  String? strIngredient5;
  String? strIngredient6;
  String? strIngredient7;
  String? strIngredient8;
  String? strIngredient9;
  String? strIngredient10;
  String? strIngredient11;
  String? strIngredient12;
  String? strIngredient13;
  String? strIngredient14;
  String? strIngredient15;
  dynamic strIngredient16;
  dynamic strIngredient17;
  dynamic strIngredient18;
  dynamic strIngredient19;
  dynamic strIngredient20;
  String? strMeasure1;
  String? strMeasure2;
  String? strMeasure3;
  String? strMeasure4;
  String? strMeasure5;
  String? strMeasure6;
  String? strMeasure7;
  String? strMeasure8;
  String? strMeasure9;
  String? strMeasure10;
  String? strMeasure11;
  String? strMeasure12;
  String? strMeasure13;
  String? strMeasure14;
  String? strMeasure15;
  dynamic strMeasure16;
  dynamic strMeasure17;
  dynamic strMeasure18;
  dynamic strMeasure19;
  dynamic strMeasure20;
  dynamic strSource;
  dynamic strImageSource;
  dynamic strCreativeCommonsConfirmed;
  dynamic dateModified;

  Meals({this.idMeal, this.strMeal, this.strMealAlternate, this.strCategory, this.strArea, this.strCountry, this.strInstructions, this.strMealThumb, this.strTags, this.strYoutube, this.strIngredient1, this.strIngredient2, this.strIngredient3, this.strIngredient4, this.strIngredient5, this.strIngredient6, this.strIngredient7, this.strIngredient8, this.strIngredient9, this.strIngredient10, this.strIngredient11, this.strIngredient12, this.strIngredient13, this.strIngredient14, this.strIngredient15, this.strIngredient16, this.strIngredient17, this.strIngredient18, this.strIngredient19, this.strIngredient20, this.strMeasure1, this.strMeasure2, this.strMeasure3, this.strMeasure4, this.strMeasure5, this.strMeasure6, this.strMeasure7, this.strMeasure8, this.strMeasure9, this.strMeasure10, this.strMeasure11, this.strMeasure12, this.strMeasure13, this.strMeasure14, this.strMeasure15, this.strMeasure16, this.strMeasure17, this.strMeasure18, this.strMeasure19, this.strMeasure20, this.strSource, this.strImageSource, this.strCreativeCommonsConfirmed, this.dateModified});

  Meals.fromJson(Map<String, dynamic> json) {
    if(json["idMeal"] is String) {
      idMeal = json["idMeal"];
    }
    if(json["strMeal"] is String) {
      strMeal = json["strMeal"];
    }
    strMealAlternate = json["strMealAlternate"];
    if(json["strCategory"] is String) {
      strCategory = json["strCategory"];
    }
    if(json["strArea"] is String) {
      strArea = json["strArea"];
    }
    if(json["strCountry"] is String) {
      strCountry = json["strCountry"];
    }
    if(json["strInstructions"] is String) {
      strInstructions = json["strInstructions"];
    }
    if(json["strMealThumb"] is String) {
      strMealThumb = json["strMealThumb"];
    }
    if(json["strTags"] is String) {
      strTags = json["strTags"];
    }
    if(json["strYoutube"] is String) {
      strYoutube = json["strYoutube"];
    }
    if(json["strIngredient1"] is String) {
      strIngredient1 = json["strIngredient1"];
    }
    if(json["strIngredient2"] is String) {
      strIngredient2 = json["strIngredient2"];
    }
    if(json["strIngredient3"] is String) {
      strIngredient3 = json["strIngredient3"];
    }
    if(json["strIngredient4"] is String) {
      strIngredient4 = json["strIngredient4"];
    }
    if(json["strIngredient5"] is String) {
      strIngredient5 = json["strIngredient5"];
    }
    if(json["strIngredient6"] is String) {
      strIngredient6 = json["strIngredient6"];
    }
    if(json["strIngredient7"] is String) {
      strIngredient7 = json["strIngredient7"];
    }
    if(json["strIngredient8"] is String) {
      strIngredient8 = json["strIngredient8"];
    }
    if(json["strIngredient9"] is String) {
      strIngredient9 = json["strIngredient9"];
    }
    if(json["strIngredient10"] is String) {
      strIngredient10 = json["strIngredient10"];
    }
    if(json["strIngredient11"] is String) {
      strIngredient11 = json["strIngredient11"];
    }
    if(json["strIngredient12"] is String) {
      strIngredient12 = json["strIngredient12"];
    }
    if(json["strIngredient13"] is String) {
      strIngredient13 = json["strIngredient13"];
    }
    if(json["strIngredient14"] is String) {
      strIngredient14 = json["strIngredient14"];
    }
    if(json["strIngredient15"] is String) {
      strIngredient15 = json["strIngredient15"];
    }
    strIngredient16 = json["strIngredient16"];
    strIngredient17 = json["strIngredient17"];
    strIngredient18 = json["strIngredient18"];
    strIngredient19 = json["strIngredient19"];
    strIngredient20 = json["strIngredient20"];
    if(json["strMeasure1"] is String) {
      strMeasure1 = json["strMeasure1"];
    }
    if(json["strMeasure2"] is String) {
      strMeasure2 = json["strMeasure2"];
    }
    if(json["strMeasure3"] is String) {
      strMeasure3 = json["strMeasure3"];
    }
    if(json["strMeasure4"] is String) {
      strMeasure4 = json["strMeasure4"];
    }
    if(json["strMeasure5"] is String) {
      strMeasure5 = json["strMeasure5"];
    }
    if(json["strMeasure6"] is String) {
      strMeasure6 = json["strMeasure6"];
    }
    if(json["strMeasure7"] is String) {
      strMeasure7 = json["strMeasure7"];
    }
    if(json["strMeasure8"] is String) {
      strMeasure8 = json["strMeasure8"];
    }
    if(json["strMeasure9"] is String) {
      strMeasure9 = json["strMeasure9"];
    }
    if(json["strMeasure10"] is String) {
      strMeasure10 = json["strMeasure10"];
    }
    if(json["strMeasure11"] is String) {
      strMeasure11 = json["strMeasure11"];
    }
    if(json["strMeasure12"] is String) {
      strMeasure12 = json["strMeasure12"];
    }
    if(json["strMeasure13"] is String) {
      strMeasure13 = json["strMeasure13"];
    }
    if(json["strMeasure14"] is String) {
      strMeasure14 = json["strMeasure14"];
    }
    if(json["strMeasure15"] is String) {
      strMeasure15 = json["strMeasure15"];
    }
    strMeasure16 = json["strMeasure16"];
    strMeasure17 = json["strMeasure17"];
    strMeasure18 = json["strMeasure18"];
    strMeasure19 = json["strMeasure19"];
    strMeasure20 = json["strMeasure20"];
    strSource = json["strSource"];
    strImageSource = json["strImageSource"];
    strCreativeCommonsConfirmed = json["strCreativeCommonsConfirmed"];
    dateModified = json["dateModified"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["idMeal"] = idMeal;
    data["strMeal"] = strMeal;
    data["strMealAlternate"] = strMealAlternate;
    data["strCategory"] = strCategory;
    data["strArea"] = strArea;
    data["strCountry"] = strCountry;
    data["strInstructions"] = strInstructions;
    data["strMealThumb"] = strMealThumb;
    data["strTags"] = strTags;
    data["strYoutube"] = strYoutube;
    data["strIngredient1"] = strIngredient1;
    data["strIngredient2"] = strIngredient2;
    data["strIngredient3"] = strIngredient3;
    data["strIngredient4"] = strIngredient4;
    data["strIngredient5"] = strIngredient5;
    data["strIngredient6"] = strIngredient6;
    data["strIngredient7"] = strIngredient7;
    data["strIngredient8"] = strIngredient8;
    data["strIngredient9"] = strIngredient9;
    data["strIngredient10"] = strIngredient10;
    data["strIngredient11"] = strIngredient11;
    data["strIngredient12"] = strIngredient12;
    data["strIngredient13"] = strIngredient13;
    data["strIngredient14"] = strIngredient14;
    data["strIngredient15"] = strIngredient15;
    data["strIngredient16"] = strIngredient16;
    data["strIngredient17"] = strIngredient17;
    data["strIngredient18"] = strIngredient18;
    data["strIngredient19"] = strIngredient19;
    data["strIngredient20"] = strIngredient20;
    data["strMeasure1"] = strMeasure1;
    data["strMeasure2"] = strMeasure2;
    data["strMeasure3"] = strMeasure3;
    data["strMeasure4"] = strMeasure4;
    data["strMeasure5"] = strMeasure5;
    data["strMeasure6"] = strMeasure6;
    data["strMeasure7"] = strMeasure7;
    data["strMeasure8"] = strMeasure8;
    data["strMeasure9"] = strMeasure9;
    data["strMeasure10"] = strMeasure10;
    data["strMeasure11"] = strMeasure11;
    data["strMeasure12"] = strMeasure12;
    data["strMeasure13"] = strMeasure13;
    data["strMeasure14"] = strMeasure14;
    data["strMeasure15"] = strMeasure15;
    data["strMeasure16"] = strMeasure16;
    data["strMeasure17"] = strMeasure17;
    data["strMeasure18"] = strMeasure18;
    data["strMeasure19"] = strMeasure19;
    data["strMeasure20"] = strMeasure20;
    data["strSource"] = strSource;
    data["strImageSource"] = strImageSource;
    data["strCreativeCommonsConfirmed"] = strCreativeCommonsConfirmed;
    data["dateModified"] = dateModified;
    return data;
  }
}
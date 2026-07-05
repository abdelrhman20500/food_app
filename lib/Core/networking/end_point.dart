class EndPoint {
  static String baseUrl = "https://www.themealdb.com/api/json/v1/1/";
  static String category = "categories.php";
  static String categoryMeals({required String category}){
    return "filter.php?c=$category";
  }
}

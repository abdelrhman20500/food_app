import 'package:food_app/Core/networking/api_consumer.dart';
import 'package:food_app/Features/home/data/model/category_meals_model.dart';
import 'package:food_app/Features/home/data/model/category_model.dart';
import 'package:food_app/Features/home/data/model/meals_details_model.dart';
import '../../../../Core/error/error_model.dart';
import '../../../../Core/error/exceptions.dart';
import '../../../../Core/networking/end_point.dart';

abstract class BaseCategoryRemoteDataSource{
  Future<List<CategoryModel>> getCategory();
  Future<List<CategoryMealsModel>> getCategoryMeals({required String category});
  Future<MealsDetailsModel> getMealsDetails({required String id}) ;
}
class CategoryRemoteDataSource extends BaseCategoryRemoteDataSource{
  final ApiConsumer apiConsumer;
  CategoryRemoteDataSource({required this.apiConsumer});

  @override
  Future<List<CategoryModel>> getCategory()async{
    try {
      final response = await apiConsumer.get(EndPoint.category);
      final List<dynamic> dataList = response['categories'];
      return dataList.map((e) => CategoryModel.fromJson(e)).toList();
    } catch (e) {
      throw ServerException(errModel: ErrorModel(message: e.toString()));
    }
  }

  @override
  Future<List<CategoryMealsModel>> getCategoryMeals({required String category})async{
    try {
      final response = await apiConsumer.get(EndPoint.categoryMeals(category: category));
      final List<dynamic> dataList = response['meals'];
      return dataList.map((e) => CategoryMealsModel.fromJson(e)).toList();
    } catch (e) {
      throw ServerException(errModel: ErrorModel(message: e.toString()));
    }
  }

  @override
  Future<MealsDetailsModel> getMealsDetails({required String id})async{
    try {
      final response = await apiConsumer.get(EndPoint.mealsDetails(id: id));
      final Map<String, dynamic> productJson = response;
      print(productJson);
      return MealsDetailsModel.fromJson(productJson);
    } catch (e) {
      throw ServerException(errModel: ErrorModel(message: e.toString()));
    }
  }
}
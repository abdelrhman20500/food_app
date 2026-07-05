import 'package:food_app/Core/networking/api_consumer.dart';
import 'package:food_app/Features/home/data/model/category_model.dart';

import '../../../../Core/error/error_model.dart';
import '../../../../Core/error/exceptions.dart';
import '../../../../Core/networking/end_point.dart';

abstract class BaseCategoryRemoteDataSource{
  Future<List<CategoryModel>> getCategory() ;
}
class CategoryRemoteDataSource extends BaseCategoryRemoteDataSource{
  final ApiConsumer apiConsumer;
  CategoryRemoteDataSource({required this.apiConsumer});

  @override
  Future<List<CategoryModel>> getCategory()async{
    try {
      final response = await apiConsumer.get(EndPoint.category);
      final List<dynamic> dataList = response['categories'];
      print(dataList);
      return dataList.map((e) => CategoryModel.fromJson(e)).toList();
    } catch (e) {
      throw ServerException(errModel: ErrorModel(message: e.toString()));
    }
  }
}
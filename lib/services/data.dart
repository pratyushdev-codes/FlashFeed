import 'package:newsapp/models/category_model.dart';

List<CategoryModel> getCategories(){
  List<CategoryModel> category=[];
  CategoryModel categoryModel= new CategoryModel();

  categoryModel.categoryName="Buisness";
  categoryModel.image ="./images";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

 categoryModel.categoryName="Entertainment";
  categoryModel.image ="./images";
  category.add(categoryModel);
  categoryModel = new CategoryModel();
  
  categoryModel.categoryName="General";
  categoryModel.image ="./images";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoryName="Health";
  categoryModel.image ="./images";
  category.add(categoryModel);
  categoryModel = new CategoryModel();



  categoryModel.categoryName="Sports";
  categoryModel.image ="./images";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

}

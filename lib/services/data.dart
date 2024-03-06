import 'package:newsapp/models/category_model.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> categories = [];
  
  CategoryModel categoryModel = CategoryModel(); // Use the constructor directly

  // Add categories
  categoryModel.categoryName = "Business";
  categoryModel.image = "./images/business.jpeg";
  categories.add(categoryModel);
  
  categoryModel = CategoryModel(); // Reinitialize for the next category
  
  categoryModel.categoryName = "Entertainment";
  categoryModel.image = "./images/entertainment.jpeg"; // Corrected image path
  categories.add(categoryModel);
  
  categoryModel = CategoryModel(); // Reinitialize for the next category
  
  categoryModel.categoryName = "General";
  categoryModel.image = "./images/general.jpeg"; // Corrected image path
  categories.add(categoryModel);
  
  categoryModel = CategoryModel(); // Reinitialize for the next category
  
  categoryModel.categoryName = "Health";
  categoryModel.image = "./images/health.jpeg"; // Corrected image path
  categories.add(categoryModel);
  
  categoryModel = CategoryModel(); // Reinitialize for the next category
  
  categoryModel.categoryName = "Sports";
  categoryModel.image = "./images/sports.jpeg"; // Corrected image path
  categories.add(categoryModel);
  
  return categories; // Return the list of categories
}

import 'package:news_app/models/category_model.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> category = <CategoryModel>[];
  CategoryModel categoryModel = CategoryModel();

  //1
  categoryModel.categoryName = "Business";
  categoryModel.image = "assets/images/business.jpg";
  category.add(categoryModel);
  categoryModel = CategoryModel();

  //2
  categoryModel.categoryName = "Entertainment";
  categoryModel.image = "assets/images/entertainment.jpg";
  category.add(categoryModel);
  categoryModel = CategoryModel();

  //3
  categoryModel.categoryName = "General";
  categoryModel.image = "assets/images/general.jpg";
  category.add(categoryModel);
  categoryModel = CategoryModel();

  //4
  categoryModel.categoryName = "Health";
  categoryModel.image = "assets/images/health.jpg";
  category.add(categoryModel);
  categoryModel = CategoryModel();

  //5
  categoryModel.categoryName = "Sports";
  categoryModel.image = "assets/images/sports.jpg";
  category.add(categoryModel);
  categoryModel = CategoryModel();

  //6
  categoryModel.categoryName = "Science";
  categoryModel.image = "assets/images/science.jpg";
  category.add(categoryModel);
  categoryModel = CategoryModel();

  //7
  categoryModel.categoryName = "Technology";
  categoryModel.image = "assets/images/technology.jpg";
  category.add(categoryModel);
  categoryModel = CategoryModel();

  return category;
}

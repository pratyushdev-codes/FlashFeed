import 'package:flutter/material.dart';
import 'package:newsapp/models/slider_model.dart';
import 'package:newsapp/models/category_model.dart';


List<sliderModel> getSliders() {
  List<sliderModel> slider = [];
  sliderModel categoryModel = new sliderModel();


// Create an instance of SliderModel
categoryModel.image = "./images/ent.jpeg"; ;
  categoryModel.name = "Bow to the authorities of Silenforce";
  slider.add(categoryModel);
  categoryModel = new sliderModel();


  categoryModel.image = "./images/ent.jpeg";
  categoryModel.name = "Bow to the authorities of Silenforce";
  slider.add(categoryModel);
  categoryModel = new sliderModel();


  categoryModel.image = "./images/business.jpeg";
  categoryModel.name = "Bow to the authorities of Silenforce";
  slider.add(categoryModel);
  categoryModel = new sliderModel();


  categoryModel.image = "./images/business.jpeg";
  categoryModel.name = "Bow to the authorities of Silenforce";
  slider.add(categoryModel);
  categoryModel = new sliderModel();

  // Repeat the above steps for the remaining items...

  return slider;
}

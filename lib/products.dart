import 'package:flutter/cupertino.dart';

class Product{
  String? name;
  String? imageUrl;
  String? details;
  double? price;
  //Function? delete;


  Product({
     //this.delete,
    required this.name,
    required this.imageUrl,
    required this.details,
    required this.price
  });
}

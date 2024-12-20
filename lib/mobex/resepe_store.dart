import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
part 'resepe_store.g.dart';

class ResepeStore = _ResepeStore with _$ResepeStore;

abstract class _ResepeStore with Store{
  @observable
  ResepeModal resepeModal=ResepeModal();

  @observable
  bool isloading=false;

  @observable
  String Error='';

  Future<void>resepeapi()async{
    isloading=true;
    Error='';
    try{
      final respose=await http.get(Uri.parse('https://dummyjson.com/recipes'));
      if(respose.statusCode==200){
        final jsonData=jsonDecode(respose.body);
        resepeModal=ResepeModal.fromJson(jsonData);

        // API RESPONSE, pretty-print the JSON response
        final prettyJson = JsonEncoder.withIndent('  ').convert(jsonData);
        debugPrint('API RESPONSE :\n$prettyJson',wrapWidth: 1024);
      }else {
        Error = 'Failed to load recipes: ${respose.statusCode}';
      }
    }catch(e){
      print("Error==>${e.toString()}");
    }finally{
      isloading=false;
    }
  }

}

class ResepeModal {
  List<Recipes>? recipes;
  int? total;
  int? skip;
  int? limit;

  ResepeModal({this.recipes, this.total, this.skip, this.limit});

  ResepeModal.fromJson(Map<String, dynamic> json) {
    if (json['recipes'] != null) {
      recipes = <Recipes>[];
      json['recipes'].forEach((v) {
        recipes!.add(new Recipes.fromJson(v));
      });
    }
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.recipes != null) {
      data['recipes'] = this.recipes!.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    data['skip'] = this.skip;
    data['limit'] = this.limit;
    return data;
  }
}

class Recipes {
  int? id;
  String? name;
  List<String>? ingredients;
  List<String>? instructions;
  int? prepTimeMinutes;
  int? cookTimeMinutes;
  int? servings;
  String? difficulty;
  String? cuisine;
  int? caloriesPerServing;
  List<String>? tags;
  int? userId;
  String? image;
  dynamic? rating;
  int? reviewCount;
  List<String>? mealType;

  Recipes(
      {this.id,
        this.name,
        this.ingredients,
        this.instructions,
        this.prepTimeMinutes,
        this.cookTimeMinutes,
        this.servings,
        this.difficulty,
        this.cuisine,
        this.caloriesPerServing,
        this.tags,
        this.userId,
        this.image,
        this.rating,
        this.reviewCount,
        this.mealType});

  Recipes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    ingredients = json['ingredients'].cast<String>();
    instructions = json['instructions'].cast<String>();
    prepTimeMinutes = json['prepTimeMinutes'];
    cookTimeMinutes = json['cookTimeMinutes'];
    servings = json['servings'];
    difficulty = json['difficulty'];
    cuisine = json['cuisine'];
    caloriesPerServing = json['caloriesPerServing'];
    tags = json['tags'].cast<String>();
    userId = json['userId'];
    image = json['image'];
    rating = json['rating'];
    reviewCount = json['reviewCount'];
    mealType = json['mealType'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['ingredients'] = this.ingredients;
    data['instructions'] = this.instructions;
    data['prepTimeMinutes'] = this.prepTimeMinutes;
    data['cookTimeMinutes'] = this.cookTimeMinutes;
    data['servings'] = this.servings;
    data['difficulty'] = this.difficulty;
    data['cuisine'] = this.cuisine;
    data['caloriesPerServing'] = this.caloriesPerServing;
    data['tags'] = this.tags;
    data['userId'] = this.userId;
    data['image'] = this.image;
    data['rating'] = this.rating;
    data['reviewCount'] = this.reviewCount;
    data['mealType'] = this.mealType;
    return data;
  }
}


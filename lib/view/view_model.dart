import 'package:flutter/material.dart';
import 'package:http_test/api/catapi.dart';
import 'package:http_test/model/cat.dart';
import 'package:http_test/widget/card.dart';

class ViewModel {
  Function setState;
  bool isLoading = false;
  ViewModel(setState);


  Future<List<Cat>> getCats() async {
    final result = await CatApi.getCatsList();
    if (result != null) {
      return Cat.listFromJson(result);
    }
  }
  Future<List<Widget>>getWidgetList() async {
    isLoading = true;
    List<Cat> catsList = await getCats();
    isLoading = false;
    return catsList.map<Widget>((element) => CatCard(element.url)).toList();
  }
}
  

import 'package:easy_eat/models/foodStall_model.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  List<Foodstall> _stalls = foodstallList;
  String _currenFilter = "Clear filter";

  List<Foodstall> get stallList {
    if (_currenFilter == "Clear filter") return _stalls;
    return _stalls
        .where((stall) =>
            stall.category != null &&
            stall.category.toLowerCase().contains(_currenFilter.toLowerCase()))
        .toList();
  }

  void setFilter(String newfilter) {
    _currenFilter = newfilter;
    notifyListeners();
  }
}

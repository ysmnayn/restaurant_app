import 'dart:math';

import 'package:get/get.dart';
import 'package:restaurant_foodly/models/additives_model.dart';


class FoodController extends GetxController {
  String _category = '';

  String get category => _category;

  set setCategory(String newValue) {
    _category = newValue;
    print(category);
  }

  final RxList<String> _types = <String>[].obs;

  RxList<String> get types => _types;

  set setTypes(String newValue) {
    _types.add(newValue);
  }

  int generateId() {
    int min = 0;
    int max = 10000;
    return min + Random().nextInt(max - min);
  }

  final RxList<Additive> _additiveList = <Additive>[].obs;

  RxList<Additive> get additiveList => _additiveList;

  set AddAdditive(Additive newValue) {
    _additiveList.add(newValue);
  }

  void clearAdditives() {
    _additiveList.clear();
  }
}
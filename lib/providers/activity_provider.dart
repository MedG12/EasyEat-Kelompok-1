import 'package:flutter/material.dart';
import 'package:easy_eat/models/orderItem_model.dart';

class ActivityProvider extends ChangeNotifier {
  // Struktur: {orderKey: {stallName1: [items], stallName2: [items]}}
  Map<String, Map<String, List<OrderItem>>> _onGoingOrders = {};
  Map<String, Map<String, List<OrderItem>>> _completedOrders = {};

  Map<String, Map<String, List<OrderItem>>> get onGoingOrders => _onGoingOrders;
  Map<String, Map<String, List<OrderItem>>> get completedOrders =>
      _completedOrders;

  void addOnGoingOrder(Map<String, List<OrderItem>> newOrders) {
    final uniqueKey = DateTime.now().millisecondsSinceEpoch.toString();

    // Group items by stall
    final Map<String, List<OrderItem>> groupedByStall = {};

    for (var item in newOrders.values.expand((list) => list)) {
      if (!groupedByStall.containsKey(item.stallName)) {
        groupedByStall[item.stallName] = [];
      }
      groupedByStall[item.stallName]!.add(item);
    }

    _onGoingOrders[uniqueKey] = groupedByStall;
    notifyListeners();
  }

  void moveToCompleted(String orderKey) {
    if (_onGoingOrders.containsKey(orderKey)) {
      final order = _onGoingOrders[orderKey]!;

      _completedOrders[orderKey] = order;
      _onGoingOrders.remove(orderKey);
      notifyListeners();
    }
  }

  void removeOnGoingOrder(String orderKey) {
    _onGoingOrders.remove(orderKey);
    notifyListeners();
  }
}

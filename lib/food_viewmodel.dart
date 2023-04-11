import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:view_model_x/view_model_x.dart';


class CounterViewModel extends ChangeNotifier {

    int _amountCounterState = 1;
    int get amountCounterState => _amountCounterState;

        int _currentPrice = 1;
    int get currentPrice => _currentPrice;

            int _totalPrice = 1;
    int get totalPrice => _totalPrice;

    void incrementQuantity(){
      _amountCounterState++;
      notifyListeners();
    }

    void getCurrentPrice(int price){
        _currentPrice = _amountCounterState * price;
    }

    void getTotalPrice(){
        _totalPrice += _currentPrice;
    }

    void decrementQuantity(){
      if(amountCounterState > 1){
      _amountCounterState--;
      notifyListeners();
      }
    }



}
import 'package:case_questions/feature/view/home_screen.dart';
import 'package:flutter/material.dart';

class LoadingViewModel extends ChangeNotifier {
  bool isLoading = false;

  void _changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  Future<HomeScreen> controlButtonValue() async {
    _changeLoading();
    await Future.delayed(const Duration(seconds: 1));
    _changeLoading();

    return HomeScreen();
  }
}

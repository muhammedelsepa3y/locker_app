import 'dart:async';

import 'package:flutter/material.dart';
import 'package:locker_app/core/error/custom_err.dart';
import 'package:locker_app/core/utils/route_constants.dart';
import 'package:locker_app/locker/domain/entities/locker.dart';
import 'package:locker_app/locker/domain/usecases/get_lockers_list.dart';
import 'package:locker_app/locker/presentation/widgets/dashboard_bar/dashboard_bar.dart';

import '../../../core/usecase/base_usecase.dart';
import '../../domain/usecases/add_locker.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../screens/dashboard/dashboard_home.dart';
import '../screens/lockers/add_locker.dart';
import '../screens/lockers/manage_locker.dart';
import '../screens/lockers/view_locker.dart';
import '../screens/manage/manage_home.dart';
import '../screens/users/users_home.dart';

class LockerProvider extends ChangeNotifier {
  final GetLockersListUseCase getLockersListUseCase;
  final AddLockerUseCase addLockerUseCase;

  LockerProvider(
      {required this.getLockersListUseCase, required this.addLockerUseCase});

  final List<Locker> _lockers = [];

  List<Locker> get lockers => _lockers;
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  bool _isInternetConnected = false;
  late CustomError _error;
  bool _isError = false;

  bool get isError => _isError;

  CustomError get error => _error;
  String _selectedMainPage = "Lockers";
  String get selectedMainPage => _selectedMainPage;
  String _selectedSubPageText="Add Locker";
  String get selectedSubPageText => _selectedSubPageText;
  Widget _selectedSubPage = AddLocker();
  set selectedPage(String page) {
    bool isFound = false;
    _selectedItem.forEach((key, value) {
      if (key == page) {
        _selectedSubPage = value[0].values.first;
        _selectedMainPage = key;
        _selectedSubPageText=value[0].keys.first;
        isFound = true;
      }
    });
    if (!isFound) {
      _selectedItem[_selectedMainPage].forEach((element) {
        if (element.keys.first == page) {
          _selectedSubPage = element.values.first;
          _selectedSubPageText=element.keys.first;
        }
      });
    }
    notifyListeners();
  }
  Widget get selectedSubPage => _selectedSubPage;

  List<String> getSubPages (){
    List <String> subPages=[];
     _selectedItem[_selectedMainPage].forEach((element) {
        subPages.add(element.keys.first);
     });
     return subPages;
  }



  final Map<String, dynamic> _selectedItem = {
    "Dashboard": [
      {"Home": DashboardHome()}
    ],
    "Users": [
      {"Home": UsersHome()},
    ],
    "Lockers": [
      {"Add Locker": AddLocker()},
      {"Manage Locker": ManageLocker()},
      {"View Locker": ViewLocker()},
    ],
    "Manage": [
      {"Home": ManageHome()},
    ],
  };

  Map<String, dynamic> get selectedItem => _selectedItem;

  Future getLockers() async {
    _isInternetConnected = await InternetConnectionChecker().hasConnection;
    if (_isInternetConnected) {
      _isLoading = true;
      notifyListeners();
      final result = await getLockersListUseCase.call(NoParams());
      result.fold((l) {
        _isLoading = false;
        _error = l;
        _isError = true;
        notifyListeners();
      }, (r) {
        _lockers.clear();
        _lockers.addAll(r);
        _isLoading = false;
        notifyListeners();
      });
    } else {
      _error = CustomError("No internet connection");
      notifyListeners();
    }
  }

  Future addLocker(Locker locker) async {
    if (_isInternetConnected) {
      _isLoading = true;
      notifyListeners();
      final result = await addLockerUseCase.call(locker);
      result.fold((l) {
        _isLoading = false;
        _error = l;
        notifyListeners();
      }, (r) {
        _isLoading = false;
        notifyListeners();
      });
    } else {
      _error = CustomError("No internet connection");
      notifyListeners();
    }
  }
}

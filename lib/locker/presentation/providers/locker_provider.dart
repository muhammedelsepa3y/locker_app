import 'dart:async';

import 'package:flutter/material.dart';
import 'package:locker_app/core/error/custom_err.dart';
import 'package:locker_app/locker/domain/entities/locker.dart';
import 'package:locker_app/locker/domain/usecases/get_lockers_list.dart';

import '../../../core/usecase/base_usecase.dart';
import '../../domain/usecases/add_locker.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

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

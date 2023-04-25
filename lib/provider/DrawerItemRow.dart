
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';


class DrawerItemRow extends ChangeNotifier{

  String _currentRoute = "/";

  String get currentRoute => _currentRoute;
  bool _isregister = false;
  bool _isValidateUser = false;
  bool _isPleaseWaitShow = false;

 // AttendenceSummeryModel? _model;
  Map _source = {ConnectivityResult.none: false};
  String _Inwifimode = "";
  String get Inwifimode => _Inwifimode;

  String _lastPunch = "";
  String get lastPunch => _lastPunch;


  String _InBeconemode = "";
  String get InBeconmode => _InBeconemode;

  bool get isregister => _isregister;
  bool get isValidateUser => _isValidateUser;
  bool get isPleaseWaitShow => _isPleaseWaitShow;
  Map get source => _source;


  updateLastPunched(result) {
    _lastPunch = result;
    notifyListeners();
  }
  updateSource(result) {
    _source = result;
    notifyListeners();
  }

  updateRegisterState(value){
    _isregister =value;
    notifyListeners();
  }
  updatewifimode(value){
    _Inwifimode = value;
    notifyListeners();
  }
  updatebeconemode(value){
    _InBeconemode = value;
    notifyListeners();
  }
  updateisPleaseWaitShow(value){
    _isPleaseWaitShow =value;
    notifyListeners();
  }
  UpdateUser(value){
    _isValidateUser = value;
    notifyListeners();
  }
   void UpdateRoute(value){
    _currentRoute = value;
    notifyListeners();
  }
}


import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:zen_expenses_manager/Model/TafSummaryModel.dart';

import 'ApiConstants.dart';
import 'Model/LoginDataModel.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'Model/TAFExpenseSummaryByTAFid.dart';

class ApiService{

  Future<bool> check_connection_network() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  Future<List<LoginDataModel>> Login(String UserName,String password) async
  {
    List<LoginDataModel> list = [];
    try {
      var url = ApiConstants.baseUrl + "LoginArray?UserName="+UserName+"&Password="+password+"";
      print('URL==>' + url);
      var res = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10),
          onTimeout: () {
            // Time has run out, do what you wanted to do.
            return http.Response('Error', 408); // Request Timeout response status code
          });
      print("res" + res.body);

      if (res.statusCode == 200) {
        list = LoginDataModel().LoginDataModelFromJson(res.body);
      }
    } catch (e) {
      log(e.toString());
    }
    print('size-->'+list.length.toString());
    return list;
  }
  Future<List<TafSummaryModel>> GetTafWithSummaryByUserid(String Userid,String UserRole,String Status,String Fromdate,String Todate) async
  {
    List<TafSummaryModel> list = [];
    try {
      var url = ApiConstants.baseUrl + "GetTafWithSummaryByUserid?UserID="+Userid+"&Userrole="+UserRole+"&Status="+Status+"&FromDate="+Fromdate+"&ToDate="+Todate;
      print('URL==>' + url);
      var res = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10),
          onTimeout: () {
            // Time has run out, do what you wanted to do.
            return http.Response('Error', 408); // Request Timeout response status code
          });
      print("res" + res.body);

      if (res.statusCode == 200) {
        list = TafSummaryModel().TafSummaryModelFromJson(res.body);
      }
    } catch (e) {
      log(e.toString());
    }
    print('size-->'+list.length.toString());
    return list;
  }

  Future<List<TAFExpenseSummaryByTAFid>> GetTafExpenseSummaryByTAFid(String TAF_ID) async
  {
    List<TAFExpenseSummaryByTAFid> list = [];
    try {
      var url = ApiConstants.baseUrl + "GetTafExpenseSummaryByTAFid?TAFID="+TAF_ID;
      print('URL==>' + url);
      var res = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10),
          onTimeout: () {
            // Time has run out, do what you wanted to do.
            return http.Response('Error', 408); // Request Timeout response status code
          });
      print("res" + res.body);

      if (res.statusCode == 200) {
        list = TAFExpenseSummaryByTAFid().TAFExpenseSummaryByTAFidModelFromJson(res.body);
      }
    } catch (e) {
      log(e.toString());
    }
    print('size-->'+list.length.toString());
    return list;
  }

}
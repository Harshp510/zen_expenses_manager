

import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:zen_expenses_manager/Model/TafSummaryModel.dart';

import 'ApiConstants.dart';
import 'Model/ExpenseDateModel.dart';
import 'Model/ExpenseHeadModel.dart';
import 'Model/FinalinsertTafExpenseModel.dart';
import 'Model/InsertTafModel.dart';
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
  Future<List<ExpenseHeadModel>> GetExpenseHeadList() async
  {
    List<ExpenseHeadModel> list = [];
    try {
      var url = ApiConstants.baseUrl + "ExpenseHeadList";
      print('URL==>' + url);
      var res = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10),
          onTimeout: () {
            // Time has run out, do what you wanted to do.
            return http.Response('Error', 408); // Request Timeout response status code
          });
      print("res" + res.body);

      if (res.statusCode == 200) {
        list = ExpenseHeadModel().ExpenseHeadModelFromJson(res.body);
      }
    } catch (e) {
      log(e.toString());
    }
    print('size-->'+list.length.toString());
    return list;
  }
  Future<List<ExpenseDateModel>> GetExpenseDateListFromID(String TAF_ID) async
  {
    List<ExpenseDateModel> list = [];
    try {
      var url = ApiConstants.baseUrl + "ExpenseDateListFromID?TAFID="+TAF_ID;
      print('URL==>' + url);
      var res = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10),
          onTimeout: () {
            // Time has run out, do what you wanted to do.
            return http.Response('Error', 408); // Request Timeout response status code
          });
      print("res" + res.body);

      if (res.statusCode == 200) {
        list = ExpenseDateModel().ExpenseDateModelFromJson(res.body);
      }
    } catch (e) {
      log(e.toString());
    }
    print('size-->'+list.length.toString());
    return list;
  }
  Future<List<InsertTafModel>> insertTafExpensedetailByTafid(String TAF_ID,String ExpenseDate,String ExpenseType,String Amount,String Particulars) async
  {
    List<InsertTafModel> list = [];
    try {
      var url = ApiConstants.baseUrl + "insertTafExpensedetailByTafid?TafId="+TAF_ID+"&ExpenseDate="+ExpenseDate+"&ExpenseType="+ExpenseType+"&Amount="+Amount+"&Particulars="+Particulars;
      print('URL==>' + url);
      var res = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10),
          onTimeout: () {
            // Time has run out, do what you wanted to do.
            return http.Response('Error', 408); // Request Timeout response status code
          });
      print("res" + res.body);

      if (res.statusCode == 200) {
        list = InsertTafModel().InsertTafModelFromJson(res.body);
      }
    } catch (e) {
      log(e.toString());
    }
    print('size-->'+list.length.toString());
    return list;
  }
  Future<List<FinalinsertTafExpenseModel>> insertTafExpenseEVoucherUpload(String TAF_ID,String DetailId) async
  {
    List<FinalinsertTafExpenseModel> list = [];
    try {
      var url = ApiConstants.baseUrl + "insertTafExpenseEVoucherUpload?TAFId="+TAF_ID+"&DetailId="+DetailId;
      print('URL==>' + url);
      var res = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10),
          onTimeout: () {
            // Time has run out, do what you wanted to do.
            return http.Response('Error', 408); // Request Timeout response status code
          });
      print("res" + res.body);

      if (res.statusCode == 200) {
        list = FinalinsertTafExpenseModel().FinalinsertTafExpenseModelFromJson(res.body);
      }
    } catch (e) {
      log(e.toString());
    }
    print('size-->'+list.length.toString());
    return list;
  }
  Future<List<FinalinsertTafExpenseModel>> insertTafExpenseImageUpload(String TAF_ID,String DetailId,String ImgBase64) async
  {
    List<FinalinsertTafExpenseModel> list = [];
    try {
      var url = "https://portal.zengroup.co.in/iphonewebservice/TAF.asmx/insertTafExpenseImageUpload";
          //"insertTafExpenseImageUpload?TAFId="+TAF_ID+"&DetailId="+DetailId+"&ImgBase64="+ImgBase64;
      print('URL==>' + url);
      var map = Map<String, dynamic>();
      map['Id'] = TAF_ID;
      map['DetailId'] = DetailId;
      map['ImgBase64'] = ImgBase64;
      print(map.toString());
      var res = await http.post(Uri.parse(url),body:map).timeout(const Duration(seconds: 10),
          onTimeout: () {
            // Time has run out, do what you wanted to do.
            return http.Response('Error', 408); // Request Timeout response status code
          });
      print("res" + res.body);

      if (res.statusCode == 200) {
        list = FinalinsertTafExpenseModel().FinalinsertTafExpenseModelFromJson(res.body);
      }
    } catch (e) {
      log(e.toString());
    }
    print('size-->'+list.length.toString());
    return list;
  }
}
import 'dart:convert';

class ExpenseHeadModel {
  String? allExpenseHeadID;
  String? expenseHeadName;

  ExpenseHeadModel({this.allExpenseHeadID, this.expenseHeadName});

  ExpenseHeadModel.fromJson(Map<String, dynamic> json) {
    allExpenseHeadID = json['AllExpenseHead_ID'];
    expenseHeadName = json['ExpenseHeadName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AllExpenseHead_ID'] = this.allExpenseHeadID;
    data['ExpenseHeadName'] = this.expenseHeadName;
    return data;
  }
  List<ExpenseHeadModel> ExpenseHeadModelFromJson(String str) =>
      List<ExpenseHeadModel>.from(json.decode(str).map((x) => ExpenseHeadModel.fromJson(x)));

  String ExpenseHeadModelToJson(List<ExpenseHeadModel> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
}
import 'dart:convert';

class InsertTafModel {
  String? status;
  String? expenseDetailId;

  InsertTafModel({this.status, this.expenseDetailId});

  InsertTafModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    expenseDetailId = json['ExpenseDetailId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Status'] = this.status;
    data['ExpenseDetailId'] = this.expenseDetailId;
    return data;
  }

  List<InsertTafModel> InsertTafModelFromJson(String str) =>
      List<InsertTafModel>.from(json.decode(str).map((x) => InsertTafModel.fromJson(x)));

  String InsertTafModelToJson(List<InsertTafModel> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
}
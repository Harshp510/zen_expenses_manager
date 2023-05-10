import 'dart:convert';

class FinalinsertTafExpenseModel {
  String? status;

  FinalinsertTafExpenseModel({this.status});

  FinalinsertTafExpenseModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Status'] = this.status;
    return data;
  }

  List<FinalinsertTafExpenseModel> FinalinsertTafExpenseModelFromJson(String str) =>
      List<FinalinsertTafExpenseModel>.from(json.decode(str).map((x) => FinalinsertTafExpenseModel.fromJson(x)));

  String FinalinsertTafExpenseModelToJson(List<FinalinsertTafExpenseModel> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
}
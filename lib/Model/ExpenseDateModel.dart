import 'dart:convert';

class ExpenseDateModel {
  String? allDates;
  String? newDate;

  ExpenseDateModel({this.allDates, this.newDate});

  ExpenseDateModel.fromJson(Map<String, dynamic> json) {
    allDates = json['AllDates'];
    newDate = json['NewDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AllDates'] = this.allDates;
    data['NewDate'] = this.newDate;
    return data;
  }

  List<ExpenseDateModel> ExpenseDateModelFromJson(String str) =>
      List<ExpenseDateModel>.from(json.decode(str).map((x) => ExpenseDateModel.fromJson(x)));

  String ExpenseDateModelToJson(List<ExpenseDateModel> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
}
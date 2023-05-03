import 'dart:convert';
import 'dart:ffi';

class TAFExpenseSummaryByTAFid {
  String? expenseDetailID;
  String? tAFId;
  String? expenseDate;
  String? expenseType;
  double? amount;
  String? particulars;
  String? flag;
  String? validation;
  String? validationOn;
  String? validationBy;
  String? gSTApplicable;
  String? hSNSAC;
  String? iGSTAmt;
  String? cGSTAmt;
  String? sGSTAmt;
  String? totalGST;
  String? rCCGST;
  String? rCSGST;
  String? rCIGST;
  String? gSTType;
  String? expenseHeadName;
  String? fileName;
  String? expenseDate1;

  TAFExpenseSummaryByTAFid(
      {this.expenseDetailID,
        this.tAFId,
        this.expenseDate,
        this.expenseType,
        this.amount,
        this.particulars,
        this.flag,
        this.validation,
        this.validationOn,
        this.validationBy,
        this.gSTApplicable,
        this.hSNSAC,
        this.iGSTAmt,
        this.cGSTAmt,
        this.sGSTAmt,
        this.totalGST,
        this.rCCGST,
        this.rCSGST,
        this.rCIGST,
        this.gSTType,
        this.expenseHeadName,
        this.fileName,
        this.expenseDate1});

  TAFExpenseSummaryByTAFid.fromJson(Map<String, dynamic> json) {
    expenseDetailID = json['ExpenseDetailID'];
    tAFId = json['TAF_Id'];
    expenseDate = json['ExpenseDate'];
    expenseType = json['ExpenseType'];
    amount = json['Amount'];
    particulars = json['Particulars'];
    flag = json['Flag'];
    validation = json['Validation'];
    validationOn = json['ValidationOn'];
    validationBy = json['ValidationBy'];
    gSTApplicable = json['GSTApplicable'];
    hSNSAC = json['HSNSAC'];
    iGSTAmt = json['IGSTAmt'];
    cGSTAmt = json['CGSTAmt'];
    sGSTAmt = json['SGSTAmt'];
    totalGST = json['TotalGST'];
    rCCGST = json['RCCGST'];
    rCSGST = json['RCSGST'];
    rCIGST = json['RCIGST'];
    gSTType = json['GSTType'];
    expenseHeadName = json['ExpenseHeadName'];
    fileName = json['FileName'];
    expenseDate1 = json['ExpenseDate1'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ExpenseDetailID'] = this.expenseDetailID;
    data['TAF_Id'] = this.tAFId;
    data['ExpenseDate'] = this.expenseDate;
    data['ExpenseType'] = this.expenseType;
    data['Amount'] = this.amount;
    data['Particulars'] = this.particulars;
    data['Flag'] = this.flag;
    data['Validation'] = this.validation;
    data['ValidationOn'] = this.validationOn;
    data['ValidationBy'] = this.validationBy;
    data['GSTApplicable'] = this.gSTApplicable;
    data['HSNSAC'] = this.hSNSAC;
    data['IGSTAmt'] = this.iGSTAmt;
    data['CGSTAmt'] = this.cGSTAmt;
    data['SGSTAmt'] = this.sGSTAmt;
    data['TotalGST'] = this.totalGST;
    data['RCCGST'] = this.rCCGST;
    data['RCSGST'] = this.rCSGST;
    data['RCIGST'] = this.rCIGST;
    data['GSTType'] = this.gSTType;
    data['ExpenseHeadName'] = this.expenseHeadName;
    data['FileName'] = this.fileName;
    data['ExpenseDate1'] = this.expenseDate1;
    return data;
  }

  List<TAFExpenseSummaryByTAFid> TAFExpenseSummaryByTAFidModelFromJson(String str) =>
      List<TAFExpenseSummaryByTAFid>.from(json.decode(str).map((x) => TAFExpenseSummaryByTAFid.fromJson(x)));

  String TAFExpenseSummaryByTAFidModelToJson(List<TAFExpenseSummaryByTAFid> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
}
import 'dart:convert';

class TafSummaryModel {
  String? tAFId;
  String? tAFType;
  String? indentor;
  String? srNo;
  String? tAFDate;
  String? travelAmt;
  String? lodgingAmt;
  String? boardingAmt;
  String? otherAmt;
  String? totalAmt;
  String? status;
  int? noOfDays;
  int? noOfPerson;
  String? foodAllowanceUnitRate;
  String? foodAllowanceBudget;
  String? roomAllowanceUnitRate;
  String? roomAllowanceBudget;
  String? conveyanceAllowanceUnitRate;
  String? conveyanceAllowanceBudget;
  String? miscelleneousAllowanceUnitRate;
  String? miscelleneousAllowanceBudget;
  String? approvedAmount;
  String? iOUIndentedAmount;
  String? remiitedAmount;
  String? remmitanceDate;
  String? expenseClearanceStatus;
  String? expenseClearanceAmount;
  String? expenseClearanceDate;
  String? amountApprovedBy;
  String? amountApprovedOn;
  String? tripReportStatus;
  String? expenseClaimStatus;
  String? finalApprovedAmount;
  String? finalApprovalBy;
  String? finalApprovalOn;
  String? amountPaid;
  String? amountPaidBy;
  String? amountPaidOn;
  String? adjustmentAmount;
  String? lastModifiedOn;
  String? lastModifiedBy;
  bool? mailSent;
  String? autoSrno;
  String? payCollectionRemarks;
  String? payCollectStatus;
  String? finalSettlementApprovalStatus;
  String? finalSettlementApprovedBy;
  String? finalSettlementApprovedOn;
  String? collectedAmount;
  String? payCollectOn;
  String? budgetReportToApproval;
  String? budgetDirectorApproval;
  String? budgetReportToApOn;
  String? budgetDirectorApOn;
  String? budgetReportToApRemarks;
  String? budgetDirectorApRemarks;
  String? tripReportApproval;
  String? tripReportApOn;
  String? tripReportApRemarks;
  String? expenseReportToApproval;
  String? expenseDirectorApproval;
  String? expenseReportToApOn;
  String? expenseDirectorApOn;
  String? expenseReportToApRemarks;
  String? expenseDirectorApRemarks;
  String? validatedBy;
  String? validatedOn;
  String? tripReportValidatedOn;
  String? tripReportValidatedBy;
  String? expenseValidatedOn;
  String? expenseValidatedBy;
  String? eReceiptAck;
  String? eReceiptAckBy;
  String? eReceiptAckOn;
  String? eReceiptRemarks;
  String? tAFCreationDate;
  String? travelApprovedAmt;
  String? hotelApprovedAmt;
  String? foodApprovedAmt;
  String? conveyanceApprovedAmt;
  String? miscellenousApprovedAmt;
  String? receiptAccounts;
  String? receiptAccountsBy;
  String? receiptAccountsOn;
  String? lDRVoucherNo;
  String? lDRVoucherID;
  String? expenseAccountToApproval;
  String? expenseAccountApOn;
  String? expenseAccountToApRemarks;
  String? totalAmt1;
  String? indentorName;
  String? tAFApproval;
  String? tAFApproval1;
  String? tripReportToApproval;
  String? expenseApproval;
  String? settlementApprovalStatus;
  String? paymentStatus;
  String? tAFApprovalDirector1;
  String? tAFApprovalDirector;
  String? expenseApprovalDirector;
  String? adminExpenseStatus;
  int? age;
  String? smeExpenseClaimStatus;
  String? smeClaimAmount;
  String? smeExpValidationStatus;
  String? smeValidationAge;
  String? smeMAStatus;
  String? smeMAAge;
  String? smtrStatus;
  String? smtrValidationStatus;
  String? smtrApprovalPendingBy;
  String? smtrTripReportValidationAge;
  String? smtrTripReportApprovalAge;
  String? smpPINo;
  String? smpPIDate;
  String? smpPIId;
  String? smpPIAmt;
  String? smpPIAge;
  String? smpTAFIOUPaymentStatus;
  String? smpTAFTripStatus;
  String? smtrStartDate;
  String? endDate;
  String? smtrEndDate;
  String? smtrTripDays;
  String? smtrLocation;
  String? smtrTAFAdvance;
  String? smeExpenseClaimDate;
  String? expenseClaimDate;
  String? smeExpenseFilingAge;
  int? smtrReportFilingAge;
  String? tAFDate1;

  TafSummaryModel(
      {this.tAFId,
        this.tAFType,
        this.indentor,
        this.srNo,
        this.tAFDate,
        this.travelAmt,
        this.lodgingAmt,
        this.boardingAmt,
        this.otherAmt,
        this.totalAmt,
        this.status,
        this.noOfDays,
        this.noOfPerson,
        this.foodAllowanceUnitRate,
        this.foodAllowanceBudget,
        this.roomAllowanceUnitRate,
        this.roomAllowanceBudget,
        this.conveyanceAllowanceUnitRate,
        this.conveyanceAllowanceBudget,
        this.miscelleneousAllowanceUnitRate,
        this.miscelleneousAllowanceBudget,
        this.approvedAmount,
        this.iOUIndentedAmount,
        this.remiitedAmount,
        this.remmitanceDate,
        this.expenseClearanceStatus,
        this.expenseClearanceAmount,
        this.expenseClearanceDate,
        this.amountApprovedBy,
        this.amountApprovedOn,
        this.tripReportStatus,
        this.expenseClaimStatus,
        this.finalApprovedAmount,
        this.finalApprovalBy,
        this.finalApprovalOn,
        this.amountPaid,
        this.amountPaidBy,
        this.amountPaidOn,
        this.adjustmentAmount,
        this.lastModifiedOn,
        this.lastModifiedBy,
        this.mailSent,
        this.autoSrno,
        this.payCollectionRemarks,
        this.payCollectStatus,
        this.finalSettlementApprovalStatus,
        this.finalSettlementApprovedBy,
        this.finalSettlementApprovedOn,
        this.collectedAmount,
        this.payCollectOn,
        this.budgetReportToApproval,
        this.budgetDirectorApproval,
        this.budgetReportToApOn,
        this.budgetDirectorApOn,
        this.budgetReportToApRemarks,
        this.budgetDirectorApRemarks,
        this.tripReportApproval,
        this.tripReportApOn,
        this.tripReportApRemarks,
        this.expenseReportToApproval,
        this.expenseDirectorApproval,
        this.expenseReportToApOn,
        this.expenseDirectorApOn,
        this.expenseReportToApRemarks,
        this.expenseDirectorApRemarks,
        this.validatedBy,
        this.validatedOn,
        this.tripReportValidatedOn,
        this.tripReportValidatedBy,
        this.expenseValidatedOn,
        this.expenseValidatedBy,
        this.eReceiptAck,
        this.eReceiptAckBy,
        this.eReceiptAckOn,
        this.eReceiptRemarks,
        this.tAFCreationDate,
        this.travelApprovedAmt,
        this.hotelApprovedAmt,
        this.foodApprovedAmt,
        this.conveyanceApprovedAmt,
        this.miscellenousApprovedAmt,
        this.receiptAccounts,
        this.receiptAccountsBy,
        this.receiptAccountsOn,
        this.lDRVoucherNo,
        this.lDRVoucherID,
        this.expenseAccountToApproval,
        this.expenseAccountApOn,
        this.expenseAccountToApRemarks,
        this.totalAmt1,
        this.indentorName,
        this.tAFApproval,
        this.tAFApproval1,
        this.tripReportToApproval,
        this.expenseApproval,
        this.settlementApprovalStatus,
        this.paymentStatus,
        this.tAFApprovalDirector1,
        this.tAFApprovalDirector,
        this.expenseApprovalDirector,
        this.adminExpenseStatus,
        this.age,
        this.smeExpenseClaimStatus,
        this.smeClaimAmount,
        this.smeExpValidationStatus,
        this.smeValidationAge,
        this.smeMAStatus,
        this.smeMAAge,
        this.smtrStatus,
        this.smtrValidationStatus,
        this.smtrApprovalPendingBy,
        this.smtrTripReportValidationAge,
        this.smtrTripReportApprovalAge,
        this.smpPINo,
        this.smpPIDate,
        this.smpPIId,
        this.smpPIAmt,
        this.smpPIAge,
        this.smpTAFIOUPaymentStatus,
        this.smpTAFTripStatus,
        this.smtrStartDate,
        this.endDate,
        this.smtrEndDate,
        this.smtrTripDays,
        this.smtrLocation,
        this.smtrTAFAdvance,
        this.smeExpenseClaimDate,
        this.expenseClaimDate,
        this.smeExpenseFilingAge,
        this.smtrReportFilingAge,
        this.tAFDate1});

  TafSummaryModel.fromJson(Map<String, dynamic> json) {
    tAFId = json['TAF_Id'];
    tAFType = json['TAF_Type'];
    indentor = json['Indentor'];
    srNo = json['SrNo'];
    tAFDate = json['TAFDate'];
    travelAmt = json['TravelAmt'];
    lodgingAmt = json['LodgingAmt'];
    boardingAmt = json['BoardingAmt'];
    otherAmt = json['OtherAmt'];
    totalAmt = json['TotalAmt'];
    status = json['Status'];
    noOfDays = json['NoOfDays'];
    noOfPerson = json['NoOfPerson'];
    foodAllowanceUnitRate = json['FoodAllowanceUnitRate'];
    foodAllowanceBudget = json['FoodAllowanceBudget'];
    roomAllowanceUnitRate = json['RoomAllowanceUnitRate'];
    roomAllowanceBudget = json['RoomAllowanceBudget'];
    conveyanceAllowanceUnitRate = json['ConveyanceAllowanceUnitRate'];
    conveyanceAllowanceBudget = json['ConveyanceAllowanceBudget'];
    miscelleneousAllowanceUnitRate = json['MiscelleneousAllowanceUnitRate'];
    miscelleneousAllowanceBudget = json['MiscelleneousAllowanceBudget'];
    approvedAmount = json['ApprovedAmount'];
    iOUIndentedAmount = json['IOUIndentedAmount'];
    remiitedAmount = json['RemiitedAmount'];
    remmitanceDate = json['RemmitanceDate'];
    expenseClearanceStatus = json['ExpenseClearanceStatus'];
    expenseClearanceAmount = json['ExpenseClearanceAmount'];
    expenseClearanceDate = json['ExpenseClearanceDate'];
    amountApprovedBy = json['AmountApprovedBy'];
    amountApprovedOn = json['AmountApprovedOn'];
    tripReportStatus = json['TripReportStatus'];
    expenseClaimStatus = json['ExpenseClaimStatus'];
    finalApprovedAmount = json['FinalApprovedAmount'];
    finalApprovalBy = json['FinalApprovalBy'];
    finalApprovalOn = json['FinalApprovalOn'];
    amountPaid = json['AmountPaid'];
    amountPaidBy = json['AmountPaidBy'];
    amountPaidOn = json['AmountPaidOn'];
    adjustmentAmount = json['AdjustmentAmount'];
    lastModifiedOn = json['LastModifiedOn'];
    lastModifiedBy = json['LastModifiedBy'];
    mailSent = json['MailSent'];
    autoSrno = json['autoSrno'];
    payCollectionRemarks = json['PayCollectionRemarks'];
    payCollectStatus = json['PayCollectStatus'];
    finalSettlementApprovalStatus = json['FinalSettlementApprovalStatus'];
    finalSettlementApprovedBy = json['FinalSettlementApprovedBy'];
    finalSettlementApprovedOn = json['FinalSettlementApprovedOn'];
    collectedAmount = json['CollectedAmount'];
    payCollectOn = json['PayCollectOn'];
    budgetReportToApproval = json['BudgetReportToApproval'];
    budgetDirectorApproval = json['BudgetDirectorApproval'];
    budgetReportToApOn = json['BudgetReportToApOn'];
    budgetDirectorApOn = json['BudgetDirectorApOn'];
    budgetReportToApRemarks = json['BudgetReportToApRemarks'];
    budgetDirectorApRemarks = json['BudgetDirectorApRemarks'];
    tripReportApproval = json['TripReportApproval'];
    tripReportApOn = json['TripReportApOn'];
    tripReportApRemarks = json['TripReportApRemarks'];
    expenseReportToApproval = json['ExpenseReportToApproval'];
    expenseDirectorApproval = json['ExpenseDirectorApproval'];
    expenseReportToApOn = json['ExpenseReportToApOn'];
    expenseDirectorApOn = json['ExpenseDirectorApOn'];
    expenseReportToApRemarks = json['ExpenseReportToApRemarks'];
    expenseDirectorApRemarks = json['ExpenseDirectorApRemarks'];
    validatedBy = json['ValidatedBy'];
    validatedOn = json['ValidatedOn'];
    tripReportValidatedOn = json['TripReportValidatedOn'];
    tripReportValidatedBy = json['TripReportValidatedBy'];
    expenseValidatedOn = json['ExpenseValidatedOn'];
    expenseValidatedBy = json['ExpenseValidatedBy'];
    eReceiptAck = json['EReceiptAck'];
    eReceiptAckBy = json['EReceiptAckBy'];
    eReceiptAckOn = json['EReceiptAckOn'];
    eReceiptRemarks = json['EReceiptRemarks'];
    tAFCreationDate = json['TAFCreationDate'];
    travelApprovedAmt = json['TravelApprovedAmt'];
    hotelApprovedAmt = json['HotelApprovedAmt'];
    foodApprovedAmt = json['FoodApprovedAmt'];
    conveyanceApprovedAmt = json['ConveyanceApprovedAmt'];
    miscellenousApprovedAmt = json['MiscellenousApprovedAmt'];
    receiptAccounts = json['ReceiptAccounts'];
    receiptAccountsBy = json['ReceiptAccountsBy'];
    receiptAccountsOn = json['ReceiptAccountsOn'];
    lDRVoucherNo = json['LDR_voucherNo'];
    lDRVoucherID = json['LDR_voucherID'];
    expenseAccountToApproval = json['ExpenseAccountToApproval'];
    expenseAccountApOn = json['ExpenseAccountApOn'];
    expenseAccountToApRemarks = json['ExpenseAccountToApRemarks'];
    totalAmt1 = json['TotalAmt1'];
    indentorName = json['IndentorName'];
    tAFApproval = json['TAFApproval'];
    tAFApproval1 = json['TAFApproval1'];
    tripReportToApproval = json['TripReportToApproval'];
    expenseApproval = json['ExpenseApproval'];
    settlementApprovalStatus = json['SettlementApprovalStatus'];
    paymentStatus = json['PaymentStatus'];
    tAFApprovalDirector1 = json['TAFApprovalDirector1'];
    tAFApprovalDirector = json['TAFApprovalDirector'];
    expenseApprovalDirector = json['ExpenseApprovalDirector'];
    adminExpenseStatus = json['AdminExpenseStatus'];
    age = json['Age'];
    smeExpenseClaimStatus = json['sme_ExpenseClaimStatus'];
    smeClaimAmount = json['sme_ClaimAmount'];
    smeExpValidationStatus = json['sme_ExpValidationStatus'];
    smeValidationAge = json['sme_ValidationAge'];
    smeMAStatus = json['sme_MAStatus'];
    smeMAAge = json['sme_MAAge'];
    smtrStatus = json['smtr_Status'];
    smtrValidationStatus = json['smtr_ValidationStatus'];
    smtrApprovalPendingBy = json['smtr_ApprovalPendingBy'];
    smtrTripReportValidationAge = json['smtr_TripReportValidationAge'];
    smtrTripReportApprovalAge = json['smtr_TripReportApprovalAge'];
    smpPINo = json['smp_PINo'];
    smpPIDate = json['smp_PIDate'];
    smpPIId = json['smp_PIId'];
    smpPIAmt = json['smp_PIAmt'];
    smpPIAge = json['smp_PIAge'];
    smpTAFIOUPaymentStatus = json['smp_TAFIOUPaymentStatus'];
    smpTAFTripStatus = json['smp_TAFTripStatus'];
    smtrStartDate = json['smtr_StartDate'];
    endDate = json['EndDate'];
    smtrEndDate = json['smtr_EndDate'];
    smtrTripDays = json['smtr_TripDays'];
    smtrLocation = json['smtr_Location'];
    smtrTAFAdvance = json['smtr_TAFAdvance'];
    smeExpenseClaimDate = json['sme_ExpenseClaimDate'];
    expenseClaimDate = json['ExpenseClaimDate'];
    smeExpenseFilingAge = json['sme_ExpenseFilingAge'];
    smtrReportFilingAge = json['smtr_ReportFilingAge'];
    tAFDate1 = json['TAFDate1'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['TAF_Id'] = this.tAFId;
    data['TAF_Type'] = this.tAFType;
    data['Indentor'] = this.indentor;
    data['SrNo'] = this.srNo;
    data['TAFDate'] = this.tAFDate;
    data['TravelAmt'] = this.travelAmt;
    data['LodgingAmt'] = this.lodgingAmt;
    data['BoardingAmt'] = this.boardingAmt;
    data['OtherAmt'] = this.otherAmt;
    data['TotalAmt'] = this.totalAmt;
    data['Status'] = this.status;
    data['NoOfDays'] = this.noOfDays;
    data['NoOfPerson'] = this.noOfPerson;
    data['FoodAllowanceUnitRate'] = this.foodAllowanceUnitRate;
    data['FoodAllowanceBudget'] = this.foodAllowanceBudget;
    data['RoomAllowanceUnitRate'] = this.roomAllowanceUnitRate;
    data['RoomAllowanceBudget'] = this.roomAllowanceBudget;
    data['ConveyanceAllowanceUnitRate'] = this.conveyanceAllowanceUnitRate;
    data['ConveyanceAllowanceBudget'] = this.conveyanceAllowanceBudget;
    data['MiscelleneousAllowanceUnitRate'] =
        this.miscelleneousAllowanceUnitRate;
    data['MiscelleneousAllowanceBudget'] = this.miscelleneousAllowanceBudget;
    data['ApprovedAmount'] = this.approvedAmount;
    data['IOUIndentedAmount'] = this.iOUIndentedAmount;
    data['RemiitedAmount'] = this.remiitedAmount;
    data['RemmitanceDate'] = this.remmitanceDate;
    data['ExpenseClearanceStatus'] = this.expenseClearanceStatus;
    data['ExpenseClearanceAmount'] = this.expenseClearanceAmount;
    data['ExpenseClearanceDate'] = this.expenseClearanceDate;
    data['AmountApprovedBy'] = this.amountApprovedBy;
    data['AmountApprovedOn'] = this.amountApprovedOn;
    data['TripReportStatus'] = this.tripReportStatus;
    data['ExpenseClaimStatus'] = this.expenseClaimStatus;
    data['FinalApprovedAmount'] = this.finalApprovedAmount;
    data['FinalApprovalBy'] = this.finalApprovalBy;
    data['FinalApprovalOn'] = this.finalApprovalOn;
    data['AmountPaid'] = this.amountPaid;
    data['AmountPaidBy'] = this.amountPaidBy;
    data['AmountPaidOn'] = this.amountPaidOn;
    data['AdjustmentAmount'] = this.adjustmentAmount;
    data['LastModifiedOn'] = this.lastModifiedOn;
    data['LastModifiedBy'] = this.lastModifiedBy;
    data['MailSent'] = this.mailSent;
    data['autoSrno'] = this.autoSrno;
    data['PayCollectionRemarks'] = this.payCollectionRemarks;
    data['PayCollectStatus'] = this.payCollectStatus;
    data['FinalSettlementApprovalStatus'] = this.finalSettlementApprovalStatus;
    data['FinalSettlementApprovedBy'] = this.finalSettlementApprovedBy;
    data['FinalSettlementApprovedOn'] = this.finalSettlementApprovedOn;
    data['CollectedAmount'] = this.collectedAmount;
    data['PayCollectOn'] = this.payCollectOn;
    data['BudgetReportToApproval'] = this.budgetReportToApproval;
    data['BudgetDirectorApproval'] = this.budgetDirectorApproval;
    data['BudgetReportToApOn'] = this.budgetReportToApOn;
    data['BudgetDirectorApOn'] = this.budgetDirectorApOn;
    data['BudgetReportToApRemarks'] = this.budgetReportToApRemarks;
    data['BudgetDirectorApRemarks'] = this.budgetDirectorApRemarks;
    data['TripReportApproval'] = this.tripReportApproval;
    data['TripReportApOn'] = this.tripReportApOn;
    data['TripReportApRemarks'] = this.tripReportApRemarks;
    data['ExpenseReportToApproval'] = this.expenseReportToApproval;
    data['ExpenseDirectorApproval'] = this.expenseDirectorApproval;
    data['ExpenseReportToApOn'] = this.expenseReportToApOn;
    data['ExpenseDirectorApOn'] = this.expenseDirectorApOn;
    data['ExpenseReportToApRemarks'] = this.expenseReportToApRemarks;
    data['ExpenseDirectorApRemarks'] = this.expenseDirectorApRemarks;
    data['ValidatedBy'] = this.validatedBy;
    data['ValidatedOn'] = this.validatedOn;
    data['TripReportValidatedOn'] = this.tripReportValidatedOn;
    data['TripReportValidatedBy'] = this.tripReportValidatedBy;
    data['ExpenseValidatedOn'] = this.expenseValidatedOn;
    data['ExpenseValidatedBy'] = this.expenseValidatedBy;
    data['EReceiptAck'] = this.eReceiptAck;
    data['EReceiptAckBy'] = this.eReceiptAckBy;
    data['EReceiptAckOn'] = this.eReceiptAckOn;
    data['EReceiptRemarks'] = this.eReceiptRemarks;
    data['TAFCreationDate'] = this.tAFCreationDate;
    data['TravelApprovedAmt'] = this.travelApprovedAmt;
    data['HotelApprovedAmt'] = this.hotelApprovedAmt;
    data['FoodApprovedAmt'] = this.foodApprovedAmt;
    data['ConveyanceApprovedAmt'] = this.conveyanceApprovedAmt;
    data['MiscellenousApprovedAmt'] = this.miscellenousApprovedAmt;
    data['ReceiptAccounts'] = this.receiptAccounts;
    data['ReceiptAccountsBy'] = this.receiptAccountsBy;
    data['ReceiptAccountsOn'] = this.receiptAccountsOn;
    data['LDR_voucherNo'] = this.lDRVoucherNo;
    data['LDR_voucherID'] = this.lDRVoucherID;
    data['ExpenseAccountToApproval'] = this.expenseAccountToApproval;
    data['ExpenseAccountApOn'] = this.expenseAccountApOn;
    data['ExpenseAccountToApRemarks'] = this.expenseAccountToApRemarks;
    data['TotalAmt1'] = this.totalAmt1;
    data['IndentorName'] = this.indentorName;
    data['TAFApproval'] = this.tAFApproval;
    data['TAFApproval1'] = this.tAFApproval1;
    data['TripReportToApproval'] = this.tripReportToApproval;
    data['ExpenseApproval'] = this.expenseApproval;
    data['SettlementApprovalStatus'] = this.settlementApprovalStatus;
    data['PaymentStatus'] = this.paymentStatus;
    data['TAFApprovalDirector1'] = this.tAFApprovalDirector1;
    data['TAFApprovalDirector'] = this.tAFApprovalDirector;
    data['ExpenseApprovalDirector'] = this.expenseApprovalDirector;
    data['AdminExpenseStatus'] = this.adminExpenseStatus;
    data['Age'] = this.age;
    data['sme_ExpenseClaimStatus'] = this.smeExpenseClaimStatus;
    data['sme_ClaimAmount'] = this.smeClaimAmount;
    data['sme_ExpValidationStatus'] = this.smeExpValidationStatus;
    data['sme_ValidationAge'] = this.smeValidationAge;
    data['sme_MAStatus'] = this.smeMAStatus;
    data['sme_MAAge'] = this.smeMAAge;
    data['smtr_Status'] = this.smtrStatus;
    data['smtr_ValidationStatus'] = this.smtrValidationStatus;
    data['smtr_ApprovalPendingBy'] = this.smtrApprovalPendingBy;
    data['smtr_TripReportValidationAge'] = this.smtrTripReportValidationAge;
    data['smtr_TripReportApprovalAge'] = this.smtrTripReportApprovalAge;
    data['smp_PINo'] = this.smpPINo;
    data['smp_PIDate'] = this.smpPIDate;
    data['smp_PIId'] = this.smpPIId;
    data['smp_PIAmt'] = this.smpPIAmt;
    data['smp_PIAge'] = this.smpPIAge;
    data['smp_TAFIOUPaymentStatus'] = this.smpTAFIOUPaymentStatus;
    data['smp_TAFTripStatus'] = this.smpTAFTripStatus;
    data['smtr_StartDate'] = this.smtrStartDate;
    data['EndDate'] = this.endDate;
    data['smtr_EndDate'] = this.smtrEndDate;
    data['smtr_TripDays'] = this.smtrTripDays;
    data['smtr_Location'] = this.smtrLocation;
    data['smtr_TAFAdvance'] = this.smtrTAFAdvance;
    data['sme_ExpenseClaimDate'] = this.smeExpenseClaimDate;
    data['ExpenseClaimDate'] = this.expenseClaimDate;
    data['sme_ExpenseFilingAge'] = this.smeExpenseFilingAge;
    data['smtr_ReportFilingAge'] = this.smtrReportFilingAge;
    data['TAFDate1'] = this.tAFDate1;
    return data;
  }


  List<TafSummaryModel> TafSummaryModelFromJson(String str) =>
      List<TafSummaryModel>.from(json.decode(str).map((x) => TafSummaryModel.fromJson(x)));

  String TafSummaryModelToJson(List<TafSummaryModel> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
}

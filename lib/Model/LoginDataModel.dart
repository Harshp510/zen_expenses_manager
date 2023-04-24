import 'dart:convert';

class LoginDataModel {
  String? userID;
  String? employeeId;
  int? empCode;
  String? userName;
  String? password;
  String? role;
  String? name;
  String? emailID;
  String? imageUrl;
  String? defaultMenu;
  String? roleId;
  String? defaultModule;
  String? roleName;
  String? flag;

  LoginDataModel(
      {this.userID,
        this.employeeId,
        this.empCode,
        this.userName,
        this.password,
        this.role,
        this.name,
        this.emailID,
        this.imageUrl,
        this.defaultMenu,
        this.roleId,
        this.defaultModule,
        this.roleName,
        this.flag});

  LoginDataModel.fromJson(Map<String, dynamic> json) {
    userID = json['UserID'];
    employeeId = json['Employee_Id'];
    empCode = json['EmpCode'];
    userName = json['UserName'];
    password = json['Password'];
    role = json['Role'];
    name = json['Name'];
    emailID = json['EmailID'];
    imageUrl = json['ImageUrl'];
    defaultMenu = json['DefaultMenu'];
    roleId = json['Role_Id'];
    defaultModule = json['DefaultModule'];
    roleName = json['Role_Name'];
    flag = json['Flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['UserID'] = this.userID;
    data['Employee_Id'] = this.employeeId;
    data['EmpCode'] = this.empCode;
    data['UserName'] = this.userName;
    data['Password'] = this.password;
    data['Role'] = this.role;
    data['Name'] = this.name;
    data['EmailID'] = this.emailID;
    data['ImageUrl'] = this.imageUrl;
    data['DefaultMenu'] = this.defaultMenu;
    data['Role_Id'] = this.roleId;
    data['DefaultModule'] = this.defaultModule;
    data['Role_Name'] = this.roleName;
    data['Flag'] = this.flag;
    return data;
  }

  List<LoginDataModel> LoginDataModelFromJson(String str) =>
      List<LoginDataModel>.from(json.decode(str).map((x) => LoginDataModel.fromJson(x)));

  String LoginDataModelToJson(List<LoginDataModel> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
}

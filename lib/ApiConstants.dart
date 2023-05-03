import 'Model/ExpenseHead.dart';

class ApiConstants {
  //static  String baseUrl = 'https://zepl.zenhrp.in/Payroll/WCFWebservices/_hrp.asmx/';
 // static  String baseUrl = 'https://portal.zengroup.co.in/iphonewebservice/loginwebservice.asmx/';
  static  String baseUrl = 'https://portal.zengroup.co.in/iphonewebservice/TAF.asmx/';
  static  String fontname = 'poppinsregular';
  static  int statusbar_color = 0xff407AFF;
  static  int primary_light_text_color = 0xffB3CDFF;
  static  int primary_dark_text_color = 0xff002C80;
  static  int navi_expansion_child_text_color = 0x80000000;
  static  int navi_listtile_selected_color = 0xffEBF1FF;
  static  int navi_listtile_selected_text_color = 0xff407BFF;
  static  int BG_Add_Expense_Blue = 0xff0057FF;






  static List<ExpenseHead> ExpenseHeadlist = [
    ExpenseHead('Conveyance Auto', 'assets/images/auto.png'),
    ExpenseHead('Conveyance Taxi', 'assets/images/taxi.png'),
    ExpenseHead('Food', 'assets/images/food.png'),
    ExpenseHead('Installation Expense', 'assets/images/installation.png'),
    ExpenseHead('Miscellaneous', 'assets/images/miscellaneous.png'),
    ExpenseHead('Partner/Customer Expense', 'assets/images/partner.png'),
    ExpenseHead('Room', 'assets/images/room.png'),
    ExpenseHead('Travel Air', 'assets/images/air.png'),
    ExpenseHead('Travel Auto', 'assets/images/auto.png'),
    ExpenseHead('Travel Bus', 'assets/images/bus.png'),
    ExpenseHead('Travel Car', 'assets/images/car.png'),
    ExpenseHead('Travel Train', 'assets/images/train.png'),
    ExpenseHead('Vehicle Fuel', 'assets/images/fuel.png'),
  ];
}
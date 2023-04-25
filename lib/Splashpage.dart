import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:zen_expenses_manager/LoginPage.dart';
import 'package:zen_expenses_manager/prefrence/PreferenceUtils.dart';

import 'ApiService.dart';
import 'DashBoardPage.dart';
import 'DialogBuilder.dart';
import 'Model/LoginDataModel.dart';

class Splashpage extends StatefulWidget {
  const Splashpage({Key? key}) : super(key: key);

  @override
  State<Splashpage> createState() => _SplashpageState();
}

class _SplashpageState extends State<Splashpage> {
  List<LoginDataModel> login_data_list=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((_) {
      _doUrl_check(context);
    });



  }
  Widget Splash_data(BuildContext context)
  {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Container(
            width: 250,
            height: 250,
            padding: EdgeInsets.only(top: 40),
            child: Image.asset('assets/images/exim_landscap.png'),
          ),
        ),

        CircularProgressIndicator()
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Splash_data(context)
    );
  }

  void _doUrl_check(BuildContext context) async
  {
    String username="";
    String password="";
    username=PreferenceUtils.getString("username");
    password=PreferenceUtils.getString("password");
    print("username-->"+username);
    print("password-->"+password);





    if(username.length>0 || password.length>0)
    {
      bool connection_flag= await ApiService().check_connection_network();
      print("connection_flag-->"+connection_flag.toString());
      if(connection_flag)
      {
        _doLogin(context,username,password);
      }
      else
      {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Internet not available"),));

        Future.delayed(Duration(seconds: 5),()
        {
          Navigator.pushReplacement(context,MaterialPageRoute(builder: (nextcontext) => LoginPage()));
        });
      }

    }
    else
    {
      _navigateToLogin(context);
    }


  }

  void _navigateToLogin(BuildContext nextcontext)
  {
    Future.delayed(Duration(seconds: 3),()
    {
      Navigator.pushReplacement(nextcontext,MaterialPageRoute(builder: (nextcontext) => LoginPage()));
    });

  }

  void _navigateToNextScreen(BuildContext nextcontext)
  {
    Navigator.push(nextcontext,MaterialPageRoute(builder: (nextcontext) => DashBoardPage()));
  }
  Future<void> _doLogin(BuildContext context1,String username,String password)  async {


    bool connection_flag= await ApiService().check_connection_network();
    print("connection_flag-->"+connection_flag.toString());

    if(connection_flag)
    {
     // DialogBuilder(context1).showLoadingIndicator('');
     // String username = _controller_email.text;
     // String password = _controller_password.text;
      /*var bytes = utf8.encode(_controller_password.text);
      var password = base64.encode(bytes);*/
      ApiService apiService = new ApiService();
      login_data_list = await apiService.Login(username, password);
      if (login_data_list.length > 0)
      {

        if(login_data_list[0].MStatus=="1")
        {
          PreferenceUtils.setString("EmployeeId", login_data_list[0].userID.toString());
          PreferenceUtils.setString("Emp_Firstname", login_data_list[0].emailID.toString());
          PreferenceUtils.setString("Role", login_data_list[0].role.toString());
          PreferenceUtils.setString("username", username);
          PreferenceUtils.setString("password", password);

         // DialogBuilder(context1).hideOpenDialog();
          _navigateToNextScreen(context1);
        }
        else
        {
         // DialogBuilder(context1).hideOpenDialog();
          Future.delayed(Duration(seconds: 1),(){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(login_data_list[0].MError.toString()),));
          });
        }



      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Something went wrong"),));
       // DialogBuilder(context1).hideOpenDialog();
        throw Exception("error");
      }
    }
    else
    {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Internet not available"),));
    }





  }
}

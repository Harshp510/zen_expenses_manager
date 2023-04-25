import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zen_expenses_manager/prefrence/PreferenceUtils.dart';

import 'ApiService.dart';
import 'DashBoardPage.dart';
import 'DialogBuilder.dart';
import 'Model/LoginDataModel.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final textFieldFocusNode = FocusNode();
  bool _obscured = false;
  TextEditingController _controller_email = new TextEditingController();
  TextEditingController _controller_password = new TextEditingController();
  List<LoginDataModel> login_data_list=[];

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus) return; // If focus is on text field, dont unfocus
      textFieldFocusNode.canRequestFocus = false;     // Prevents focus if tap on eye
    });
  }
  void _navigateToNextScreen(BuildContext nextcontext)
  {
    Navigator.push(nextcontext,MaterialPageRoute(builder: (nextcontext) => DashBoardPage()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 0,),
                      child: Image.asset('assets/images/exim_landscap.png',
                        height: 180,
                        width: 220,),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15,bottom: 15),
                    child: Text("Enter Credentials To Login",style: TextStyle(fontSize: 17,color: Colors.black87,),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 15, bottom: 0),
                    child: SizedBox(height: 50,
                      child: TextField(
                        textAlign: TextAlign.left,
                        controller: _controller_email,
                        style: TextStyle(fontSize: 16),
                        decoration: InputDecoration(

                            border: OutlineInputBorder(),
                            labelText: 'Email',
                            hintText: 'Enter email id'),

                      ),
                    ),
                  ),
                  PasswordShowUI(context),
                  Container(
                    margin: EdgeInsets.only(top: 20,left: 15,right: 15 ),
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Color(0xff0057ff), borderRadius: BorderRadius.circular(10)),
                    child: TextButton(
                      onPressed: () {
                        _doLogin(context);
                      },
                      child: Text('Login',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  )



                ],

          )),
          Positioned(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(padding:EdgeInsets.all(10),child: Text('Version 1.0')),
            ),
          ),
        ],
      ),
    );
  }


  Future<void> _doLogin(BuildContext context1)  async {


    bool connection_flag= await ApiService().check_connection_network();
    print("connection_flag-->"+connection_flag.toString());

    if(connection_flag)
    {
      DialogBuilder(context1).showLoadingIndicator('');
      String username = _controller_email.text;
      String password = _controller_password.text;
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

          DialogBuilder(context1).hideOpenDialog();
          _navigateToNextScreen(context1);
        }
        else
        {
          DialogBuilder(context1).hideOpenDialog();
          Future.delayed(Duration(seconds: 1),(){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(login_data_list[0].MError.toString()),));
          });
        }



      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Something went wrong"),));
        DialogBuilder(context1).hideOpenDialog();
        throw Exception("error");
      }
    }
    else
    {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Internet not available"),));
    }





  }



  Widget PasswordShowUI(BuildContext context){
    return  Padding(
      padding: const EdgeInsets.only(
          left: 15.0, right: 15.0, top: 15, bottom: 0),
      //padding: EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
        keyboardType: TextInputType.visiblePassword,
        obscureText: _obscured,
        controller: _controller_password,
        focusNode: textFieldFocusNode,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          isDense: true,
          labelText: 'Password',
          hintText: 'Enter secure password',
          suffixIcon: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
            child: GestureDetector(
              onTap: _toggleObscured,
              child: Icon(
                _obscured
                    ? Icons.visibility_rounded
                    : Icons.visibility_off_rounded,
                size: 24,color: Colors.black45,
              ),
            ),
          ),
        ),

      ),
    );
  }
}

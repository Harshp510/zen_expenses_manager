import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zen_expenses_manager/LoginPage.dart';

class Splashpage extends StatefulWidget {
  const Splashpage({Key? key}) : super(key: key);

  @override
  State<Splashpage> createState() => _SplashpageState();
}

class _SplashpageState extends State<Splashpage> {
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 2),(){
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (nextcontext) => LoginPage()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/images/exim_landscap.png',
        height: 250,
        width: 250,),
      ),
    );
  }
}

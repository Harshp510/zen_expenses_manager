import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'ApiConstants.dart';

class TAF_Expenses extends StatefulWidget {
  const TAF_Expenses({Key? key}) : super(key: key);

  @override
  State<TAF_Expenses> createState() => _TAF_ExpensesState();
}

class _TAF_ExpensesState extends State<TAF_Expenses> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      key: _scaffoldKey,
      appBar:AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Color(ApiConstants.statusbar_color), // <-- SEE HERE
          statusBarIconBrightness: Brightness.dark, //<-- For Android SEE HERE (dark icons)
          statusBarBrightness: Brightness.light, //<-- For iOS SEE HERE (dark icons)
        ),
        elevation: 1,
        title: Text('TAF Expenses',style: TextStyle(color: Colors.black87,fontSize: 16,fontWeight: FontWeight.w400),),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new,color: Colors.black54,), onPressed: () { _scaffoldKey.currentState?.openDrawer();  },
        ),
        actions: [

          Container(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [


                  GestureDetector(
                    onTap: (){
                      // Navigator.push(context, SlideRightRoute(page: MyProfile()));
                    },
                    child: CircleAvatar(
                      backgroundImage:AssetImage('assets/images/user_profile.png'),
                      //backgroundImage: AssetImage('assets/images/splash_png.png'),

                    ),
                  ),
                ],
              )
          ),

        ],

        backgroundColor: Colors.white,
      ),
      body: HeaderView(context),
    );
  }

  Widget HeaderView(BuildContext context){
    return Container(
      height: 119,
      margin: EdgeInsets.all(5.0),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      // align the text to the left instead of centered
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('TAF ID', style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.indigo.shade300),),
                        SizedBox(height: 5,),
                        Text('0423001',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Color(ApiConstants.primary_dark_text_color)),),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      // align the text to the left instead of centered
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text('TAF Date', style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.indigo.shade300),),
                        SizedBox(height: 5,),
                        Text('19-04-2023',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Color(ApiConstants.primary_dark_text_color)),),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(5.0),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Color(ApiConstants.primary_light_text_color),
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(15),
                            bottomLeft: Radius.circular(15)
                        )
                    ),
                    child:  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        // align the text to the left instead of centered
                        mainAxisAlignment:MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('ADARSH KUMAR SINGH', style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Color(ApiConstants.primary_dark_text_color)),),
                          SizedBox(height: 5,),
                          Text('\u{20B9} 15000.00',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Color(ApiConstants.primary_dark_text_color)),),
                        ],
                      ),
                    ),


                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

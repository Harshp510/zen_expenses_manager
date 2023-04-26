import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zen_expenses_manager/Model/TafSummaryModel.dart';
import 'package:zen_expenses_manager/prefrence/PreferenceUtils.dart';
import 'package:intl/intl.dart';
import 'ApiConstants.dart';
import 'ApiService.dart';
import 'NavDrawer.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({Key? key}) : super(key: key);

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var firstDate,lastDate;
  List<TafSummaryModel> list = [];
  String GetSelectedDateFormat(DateTime current_date)  {

    return DateFormat('MM-dd-yyyy').format(current_date);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    var now = DateTime.now();
    var minus = 0;
    if (now.month <= 3) {
      minus = 1;
    }
     firstDate = DateTime(DateTime.now().year - minus, 4, 1);
     lastDate = DateTime(DateTime.now().year + 1, 3, 31);
    print(firstDate);
    print(lastDate);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar:AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Color(ApiConstants.statusbar_color), // <-- SEE HERE
          statusBarIconBrightness: Brightness.dark, //<-- For Android SEE HERE (dark icons)
          statusBarBrightness: Brightness.light, //<-- For iOS SEE HERE (dark icons)
        ),
        elevation: 1,
        title: Text('TAF',style: TextStyle(color: Colors.black87,fontSize: 16,fontWeight: FontWeight.w400),),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.menu,color: Colors.black87,), onPressed: () { _scaffoldKey.currentState?.openDrawer();  },
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
      drawer: NavDrawer(context),
      body: tabListWidget(),
    );
  }

  Widget TAFListView(BuildContext context, List<TafSummaryModel> list,int index){
    return Container(

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
                     Text('TAF ID', style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700,color: Color(ApiConstants.primary_light_text_color)),),
                     SizedBox(height: 5,),
                     Text(list[index].srNo.toString(),style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Color(ApiConstants.primary_dark_text_color)),),
                   ],
                 ),
                          ),
                 Expanded(
                           child: Column(
                  // align the text to the left instead of centered
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text('TAF Date', style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700,color: Color(ApiConstants.primary_light_text_color)),),
                    SizedBox(height: 5,),
                    Text(list[index].tAFDate1.toString(),style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Color(ApiConstants.primary_dark_text_color)),),
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
                              Text(list[index].indentorName.toString(), style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Color(ApiConstants.primary_dark_text_color)),),
                              SizedBox(height: 5,),
                              Text('\u{20B9}'+list[index].totalAmt.toString(),style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Color(ApiConstants.primary_dark_text_color)),),
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

  Widget tabListWidget(){
    return FutureBuilder<List<TafSummaryModel>>(
        future: ApiService().GetTafWithSummaryByUserid(PreferenceUtils.getString("UserID").toString(),base64.encode(utf8.encode(PreferenceUtils.getString("Role"))),"Open,Approved,Remmited",GetSelectedDateFormat(firstDate),GetSelectedDateFormat(lastDate)),
        builder: (context,snapshot){
          if (snapshot.connectionState == ConnectionState.waiting) {
            return ProgressIndicator(context,"Please Wait..");
          }
          else if(snapshot.connectionState==ConnectionState.done)
          {
            if(snapshot.hasError)
            {
              return  Center(child: Text('Something Went Wrong'));
            }
            else if(snapshot.hasData)
            {
                if(snapshot.data!.length>0){
                  list = snapshot.data!;
                 return ListView.builder(
                    itemCount: list.length,
                   itemBuilder: (context,index){
                      return TAFListView(context,list,index);
                   },
                 );
                }else{
                  return  Center(child: Text('Empty data'));
                }
            }
            else
            {
              return  Center(child: Text('Empty data'));
            }

          }
          else
          {
            return  ProgressIndicator(context,"Please Wait..");

          }
        });
  }
  Widget ProgressIndicator(BuildContext context,String title){
    return  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 15,),
          Text(title,style: TextStyle(fontSize: 16,fontFamily: ApiConstants.fontname,color: Colors.black87),)
        ],
      ),
    );
  }
}



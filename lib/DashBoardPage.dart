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
                      child:  Container(

                        decoration: BoxDecoration(shape: BoxShape.circle,image: DecorationImage(
                            fit: BoxFit.fill,
                            image:MemoryImage(Base64Decoder().convert((PreferenceUtils.getString('image'))))
                        )),

                      ),
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

  Widget TAFListView(BuildContext context, List<TafSummaryModel> list){
    return Container(

      margin: EdgeInsets.all(5.0),
      child: Card(
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
                     Text('TAF ID', style: TextStyle(fontSize: 14),),
                     SizedBox(height: 5,),
                     Text('0423001',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                   ],
                 ),
                          ),
                 Expanded(
                           child: Column(
                  // align the text to the left instead of centered
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text('TAF Date', style: TextStyle(fontSize: 14),),
                    SizedBox(height: 5,),
                    Text('19-04-2023',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
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
                      color: CupertinoColors.systemGreen
                    ),
                    child:  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                            // align the text to the left instead of centered
                            mainAxisAlignment:MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text('ADARSH KUMAR SINGH', style: TextStyle(fontSize: 14),),
                              SizedBox(height: 5,),
                              Text('\u{20B9} 15000.00',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
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
        future: ApiService().GetTafWithSummaryByUserid("007AB896-CAE0-49AC-8D39-066A8F01E0B9","RAM","Open,Approved,Remmited",GetSelectedDateFormat(firstDate),GetSelectedDateFormat(lastDate)),
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
                      return TAFListView(context,list);
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



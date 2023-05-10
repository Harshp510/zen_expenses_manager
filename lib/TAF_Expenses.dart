import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:zen_expenses_manager/prefrence/PreferenceUtils.dart';
import 'dart:io' as Platform;
import 'package:provider/provider.dart';
import 'package:zen_expenses_manager/provider/DrawerItemRow.dart';
import 'Add_Expenses.dart';
import 'ApiConstants.dart';
import 'ApiService.dart';
import 'Model/TAFExpenseSummaryByTAFid.dart';

class TAF_Expenses extends StatefulWidget {
  String taf_id;
  String taf_srno;
  String taf_date,name,amount;
  TAF_Expenses({Key? key,required this.taf_id,required this.taf_srno,required this.taf_date,required this.name,required this.amount}) : super(key: key);

  @override
  State<TAF_Expenses> createState() => _TAF_ExpensesState();
}

class _TAF_ExpensesState extends State<TAF_Expenses> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<TAFExpenseSummaryByTAFid> list = [];
  double total=0.0;
  late final Future<List<TAFExpenseSummaryByTAFid>> myFuture;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

   //myFuture = ApiService().GetTafExpenseSummaryByTAFid(widget.taf_id);
    SchedulerBinding.instance.addPostFrameCallback((_) {

      print('refresh');
    });
  }

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
          icon: Icon(Icons.arrow_back_ios_new,color: Colors.black54,), onPressed: () { Navigator.pop(context);  },
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
      body: MainView(context),
    );
  }

  double getheight(){
    if(Platform.Platform.isAndroid)
      return 119;
    else
      return 120;
  }

  Widget HeaderView(BuildContext context){
    return Container(
      height:  getheight(),
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
                        Text(widget.taf_srno,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Color(ApiConstants.primary_dark_text_color)),),
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
                        Text(widget.taf_date,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Color(ApiConstants.primary_dark_text_color)),),
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
                          Text(widget.name, style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Color(ApiConstants.primary_dark_text_color)),),
                          SizedBox(height: 5,),
                          Text('\u{20B9} '+widget.amount,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Color(ApiConstants.primary_dark_text_color)),),
                        ],
                      ),
                    ),


                  ),
                )
              ],
            ),

          ],
        ),
      ),
    );
  }
  Widget MainView(BuildContext context){
    // return ListView(
    //   children: [
    //     HeaderView(context),
    //     SizedBox(height: 10,),
    //
    //     tabListWidget()
    //   ],
    // );

    return Stack(
      children: [
        Positioned(child: ListView(
          children: [
            HeaderView(context),
            SizedBox(height: 10,),

            tabListWidget()
          ],
        )),
        Positioned(

          child:  Align(
              alignment: Alignment.bottomCenter,
              child: Bottom_Buttons(context)),),
      ],
    );
  }
  Widget TotalSpendingView(BuildContext context,double total)
  {
    return Container(
      height: 180.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(left: 25,right: 25),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Column(


        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,




        children: [
          Text("TOTAL SPENDING",style: TextStyle(fontSize: 17,color: Colors.indigo.shade300,fontWeight: FontWeight.w500),),
          const SizedBox(height: 10,),
          Text("\u{20B9} ${total.toStringAsFixed(2)}",style: TextStyle(fontSize: 40,fontWeight: FontWeight.w700),),
          const SizedBox(height: 10,),
          GestureDetector(
            onTapUp: (detail){
             /* Navigator.push(context,MaterialPageRoute(builder: (nextcontext) => Add_Expenses(
                tafid: widget.taf_id,
              )));*/
              FocusManager.instance.primaryFocus?.unfocus();
              Navigator.push( context, MaterialPageRoute( builder: (context) => Add_Expenses(
                tafid: widget.taf_id,
              )), ).then((value) => setState(() {}));
            },
            child: Container(

              height: 60.00,
              margin: EdgeInsets.only(left: 30,right: 30),
              decoration: BoxDecoration(
                color: Color(
                  ApiConstants.BG_Add_Expense_Blue
                ),
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Icon(Icons.add_circle_outline,color: Colors.white,),
                  SizedBox(width: 10,),
                  Text("ADD EXPENSE",style: TextStyle(color: Colors.white,fontSize: 17.0),)
                ],
              ),
            ),
          )




        ],
      ),
    );
  }

  Widget CustomeRowListview(BuildContext context,List<TAFExpenseSummaryByTAFid> list,int index){

    int indexofimage = ApiConstants.ExpenseHeadlist.indexWhere((item) => item.Name == list[index].expenseHeadName.toString());


    //Text('\u{20B9}${list[index].amount!.toStringAsFixed(2)} | ${list[index].expenseDate1}'),

    return Container(
      width: double.infinity,
      child: ListTile(
        title:Row(
          children: [

            Text('\u{20B9}${list[index].amount!.toStringAsFixed(2)}',style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),),
            SizedBox(width: 10,),
            Text('${list[index].expenseDate1}',style: TextStyle(fontSize: 14),),

          ],
        ),
        subtitle: Text(list[index].expenseHeadName.toString()),
        trailing: Image.asset(ApiConstants.ExpenseHeadlist[indexofimage].image_name.toString(),height: 45,width: 45,),
      ),
    );
  }
  Widget tabListWidget(){
    return FutureBuilder<List<TAFExpenseSummaryByTAFid>>(
        future: ApiService().GetTafExpenseSummaryByTAFid(widget.taf_id),
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

                final totals = list.fold<double>(0, (sum, item) => sum + item.amount!);
                return Column(
                  children: [
                    TotalSpendingView(context,totals),
                    SizedBox(height: 10,),
                    Container(
                      margin: EdgeInsets.only(left: 25,right: 25),

                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: ListView.separated(
                        primary: false,
                        scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: list.length,
                        itemBuilder: (context,index){
                          return CustomeRowListview(context,list,index);
                        },
                        separatorBuilder: (context, index) {
                          return Divider();
                        },
                      ),
                    ),
                    SizedBox(height: 75,),
                  ],
                );
              }else{
                return  TotalSpendingView(context, total);
              }
            }
            else
            {
              return  TotalSpendingView(context, total);
            }

          }
          else
          {
            return  ProgressIndicator(context,"Please Wait..");

          }
        });
  }



  Widget Bottom_Buttons(BuildContext context)
  {
    return Row(



      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        SizedBox(
          height: 60,
          width: MediaQuery.of(context).size.width,

          child: ElevatedButton(

            onPressed: () {},
            child: Text('SUBMIT'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(
                  ApiConstants.BG_Add_Expense_Blue
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
                // <-- Radius
              ),
            ),
          ),
        )
      ],
    );
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


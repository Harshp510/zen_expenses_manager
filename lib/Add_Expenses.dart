import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:zen_expenses_manager/ApiService.dart';
import 'package:zen_expenses_manager/Model/ExpenseDateModel.dart';
import 'package:zen_expenses_manager/Model/ExpenseHeadModel.dart';
import 'package:zen_expenses_manager/Model/FinalinsertTafExpenseModel.dart';
import 'ApiConstants.dart';
import 'package:image_picker/image_picker.dart';

import 'Model/InsertTafModel.dart';

class Add_Expenses extends StatefulWidget {
  String tafid;
   Add_Expenses({Key? key,required this.tafid}) : super(key: key);

  @override
  State<Add_Expenses> createState() => _Add_ExpensesState();
}

class _Add_ExpensesState extends State<Add_Expenses> {
  int selectedIndex=0;
  var _choiceIndex=-1;
  var _foodchoiceIndex=-1;
  var _uploadtypeIndex=-1;
  var _choiceIndex_temp=-2;
  bool _isfoodselected = false;
  File? photo;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late final Future<List<ExpenseDateModel>> myFuture;
  late final Future<List<ExpenseHeadModel>> myFuture2;
  List<String> foodtypelist = ["Breakfast","Lunch","Dinner","Mics"];
  List<String> uploadypelist = ["Upload Invoice","Voucher"];
  List<InsertTafModel> list_insert_taf = [];
  List<ExpenseDateModel> datelist = [];
  List<ExpenseHeadModel> Headlist = [];
  List<FinalinsertTafExpenseModel> finallist = [];
  TextEditingController _amountController = TextEditingController();
  TextEditingController _perticularController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  //bool _validate = false;
 //bool _validate1 = false;

  String GetMonthName(String date){
    DateTime parseDate = new DateFormat("dd-MM-yyyy").parse(date);
    var inputDate = DateTime.parse(parseDate.toString());
    var outputFormat = DateFormat('MMM');
    //var outputFormat1 = DateFormat('EEEE');
   // var outputFormat2= DateFormat('dd');
   return outputFormat.format(inputDate);
   // var outputDate1 = outputFormat1.format(inputDate);
   // var outputDate2 = outputFormat2.format(inputDate);
  }
  String GetDayName(String date){
    DateTime parseDate = new DateFormat("dd-MM-yyyy").parse(date);
    var inputDate = DateTime.parse(parseDate.toString());
    //var outputFormat = DateFormat('MMM');
    var outputFormat1 = DateFormat('EEEE');
    // var outputFormat2= DateFormat('dd');
   // return outputFormat.format(inputDate);
    return outputFormat1.format(inputDate);
    // var outputDate2 = outputFormat2.format(inputDate);
  }
  String GetDay(String date){
    DateTime parseDate = new DateFormat("dd-MM-yyyy").parse(date);
    var inputDate = DateTime.parse(parseDate.toString());
    //var outputFormat = DateFormat('MMM');
    //var outputFormat1 = DateFormat('EEEE');
     var outputFormat2= DateFormat('dd');
    // return outputFormat.format(inputDate);
    //return outputFormat1.format(inputDate);
    return outputFormat2.format(inputDate);
  }
  String GetExpenseDate(String date){
    DateTime parseDate = new DateFormat("dd-MM-yyyy").parse(date);
    var inputDate = DateTime.parse(parseDate.toString());
    //var outputFormat = DateFormat('MMM');
    //var outputFormat1 = DateFormat('EEEE');
    var outputFormat2= DateFormat('MM-dd-yyyy');
    // return outputFormat.format(inputDate);
    //return outputFormat1.format(inputDate);
    return outputFormat2.format(inputDate);
  }
  Future<void> _InsertTAF_Call(BuildContext context1)  async {
    bool connection_flag= await ApiService().check_connection_network();
    print("connection_flag-->"+connection_flag.toString());
    if(connection_flag)
    {


      if(selectedIndex == -1){
        print('Date not Selected');
      }else if(_choiceIndex == -1){
        print('Category not Selected');
      }else if(Headlist[_choiceIndex].expenseHeadName == "Food"){
        if(_foodchoiceIndex == -1){
          print('Food Category not Selected');
        }else{
          if (_formKey.currentState!.validate()) {
            apicall(context1);
          }
        }
      }/*else if(_uploadtypeIndex == -1){
        print('Select Upload Invoice Or Voucher');
      }else if(_uploadtypeIndex==0){
        if(photo == null){
          print('Select Invoice Image');
        }
      }*/
      else{
       print("else");
       print(Headlist[_choiceIndex].allExpenseHeadID.toString());
       print(_perticularController.text);
       print(_amountController.text);
       if (_formKey.currentState!.validate()) {
         apicall(context1);
       }

      }

    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Internet not available"),));
    }
  }
  Future<void> apicall(BuildContext context1) async {
    ApiService apiService = new ApiService();
    if(Headlist[_choiceIndex].expenseHeadName.toString() == "Food"){
      list_insert_taf = await apiService.insertTafExpensedetailByTafid(widget.tafid, GetExpenseDate(datelist[selectedIndex].newDate.toString()), Headlist[_choiceIndex].allExpenseHeadID.toString(), _amountController.text.toString(),foodtypelist[_foodchoiceIndex]+"-"+_perticularController.text.toString());
    }else{
      list_insert_taf = await apiService.insertTafExpensedetailByTafid(widget.tafid, GetExpenseDate(datelist[selectedIndex].newDate.toString()), Headlist[_choiceIndex].allExpenseHeadID.toString(), _amountController.text.toString(),_perticularController.text.toString());
    }
    if(list_insert_taf.length>0){

      if(list_insert_taf[0].status == "1"){
        String ExpenseDetailId = list_insert_taf[0].expenseDetailId.toString();

        if(_uploadtypeIndex==0){
          //imagebase64 upload
          List<int> imageBytes = photo!.readAsBytesSync();
          String imageB64 = base64Encode(imageBytes);
          print(imageB64);
          finallist = await apiService.insertTafExpenseImageUpload(widget.tafid, ExpenseDetailId, imageB64);
          if(finallist.length>0){
            if(finallist[0].status == "1"){
              Navigator.pop(context1,true);
            }
          }
        }else if(_uploadtypeIndex == 1){
          //voucher upload
          finallist = await apiService.insertTafExpenseEVoucherUpload(widget.tafid, ExpenseDetailId);
          if(finallist.length>0){
            if(finallist[0].status == "1"){
              Navigator.pop(context1,true);
            }
          }
        }
      }
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myFuture = ApiService().GetExpenseDateListFromID(widget.tafid);
    myFuture2 = ApiService().GetExpenseHeadList();
  }
  void ShowDialogIOS(){
    showCupertinoModalPopup(context: context, builder: (cnt){
      return CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              print('Camera');
              pickFromCamera();
            },
            child: Text('Upload from Camera'),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              print('Use Gallery');
              pickFromGallery();
            },
            child: Text('Upload from Gallery'),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: () {
            Navigator.of(cnt).pop;
          },
          child: Text('Cancel', style: TextStyle(color: Colors.red)),
        ),
      );
    });
  }
  void ShowDialog_Android(){
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: new Icon(Icons.camera),
                title: new Text('Upload from Camera'),
                onTap: () {
                  Navigator.pop(context);
                  pickFromCamera();
                },
              ),
              ListTile(
                leading: new Icon(Icons.photo),
                title: new Text('Upload from Gallery'),
                onTap: () {
                  Navigator.pop(context);
                  pickFromGallery();
                },
              ),

            ],
          );
        });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _amountController.dispose();
    _perticularController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      resizeToAvoidBottomInset: false,
     
      key: _scaffoldKey,
      appBar:AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Color(ApiConstants.statusbar_color), // <-- SEE HERE
          statusBarIconBrightness: Brightness.dark, //<-- For Android SEE HERE (dark icons)
          statusBarBrightness: Brightness.light, //<-- For iOS SEE HERE (dark icons)
        ),
        elevation: 1,
        title: Text('Add Expenses',style: TextStyle(color: Colors.black87,fontSize: 18,fontWeight: FontWeight.w400),),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new,color: Colors.black54,), onPressed: () { Navigator.pop(context);  },
        ),


        backgroundColor: Colors.white,
      ),
    body: MainView(context),
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
        Positioned(child: SingleChildScrollView(
          child: Column(

            children: [
             DateView(context),
              SizedBox(height: 10,),
              CategoryView(context),
              SizedBox(height: 10,),
              AmmountView(context),
              SizedBox(height: 10,),
              UploadView(context),
              SizedBox(height: 80,)


            ],
          ),
        )),
        Positioned(

          child:  Align(
              alignment: Alignment.bottomCenter,
              child: Bottom_Buttons(context)),),
      ],
    );
  }

  Widget DateView(BuildContext context){
    return Container(
      height: 180.0,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,

      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Container(
              margin: EdgeInsets.all(15),
              child: Text('Choose Date'.toUpperCase(),textAlign: TextAlign.left,style: TextStyle(fontSize: 14,color: Colors.black54),)),

          Container(
            height: 110,
            margin: EdgeInsets.symmetric(horizontal: 15),
            child:GetDateFromApi(context),
          ),

        ],
      ),
    );
  }
  Widget DatecustomeView(BuildContext context,int index,List<ExpenseDateModel> list){
    return GestureDetector(
      onTap: (){
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          //color: Colors.grey.shade100,
          color: selectedIndex == index ? Color(
              ApiConstants.BG_Add_Expense_Blue
          ) : Colors.grey.shade100,
          borderRadius: BorderRadius.all(Radius.circular(12)),

        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(GetDayName(list[index].newDate.toString()).toUpperCase(),style: TextStyle(fontSize: 16,color: selectedIndex == index ? Colors.white : Colors.black54,fontWeight: FontWeight.normal),),
            SizedBox(height: 5,),
            Text(GetDay(list[index].newDate.toString()),style: TextStyle(fontSize: 19,color:selectedIndex == index ? Colors.white : Colors.black87,fontWeight: FontWeight.w700),),
            SizedBox(height: 5,),
            Text(GetMonthName(list[index].newDate.toString()).toUpperCase(),style:TextStyle(fontSize: 16,color: selectedIndex == index ? Colors.white : Colors.black54,fontWeight: FontWeight.normal),),
          ],
        ),
      ),
    );
  }
  Widget CategoryView(BuildContext context){
    return Container(
      height: 160.0,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,

      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Container(
              margin: EdgeInsets.all(15),
              child: Text('Choose Category'.toUpperCase(),textAlign: TextAlign.left,style: TextStyle(fontSize: 14,color: Colors.black54),)),

          Container(
            height: 110,
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: GetExpensesHeadFromApi(context)
          ),

        ],
      ),
    );
  }

  Widget Bottom_Buttons(BuildContext context)
  {
    return Row(



      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        SizedBox(
          height: 60,
          width: MediaQuery.of(context).size.width,

          child: TextButton(

            onPressed: ()  {

              _InsertTAF_Call(context);

            },
            child: Text('SAVE',style: TextStyle(fontSize: 16,color: Colors.white),),
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
  Widget GetDateFromApi(BuildContext context){
    return FutureBuilder(
      future: myFuture,
      builder: (context, AsyncSnapshot<List<ExpenseDateModel>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data == null) {
            return const Center(child: Text('Something went wrong'));
          }

          return ListView.separated(
            primary: false,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: snapshot.data!.length,
            itemBuilder: (context,index){
              datelist = snapshot.data!;
              return DatecustomeView(context,index,snapshot.data!);
            }, separatorBuilder: (BuildContext context, int index,) {
            return SizedBox(width: 10,);
          },
          );
        }
        return Center(child: const CircularProgressIndicator());
      },
    );
  }
  Widget GetExpensesHeadFromApi(BuildContext context){
    return FutureBuilder(
      future: myFuture2,
      builder: (context, AsyncSnapshot<List<ExpenseHeadModel>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data == null) {
            return const Center(child: Text('Something went wrong'));
          }
          Headlist = snapshot.data!;
          return  buildCatigoriesList(snapshot.data!);
        /*  return ListView(
            scrollDirection: Axis.horizontal,
            primary: true,
            shrinkWrap: true,

            children: [
            Wrap(

            direction: Axis.horizontal,
            spacing: 6,
            children: List.generate(snapshot.data!.length, (index) {
              return BuildChip(context, index,snapshot.data!);
            }),
          )
            ],
          );*/
        }
        return Center(child: const CircularProgressIndicator());
      },
    );
  }
  Widget buildCatigoriesList(List<ExpenseHeadModel> catigoryList) {
    return Container(
      height: 100,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Wrap(
          spacing: -1,
          direction: Axis.vertical,
          children: List.generate(catigoryList.length, (index) {

            return GestureDetector(
              onTap: (){
                setState(() {
                  _choiceIndex = index;
                });
                if(catigoryList[index].expenseHeadName.toString().toLowerCase() == "Food".toLowerCase()){
                  setState(() {
                    _isfoodselected = true;
                  });
                }else{
                  _isfoodselected = false;
                }
              },
              child: Container(
                // margin: EdgeInsets.symmetric(horizontal: 5),
                  width: 130,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: _choiceIndex == index ? Color(
                        ApiConstants.BG_Add_Expense_Blue
                    ) : Colors.grey.shade100,
                  ),
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(5),
                  child: Center(
                    child: Text(
                      catigoryList[index].expenseHeadName.toString(),
                      style: TextStyle(color:_choiceIndex == index ? Colors.white : Colors.black87),
                      textAlign: TextAlign.center,
                    ),
                  )),
            );
          })
        ),
      ),
    );
  }
  Widget buildFoodList(List<String> list) {
    return Visibility(
      visible: _isfoodselected,
      child: SizedBox(
        height: 50,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Wrap(

            direction: Axis.horizontal,
            children: List.generate(list.length, (index) {

              return GestureDetector(
                onTap: (){
                  setState(() {
                    _foodchoiceIndex = index;
                  });
                },
                child: Container(
                  // margin: EdgeInsets.symmetric(horizontal: 5),
                    width: 80,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: _foodchoiceIndex == index ? Color(
                          ApiConstants.BG_Add_Expense_Blue
                      ) : Colors.grey.shade100,
                    ),
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.all(5),
                    child: Center(
                      child: Text(
                        list[index].toString(),
                        style: TextStyle(color:_foodchoiceIndex == index ? Colors.white : Colors.black87),
                        textAlign: TextAlign.center,
                      ),
                    )),
              );
            })
          ),
        ),
      ),
    );
  }
  Widget AmmountView(BuildContext context){
    return Container(

      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,

      ),
      child: Container(
        margin: EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [


                buildFoodList(foodtypelist),

                Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: _perticularController,
                  minLines: 3,
                  maxLines: 10,  // allow user to enter 5 line in textfield
                  keyboardType: TextInputType.multiline,  // user keyboard will have a button to move cursor to next line
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'This Field is required';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: 'Perticulars',
                      hintStyle: TextStyle(
                          color: Colors.grey
                      ),

                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color:Colors.grey.shade200 )
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color:Colors.grey.shade200 )
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade200
                  ),
                ),
              ),
                Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: _amountController,
                 // allow user to enter 5 line in textfield
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],  // user keyboard will have a button to move cursor to next line
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'This Field is required';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: 'Amount',
                      hintStyle: TextStyle(
                          color: Colors.grey
                      ),

                      suffixIcon:Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SizedBox(height: 20,width: 20,child: Image.asset('assets/images/rupee.png')),
                      ),

                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color:Colors.grey.shade200 )
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color:Colors.grey.shade200 )
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade200
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget buildUploadTypeList(List<String> list) {
    return SizedBox(
      height: 50,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Wrap(

            direction: Axis.horizontal,
            children: List.generate(list.length, (index) {

              return GestureDetector(
                onTap: (){
                  setState(() {
                    _uploadtypeIndex = index;
                  });
                },
                child: Container(
                  // margin: EdgeInsets.symmetric(horizontal: 5),
                    width: 110,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: _uploadtypeIndex == index ? Color(
                          ApiConstants.BG_Add_Expense_Blue
                      ) : Colors.grey.shade100,
                    ),
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.all(5),
                    child: Center(
                      child: Text(
                        list[index].toString(),
                        style: TextStyle(color:_uploadtypeIndex == index ? Colors.white : Colors.black87),
                        textAlign: TextAlign.center,
                      ),
                    )),
              );
            })
        ),
      ),
    );
  }
  Widget UploadView(BuildContext context){
    return Container(

      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,

      ),
      child: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [


            buildUploadTypeList(uploadypelist),
            SizedBox(height: 10,),
            Visibility(
              visible: _uploadtypeIndex==0 ? true : false,
              child: GestureDetector(
                onTap: (){
                  if(Platform.isIOS){
                    ShowDialogIOS();
                  }else{
                    ShowDialog_Android();
                  }
                },
                child: Container(
                  height: 150.0,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(left: 25,right: 25),

                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if(photo==null)...[
                              Image.asset('assets/images/cloud_upload.png',color: Colors.black87,),
                              Text('Upload File/Take Picture')
                          ]else...[
                                Image.file(
                                photo!,
                                fit: BoxFit.cover,
                                  height: 130,


                              ),
                          ]




                        ],

                      ),

                    ],
                  ),
                ),
              ),
            )


          ],
        ),
      ),
    );
  }
  Future pickFromGallery() async {
    try {
      final image =
      await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.photo = imageTemp);
      List<int> imageBytes = photo!.readAsBytesSync();
      String imageB64 = base64Encode(imageBytes);
      print(imageB64);
      log(this.photo!.path.toString());
     // uploadImage(this.photo.path.toString());
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }
  Future pickFromCamera() async {
    try {
      final image =
      await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.photo = imageTemp);


      log(this.photo!.path.toString());
      // uploadImage(this.photo.path.toString());
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }
}

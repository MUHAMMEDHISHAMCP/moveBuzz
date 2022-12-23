import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_delivery/Screens/MyDrawer.dart';
import 'package:go_delivery/utils/string.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'BirthdayScreen.dart';
import 'SelectCountryScreen.dart';
import 'MapScreen.dart';

class EditAccountScreen extends StatefulWidget {
  @override
  _EditAccountScreenState createState() => _EditAccountScreenState();
}

class _EditAccountScreenState extends State<EditAccountScreen> {
  String initlVal;
  bool isPicture= false;
  File imageFile;
   openGallery() async{
   // ignore: deprecated_member_use
   var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
   setState(() {
     imageFile = picture;
     isPicture =true;
   });
  }
 bool isEdit=false;
  edtbtn(){
     setState(() {
       isEdit = true;
     });
  }
  bool editUserName = false;
  bool editUserNameVisbility = true;
    final firstNameController = TextEditingController();
    final lastNameController = TextEditingController();
    GlobalKey<FormState> formKey = GlobalKey<FormState>();




  final GlobalKey<ScaffoldState> mainDrawerKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        return Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
            builder: (context)=>MapScreen()
        ), (route) => false);
      },
      child: SafeArea(child: Scaffold(
        // resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.white,
        key: mainDrawerKey,
        drawer: MyDrawer(),
        body: Container(
          child: Center(
            child: Column(
              children: [
                //AppBar
                Container(
                  height: 55,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                          bottom: BorderSide(
                              width: 0.5,
                              color: Color(0xFF555555)
                          )
                      )
                  ),
                  child: Material(
                    // elevation: 3,
                    color: Colors.white,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        //back bt
                        Positioned(
                          top: 0,
                          bottom: 0,
                          left: 9,
                          child: InkWell(
                            onTap: (){
                              mainDrawerKey.currentState.openDrawer();
                            },
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            child: Container(
                              padding: const EdgeInsets.all(10.0),
                              child: new Image.asset("assets/Icons/ic_menu.png",width: 25,),
                            ),
                          ),
                        ),
                        //Center Widget
                        Positioned(
                          top: 0,
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            alignment: Alignment.center,
                            child: Text("Edit Profile",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontFamily: 'narrowmedium',
                                  fontWeight: FontWeight.w500
                              ),),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    height: MediaQuery.of(context).size.height*1.0-55,
                    child: ListView(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            //Profile Pic
                            Container(
                              height: 160,
                              alignment: Alignment.center,
                              child: InkWell(
                                onTap: (){
                                  openGallery();
                                },
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                child: Container(
                                  height: 105,
                                  width: 110,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Stack(
                                    fit: StackFit.expand,
                                    children: [
                                      Container(
                                        height: 105,
                                        width: 110,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: (imageFile == null)?
                                        Image.asset("assets/Icons/ic_profile.png",fit: BoxFit.fill,):
                                        Image.file(imageFile,fit: BoxFit.fill,),
                                      ),
                                      Positioned(
                                          bottom: -1,
                                          right: 2.5,
                                          child:isEdit?SizedBox(): GestureDetector(
                                              onTap: (){
                                                edtbtn();
                                              },
                                              child:  Container(
                                                padding: EdgeInsets.all(5.0),
                                                child: Image.asset("assets/Icons/ic_edit.png",width: 26,),
                                              )
                                          )
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            //Sec2
                            //First & Last Name
                            Container(
                          
                              margin: EdgeInsets.symmetric(vertical: 10),
                              child: Form(
                                key: formKey,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child:  Container(
                                        height: 75,
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    width: 1,
                                                    color: Color(0x80C2C2C2)
                                                )
                                            )
                                        ),
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              left: 0,
                                              top: 10,
                                              child: Container(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  "First Name",
                                                  style: TextStyle(
                                                    color: Color(0xFF787878),
                                                    fontSize: 12,
                                                    fontFamily: "narrowmedium",
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                TextFormField(
                                                  controller: firstNameController,
                                                  enabled: true,
                                                  keyboardType: TextInputType.text,
                                                  cursorColor: Colors.pink,
                                                  decoration: InputDecoration(
                                                    contentPadding: EdgeInsets.only(top: 15),
                                                    border: InputBorder.none,
                                                    hintText: "John Alex",
                                                    hintStyle: TextStyle(
                                                      color: Color(0xFFC2C2C2),
                                                      fontSize: 12,
                                                      fontFamily: "narrownews",
                                                    ),
                              
                                                  ),
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12,
                                                    fontFamily: "narrownews",
                                                  ),
                                                  validator: (value) {
                                                    
                                                  if (value.isEmpty || value == null) {
                                                    return 'Please fill the field';
                                                  }else{
                                                    return null;
                                                  }
                                                  },
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 25,),
                                    Expanded(
                                      child:  Container(
                                        height: 75,
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    width: 1,
                                                    color: Color(0x80C2C2C2)
                                                )
                                            )
                                        ),
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              left: 0,
                                              top: 10,
                                              child: Container(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  "Last Name",
                                                  style: TextStyle(
                                                    color: Color(0xFF787878),
                                                    fontSize: 12,
                                                    fontFamily: "narrowmedium",
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                TextFormField(
                                                  controller: lastNameController,
                                                  enabled: true,
                                                  keyboardType: TextInputType.text,
                                                  cursorColor: Colors.pink,
                                                  decoration: InputDecoration(
                                                    contentPadding: EdgeInsets.only(top: 15),
                                                    border: InputBorder.none,
                                                    hintText: "Alex",
                                                    hintStyle: TextStyle(
                                                      color: Color(0xFFC2C2C2),
                                                      fontSize: 12,
                                                      fontFamily: "narrownews",
                                                    ),
                              
                                                  ),
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12,
                                                    fontFamily: "narrownews",
                                                  ),
                                                   validator: (value) {
                                                    
                                                  if (value.isEmpty || value == null) {
                                                    return 'Please fill the field';
                                                  }else{
                                                    return null;
                                                  }
                                                  },
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // Username
                            Container(
                              height: 60,
                              margin: EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width: 1,
                                          color: Color(0x80C2C2C2)
                                      )
                                  )
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 10,
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Username",
                                        style: TextStyle(
                                          color: Color(0xFF787878),
                                          fontSize: 12,
                                          fontFamily: "narrowmedium",
                                        ),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      TextFormField(
                                        enabled: editUserName,
                                        keyboardType: TextInputType.text,
                                        cursorColor: Colors.pink,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.only(top: 15),
                                          border: InputBorder.none,
                                          hintText: "Alex1234",
                                          hintStyle: TextStyle(
                                            color: Color(0xFFC2C2C2),
                                            fontSize: 12,
                                            fontFamily: "narrownews",
                                          ),

                                        ),
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontFamily: "narrownews",
                                        ),
                                      ),
                                    ],
                                  ),
                                  Positioned(
                                    right: 0,
                                    top: 0,
                                    bottom: 0,
                                    child: InkWell(
                                      onTap: (){
                                        setState(() {
                                          editUserName=true;
                                          editUserNameVisbility=false;
                                        });
                                      },
                                      child: Visibility(
                                        visible: editUserNameVisbility,
                                        child: Container(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "Edit Username",
                                            style: TextStyle(
                                              color: Colors.pink,
                                              fontSize: 12,
                                              fontFamily: "narrowmedium",
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Your Email
                            Container(
                              height: 60,
                              margin: EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width: 1,
                                          color: Color(0x80C2C2C2)
                                      )
                                  )
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 10,
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Email",
                                        style: TextStyle(
                                          color: Color(0xFF787878),
                                          fontSize: 12,
                                          fontFamily: "narrowmedium",
                                        ),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      TextFormField(
                                        enabled: true,
                                        keyboardType: TextInputType.emailAddress,
                                        cursorColor: Colors.pink,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.only(top: 15),
                                          border: InputBorder.none,
                                          hintText: "johnalex@live.com",
                                          hintStyle: TextStyle(
                                            color: Color(0xFFC2C2C2),
                                            fontSize: 12,
                                            fontFamily: "narrownews",
                                          ),

                                        ),
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontFamily: "narrownews",
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            //Country
                            InkWell(
                              onTap: (){
                                // Navigator.of(context).push(_selectCountryScreenRoute());
                                FocusScope.of(context).requestFocus(FocusNode());
                                _awaitReturnValueFromSelectCountryScreen(context);
                              },
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              child: Container(
                                height: 60,
                                margin: EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            width: 1,
                                            color: Color(0x80C2C2C2)
                                        )
                                    )
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      top: 10,
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Country",
                                          style: TextStyle(
                                            color: Color(0xFF787878),
                                            fontSize: 12,
                                            fontFamily: "narrowmedium",
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 0,
                                      bottom: 10,
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          text==null?"London":text,
                                          style: TextStyle(
                                            color: Color(0xFFC2C2C2),
                                            fontSize: 12,
                                            fontFamily: "narrownews",
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            //Date of birth
                            InkWell(
                              onTap: (){
                                FocusScope.of(context).requestFocus(FocusNode());
                                Navigator.of(context).push(_birthdayScreenRoute());
                              },
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              child: Container(
                                height: 60,
                                margin: EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            width: 1,
                                            color: Color(0x80C2C2C2)
                                        )
                                    )
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      top: 10,
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Date of Birth",
                                          style: TextStyle(
                                            color: Color(0xFF787878),
                                            fontSize: 12,
                                            fontFamily: "narrowmedium",
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 0,
                                      bottom: 10,
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "12 Dec 1992",
                                          style: TextStyle(
                                            color: Color(0xFFC2C2C2),
                                            fontSize: 12,
                                            fontFamily: "narrownews",
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            //Edit Profile button
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 20),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: MaterialButton(
                                      height: 48,
                                      onPressed: () async {
                                        if (firstNameController.text.isEmpty && lastNameController.text.isEmpty) {
                                          Navigator.pop(context);
                                        }else if(formKey.currentState.validate()){
                                          final pref = await SharedPreferences.getInstance();
                                         pref.setString(KStrings.firstName,firstNameController.text);
                                         pref.setString(KStrings.lastNAme, lastNameController.text);
                                        Navigator.pop(context);
                                    
                                      
                                        }
                                      print(firstNameController.text);
                                      },
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(2)
                                      ),
                                      color: Colors.pink,
                                      highlightColor: Colors.transparent,
                                      splashColor: Colors.transparent,
                                      elevation: 0,
                                      highlightElevation: 0,
                                      child: Text(
                                        "Edit Profile",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                            fontFamily: 'narrowmedium'
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
  //_selectCountryScreenRoute
  Route _selectCountryScreenRoute() {
    return  PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => SelectCountryScreen(),
      transitionDuration: Duration(milliseconds: 200),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.easeInOut;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve),);

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
  String text;
  void _awaitReturnValueFromSelectCountryScreen(BuildContext context) async{
    // start the SecondScreen and wait for it to finish with a result
    final result = await Navigator.of(
      context,).push(_selectCountryScreenRoute());
    // after the SecondScreen result comes back update the Text widget with it
    setState(() {
      text = result;
    });
  }

  //_birthdayScreenRoute
  Route _birthdayScreenRoute() {
    return  PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => BirthdayScreen(),
      transitionDuration: Duration(milliseconds: 200),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.easeInOut;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve),);

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}

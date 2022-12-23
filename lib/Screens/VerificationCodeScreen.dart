import 'package:flutter/material.dart';

import 'BirthdayScreen.dart';
class VerificationCodeScreen extends StatefulWidget {
  @override
  _VerificationCodeScreenState createState() => _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen> {
  TextEditingController _controller1=TextEditingController();
  TextEditingController _controller2=TextEditingController();
  TextEditingController _controller3=TextEditingController();
  TextEditingController _controller4=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return
      SafeArea(child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(

          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              // SizedBox(
              //   height: 28,
              // ),
              // AppBar
              Container(
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    //back bt
                    Positioned(
                      top: 0,
                      bottom: 0,
                      left: 7.5,
                      child: InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          child: new Image.asset("assets/Icons/ic_back.png",width: 22,),
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
                        child: Text("Verification Code",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'narrowmedium',
                          ),),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0,),
                  child: ListView(
                    children: [
                      SizedBox(height: 60,),
                      //Verify phone number Text Widget
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Verify phone number",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontFamily: "narrowmedium",
                          ),
                        ),
                      ),
                      //Sign in Text Widget
                      Container(
                        padding: EdgeInsets.only(top: 2),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Check your sms message we've sent you\n"
                              "verification code at 3210000004",
                          style: TextStyle(
                            color: Color(0xFFC2C2C2),
                            fontSize: 12,
                            fontFamily: 'narrowmedium',
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),

                      //InPut fields
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //
                            Expanded(
                              child: Container(
                                height: 100,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1,
                                      color: Color(0x80C2C2C2)
                                  ),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                alignment: Alignment.center,
                                child: TextFormField(
                                  textAlignVertical: TextAlignVertical.center,
                                  textAlign: TextAlign.center,
                                  controller: _controller1,
                                  textInputAction: TextInputAction.next,
                                  // onChanged: (_) => FocusScope.of(context).nextFocus(),
                                  onChanged: (_){
                                    if(_controller1.text.length==1){
                                      FocusScope.of(context).nextFocus();
                                    }
                                  },
                                  keyboardType: TextInputType.number,
                                  maxLength: 1,
                                  cursorColor: Colors.pink,
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(left: 10,right: 8,top: 23),
                                      border: InputBorder.none,
                                      helperStyle: TextStyle(
                                          color: Colors.transparent
                                      )
                                  ),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 40,
                                      fontFamily: 'narrowmedium'
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 15,),
                            Expanded(
                              child: Container(
                                height: 100,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1,
                                      color: Color(0x80C2C2C2)
                                  ),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                alignment: Alignment.center,
                                child: TextFormField(
                                  textAlignVertical: TextAlignVertical.center,
                                  textAlign: TextAlign.center,
                                  textInputAction: TextInputAction.next,
                                  controller: _controller2,
                                  onChanged: (_){
                                    if(_controller2.text.length==1){
                                      FocusScope.of(context).nextFocus();
                                    }
                                  },
                                  keyboardType: TextInputType.number,
                                  maxLength: 1,
                                  cursorColor: Colors.pink,
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(left: 10,right: 8,top: 23),
                                      border: InputBorder.none,
                                      helperStyle: TextStyle(
                                          color: Colors.transparent
                                      )
                                  ),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 40,
                                      fontFamily: 'narrowmedium'
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 15,),
                            Expanded(
                              child: Container(
                                height: 100,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1,
                                      color: Color(0x80C2C2C2)
                                  ),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                alignment: Alignment.center,
                                child: TextFormField(
                                  textAlignVertical: TextAlignVertical.center,
                                  textAlign: TextAlign.center,
                                  controller: _controller3,
                                  textInputAction: TextInputAction.next,
                                  onChanged: (_){
                                    if(_controller3.text.length==1){
                                      FocusScope.of(context).nextFocus();
                                    }
                                  },
                                  keyboardType: TextInputType.number,
                                  maxLength: 1,
                                  cursorColor: Colors.pink,
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(left: 10,right: 8,top: 23),
                                      border: InputBorder.none,
                                      helperStyle: TextStyle(
                                          color: Colors.transparent
                                      )
                                  ),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 40,
                                      fontFamily: 'narrowmedium'
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 15,),
                            Expanded(
                              child: Container(
                                height: 100,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1,
                                      color: Color(0x80C2C2C2)
                                  ),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                alignment: Alignment.center,
                                child: TextFormField(
                                  cursorColor: Colors.pink,
                                  textAlignVertical: TextAlignVertical.center,
                                  textAlign: TextAlign.center,
                                  controller: _controller4,
                                  textInputAction: TextInputAction.done,
                                  onChanged: (_){
                                    if(_controller4.text.length==1){
                                      FocusScope.of(context).nextFocus();
                                    }
                                  },
                                  keyboardType: TextInputType.number,
                                  maxLength: 1,
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(left: 10,right: 8,top: 23),
                                      border: InputBorder.none,
                                      helperStyle: TextStyle(
                                          color: Colors.transparent
                                      )
                                  ),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 40,
                                      fontFamily: 'narrowmedium'
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      //Verify Code
                      Container(
                        padding: EdgeInsets.only(top: 30),
                        child: Row(
                          children: [
                            Expanded(
                              child: MaterialButton(
                                height: 48,
                                onPressed: () {
                                  FocusScope.of(context).requestFocus(FocusNode());
                                  Navigator.of(context).push(_birthdayScreenRoute());
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(2)
                                ),
                                color: Colors.pink,
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                elevation: 0,
                                focusElevation: 0,
                                highlightElevation: 0,
                                child: Text(
                                  "Verify Code",
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
                ),
              )
            ],
          ),
        ),
      ));
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

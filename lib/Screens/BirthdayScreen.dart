import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'UserNameScreen.dart';
class BirthdayScreen extends StatefulWidget {
  @override
  _BirthdayScreenState createState() => _BirthdayScreenState();
}

class _BirthdayScreenState extends State<BirthdayScreen> {

  DateTime _dateTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.white,
      body: Container(
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
                      child: Text("Birthday",
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
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: ListView(
                  children: [
                    SizedBox(height: 60,),
                    //When's your birthday Text Widget
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "When's your birthday?",
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
                      child: Text("Your birthday won't be shown publicly.",
                        style: TextStyle(
                          color: Color(0xFFC2C2C2),
                          fontSize: 12,
                          fontFamily: 'narrowmedium',
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),

                    //
                    SizedBox(
                      height: 200,
                      child: CupertinoDatePicker(
                        initialDateTime: _dateTime,
                        mode: CupertinoDatePickerMode.date,
                        onDateTimeChanged: (dateTime){
                          setState(() {
                            _dateTime=dateTime;
                          });
                        },

                      ),
                    ),

                    //Register Button
                    Container(
                      padding: EdgeInsets.only(top: 30),
                      child: Row(
                        children: [
                          Expanded(
                            child: MaterialButton(
                              height: 48,
                              onPressed: () {
                                FocusScope.of(context).requestFocus(FocusNode());
                                Navigator.of(context).push(_usernameScreenRoute());
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
                                "Register",
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

  //_usernameScreenRoute
  Route _usernameScreenRoute() {
    return  PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => UserNameScreen(),
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'ChangePasswordScreen.dart';
class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      // resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
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
                        child: Text("Forgot Password",
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
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 60,),
                    //Enter the email Text Widget
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Enter the email address you signed up with\n"
                            "We'll send you an email that will let you\n"
                            "choose another password.",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'narrowmedium',
                            height: 1.3
                        ),
                      ),
                    ),
                    //Email Text Field
                    Container(
                      height: 60,
                      margin: EdgeInsets.symmetric(vertical: 20),
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
                                "Your email",
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
                    //Reset Password
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: MaterialButton(
                              height: 48,
                              onPressed: (){
                                FocusScope.of(context).requestFocus(FocusNode());
                                Navigator.of(context).push(_changePasswordScreenRoute());
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(2)
                              ),
                              color: Colors.pink,
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              elevation: 0,
                              highlightElevation: 0,
                              child: Text("Reset Password",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontFamily: 'narrowmedium'
                                ),),
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    ));
  }
  //_changePasswordScreenRoute
  Route _changePasswordScreenRoute() {
    return  PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => ChangePasswordScreen(),
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

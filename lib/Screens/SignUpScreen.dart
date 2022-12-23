import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_delivery/Screens/SelectCountryScreen.dart';

import 'PhoneNumberScreen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  bool _toggleText = true;
  void _toggle() {
    setState(() {
      _toggleText = !_toggleText;
      FocusScope.of(context).requestFocus(FocusNode());
    });
  }
  TextEditingController _passcontroller;
  String text;
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
                      child: Text("Signup",
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
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: ListView(
                      children: [
                        SizedBox(height: 60,),
                        //Welcome Back Text Widget
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Welcome Back,",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 23,
                              fontFamily: "narrowmedium",
                            ),
                          ),
                        ),
                        //Signup Text Widget
                        Container(
                          padding: EdgeInsets.only(top: 2),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Signup to continue",
                            style: TextStyle(
                              color: Color(0xFFC2C2C2),
                              fontSize: 12,
                              fontFamily: 'narrowmedium',
                            ),
                          ),
                        ),
                        SizedBox(height: 18,),
                        //First & Last Name
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child:  Container(
                                  height: 60,
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
                                  height: 60,
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
                                            keyboardType: TextInputType.text,
                                            cursorColor: Colors.pink,
                                            decoration: InputDecoration(
                                              contentPadding: EdgeInsets.only(top: 15),
                                              border: InputBorder.none,
                                              hintText: "Alex",
                                              hintStyle: TextStyle(
                                                color: Color(0xFFC2C2C2),
                                                fontSize: 12,
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
                              ),
                            ],
                          ),
                        ),
                        //Email Text Field
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
                        //Password Text Field
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
                                    "Choose a Password",
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
                                    obscureText: _toggleText,
                                    cursorColor: Colors.pink,
                                    controller: _passcontroller,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(top: 20),
                                      border: InputBorder.none,
                                      hintText: "********",
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
                                right: -8,
                                bottom:2,
                                child:  InkWell(
                                  onTap: (){
                                    _toggle();
                                  },
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: _toggleText? Image.asset("assets/Icons/ic_hide.png",
                                        scale: 3,
                                      ):Image.asset("assets/Icons/ic_show.png",
                                        scale: 3,
                                      )
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        //Country of residence
                        InkWell(
                          onTap: (){
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
                                      "Country of residence",
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
                        //Register Button
                        Container(
                          padding: EdgeInsets.only(top: 20),
                          child: Row(
                            children: [
                              Expanded(
                                child: MaterialButton(
                                  height: 48,
                                  onPressed: () {
                                    FocusScope.of(context).requestFocus(FocusNode());
                                    Navigator.of(context).push(_phoneNumberScreenRoute());
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
                        SizedBox(height: 60,)
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
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
  //_phoneNumberScreenRoute
  Route _phoneNumberScreenRoute() {
    return  PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => PhoneNumberScreen(),
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

  void _awaitReturnValueFromSelectCountryScreen(BuildContext context) async{
    // start the SecondScreen and wait for it to finish with a result
    final result = await Navigator.of(
        context,).push(_selectCountryScreenRoute());
    // after the SecondScreen result comes back update the Text widget with it
    setState(() {
      text = result;
    });
  }

}

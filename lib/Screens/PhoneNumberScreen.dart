import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:country_code_picker/country_code_picker.dart';

import 'VerificationCodeScreen.dart';
class PhoneNumberScreen extends StatefulWidget {
  @override
  _PhoneNumberScreenState createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {

  bool iscolor= false;
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
                        child: Text("Phone Number",
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
                  padding: EdgeInsets.symmetric(horizontal: 20,),
                  child: ListView(
                    children: [
                      SizedBox(height: 60,),

                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "What is your phone Number",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontFamily: "narrowmedium",
                          ),
                        ),
                      ),

                      Container(
                        padding: EdgeInsets.only(top: 2),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Please Confirm your country code and\nenter your phone number",
                          style: TextStyle(
                            color: Color(0xFFC2C2C2),
                            fontSize: 12,
                            fontFamily: 'narrowmedium',
                          ),
                        ),
                      ),
                      SizedBox(height: 30,),

                      //Phone  Number
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            Container(
                              height: 60,
                              width: 85,
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width: 1,
                                          color: Color(0x80C2C2C2)
                                      )
                                  )
                              ),
                              child: Stack(
                                // overflow: Overflow.visible,
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 10,
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Country Code",
                                        style: TextStyle(
                                          color: Color(0xFF787878),
                                          fontSize: 12,
                                          fontFamily: "narrowmedium",
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: -8,
                                    child: SizedBox(),
                                    // child: CountryCodePicker(

                                    //   padding: EdgeInsets.only(right: 65),
                                    //   onChanged: (value){
                                    //     setState(() {
                                    //       iscolor=true;
                                    //     });
                                    //   },
                                    //   initialSelection: 'PK',
                                    //   favorite: ['+92','PK'],
                                    //   showCountryOnly: true,
                                    //   showOnlyCountryWhenClosed: false,
                                    //   showFlag: false,
                                    //   showFlagDialog: true,
                                    //   alignLeft: false,
                                    //   textStyle: TextStyle(
                                    //     color: iscolor?Colors.black: Color(0xFFC2C2C2),
                                    //     fontSize: 13,
                                    //     fontFamily: "narrownews",
                                    //   ),
                                    // ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(width: 18,),
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
                                          "Mobile Number",
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
                                          keyboardType: TextInputType.phone,
                                          cursorColor: Colors.pink,
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.only(top: 15),
                                            border: InputBorder.none,
                                            hintText: "3210000004",
                                            hintStyle: TextStyle(
                                              color: Color(0xFFC2C2C2),
                                              fontSize: 12,
                                              fontFamily: "narrownews",
                                            ),

                                          ),
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 13,
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

                      //Continue Button
                      Container(
                        padding: EdgeInsets.only(top: 20),
                        child: Row(
                          children: [
                            Expanded(
                              child: MaterialButton(
                                height: 48,
                                onPressed: () {
                                  FocusScope.of(context).requestFocus(FocusNode());
                                  Navigator.of(context).push(_verificationCodeScreenRoute());
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
                                  "Continue",
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
        )
    ));
  }
  //_verificationCodeScreenRoute
  Route _verificationCodeScreenRoute() {
    return  PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => VerificationCodeScreen(),
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

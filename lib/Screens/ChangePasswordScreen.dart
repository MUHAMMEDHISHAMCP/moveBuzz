import 'package:flutter/material.dart';
import 'MapScreen.dart';
class ChangePasswordScreen extends StatefulWidget {
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  bool _toggleTextPass = true;
  void _togglePass() {
    setState(() {
      _toggleTextPass = !_toggleTextPass;
      FocusScope.of(context).requestFocus(FocusNode());
    });
  }

  bool _toggleTextConfirmPass = true;
  void _toggleConfirmPass() {
    setState(() {
      _toggleTextConfirmPass = !_toggleTextConfirmPass;
      FocusScope.of(context).requestFocus(FocusNode());
    });
  }
  TextEditingController PassController;
  TextEditingController _confirmPassController;
  @override
  Widget build(BuildContext context) {
    return  SafeArea(child: Scaffold(
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
                      child: Text("Change Password",
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
                    //Change your password Text Widget
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Change your password",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 19,
                          fontFamily: "narrowmedium",
                        ),
                      ),
                    ),
                    SizedBox(height: 30,),
                    // Password Text Field
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
                                "Password",
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
                                obscureText: _toggleTextPass,
                                cursorColor: Colors.pink,
                                controller: PassController,
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
                                _togglePass();
                              },
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child:  _toggleTextPass? Image.asset("assets/Icons/ic_hide.png",
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
                    //Confirm Password Text Field
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
                                "Confirm Password",
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
                                obscureText: _toggleTextConfirmPass,
                                cursorColor: Colors.pink,
                                controller: _confirmPassController,
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
                                _toggleConfirmPass();
                              },
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child:  _toggleTextConfirmPass? Image.asset("assets/Icons/ic_hide.png",
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
                    //Change Password
                    Container(
                      padding: EdgeInsets.only(top: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: MaterialButton(
                              height: 48,
                              onPressed: () {
                                FocusScope.of(context).requestFocus(FocusNode());
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context)=>MapScreen()
                                ));
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
                                "Change Password",
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
}

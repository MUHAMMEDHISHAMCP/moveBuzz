import 'package:flutter/material.dart';

import 'MyDrawer.dart';
import 'MapScreen.dart';
class ChangePasswordDrawerScreen extends StatefulWidget {
  @override
  _ChangePasswordDrawerScreenState createState() => _ChangePasswordDrawerScreenState();
}

class _ChangePasswordDrawerScreenState extends State<ChangePasswordDrawerScreen> {

  bool _toggleTextOldPass = true;
  void _toggleOldPass() {
    setState(() {
      _toggleTextOldPass = !_toggleTextOldPass;
      FocusScope.of(context).requestFocus(FocusNode());
    });
  }

  bool _toggleTextNewPass = true;
  void _toggleNewPass() {
    setState(() {
      _toggleTextNewPass = !_toggleTextNewPass;
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
  TextEditingController _oldPassController;
  TextEditingController _newPassController;
  TextEditingController _confirmPassController;

  final GlobalKey<ScaffoldState> mainDrawerKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        return Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
            builder: (context)=>MapScreen()
        ), (route) => false);
      },
      child:  SafeArea(child: Scaffold(
        backgroundColor: Colors.white,
        key: mainDrawerKey,
        drawer: MyDrawer(),
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
                        child: Text("Update Password",
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
                      //Update your password Text Widget
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Update your password",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 19,
                            fontFamily: "narrowmedium",
                          ),
                        ),
                      ),
                      SizedBox(height: 30,),
                      //Old Password Text Field
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
                                  "Old Password",
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
                                  obscureText: _toggleTextOldPass,
                                  cursorColor: Colors.pink,
                                  controller: _oldPassController,
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
                                  _toggleOldPass();
                                },
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child:  _toggleTextOldPass? Image.asset("assets/Icons/ic_hide.png",
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
                      //New Password Text Field
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
                                  "New Password",
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
                                  obscureText: _toggleTextNewPass,
                                  cursorColor: Colors.pink,
                                  controller: _newPassController,
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
                                  _toggleNewPass();
                                },
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: _toggleTextNewPass? Image.asset("assets/Icons/ic_hide.png",
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
                      //Update Password
                      Container(
                        padding: EdgeInsets.only(top: 20),
                        child: Row(
                          children: [
                            Expanded(
                              child: MaterialButton(
                                height: 48,
                                onPressed: () {
                                  FocusScope.of(context).requestFocus(FocusNode());
                                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                                      builder: (context)=>MapScreen()
                                  ), (route) => false);
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
                                  "Update Password",
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
      )),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_delivery/utils/string.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ProceedScreen.dart';
import 'TypesOfGoodsScreen.dart';

class DeliveryDetailsScreen extends StatefulWidget {
  @override
  _DeliveryDetailsScreenState createState() => _DeliveryDetailsScreenState();
}

class _DeliveryDetailsScreenState extends State<DeliveryDetailsScreen> {
  String value;
  ScrollController _scrollController;
  Brightness keyboardAppearance;
  final senderPhoneNo = TextEditingController();
  final receiverPhoneNo = TextEditingController();
  final senderName = TextEditingController();
  final receiverName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      // resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: [
            // SizedBox(
            //   height: 28,
            // ),
            //AppBar
            Container(
              height: 55,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                      bottom:
                          BorderSide(width: 0.5, color: Color(0xFF555555)))),
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
                      left: 8,
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          child: new Image.asset(
                            "assets/Icons/ic_back.png",
                            width: 22,
                          ),
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
                        child: Text(
                          "Delivery Details",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'narrowmedium',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: LayoutBuilder(builder:
                  (BuildContext context, BoxConstraints viewportConstraints) {
                return SingleChildScrollView(
                  reverse: true,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: bottom),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                          minHeight: viewportConstraints.maxHeight,
                          maxHeight: viewportConstraints.maxHeight),
                      child: ListView(
                        shrinkWrap: true,
                        controller: _scrollController,
                        physics: ClampingScrollPhysics(),
                        children: <Widget>[
                          //Sender Section
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              children: [
                                // Delivery
                                Container(
                                  height: 50,
                                  child: Stack(
                                    children: <Widget>[
                                      Positioned(
                                        left: -13,
                                        top: 0,
                                        bottom: 0,
                                        child: Image.asset(
                                          "assets/Icons/ic_delivery.png",
                                          scale: 2.3,
                                        ),
                                      ),
                                      Positioned(
                                        left: 40,
                                        top: 0,
                                        bottom: 0,
                                        child: Container(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "Delivery",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontFamily: "narrowmedium",
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // Sender
                                Container(
                                  padding: EdgeInsets.only(top: 5, bottom: 8),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Sender",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontFamily: "narrowmedium",
                                    ),
                                  ),
                                ),

                                //Full Name
                                Container(
                                  height: 50,
                                  margin: EdgeInsets.symmetric(vertical: 5),
                                  child: Stack(
                                    children: <Widget>[
                                      Positioned(
                                          left: 0,
                                          top: 0,
                                          bottom: 0,
                                          child: Image.asset(
                                            "assets/Icons/ic_user.png",
                                            width: 25,
                                          )),
                                      Positioned(
                                        left: 40,
                                        top: 8,
                                        child: Container(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "Full Name",
                                            style: TextStyle(
                                              color: Color(0xFF787878),
                                              fontSize: 12,
                                              fontFamily: "narrowmedium",
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(left: 40),
                                        child: TextFormField(
                                          controller: senderName,
                                          keyboardType: TextInputType.text,
                                          cursorColor: Colors.pink,
                                          decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.only(top: 17),
                                            border: InputBorder.none,
                                            hintText: "Jhone",
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
                                      ),
                                    ],
                                  ),
                                ),
                                //Phone Number
                                Container(
                                  height: 50,
                                  margin: EdgeInsets.symmetric(vertical: 5),
                                  child: Stack(
                                    children: <Widget>[
                                      Positioned(
                                          left: 0,
                                          top: 0,
                                          bottom: 0,
                                          child: Image.asset(
                                            "assets/Icons/ic_phone.png",
                                            width: 22,
                                          )),
                                      Positioned(
                                        left: 40,
                                        top: 7,
                                        child: Container(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "Phone number*",
                                            style: TextStyle(
                                              color: Color(0xFF787878),
                                              fontSize: 12,
                                              fontFamily: "narrowmedium",
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(left: 40),
                                        child: TextFormField(
                                          controller: senderPhoneNo,
                                          keyboardType: TextInputType.phone,
                                          cursorColor: Colors.pink,
                                          decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.only(top: 17),
                                            border: InputBorder.none,
                                            hintText: "085156985313",
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
                                      ),
                                    ],
                                  ),
                                ),
                                //Email Address
                                Container(
                                  height: 50,
                                  margin: EdgeInsets.symmetric(vertical: 5),
                                  child: Stack(
                                    children: <Widget>[
                                      Positioned(
                                          left: 2,
                                          top: 0,
                                          bottom: 0,
                                          child: Image.asset(
                                            "assets/Icons/ic_mail.png",
                                            width: 22,
                                          )),
                                      Positioned(
                                        left: 40,
                                        top: 7,
                                        child: Container(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "Email Address",
                                            style: TextStyle(
                                              color: Color(0xFF787878),
                                              fontSize: 12,
                                              fontFamily: "narrowmedium",
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(left: 40),
                                        child: TextFormField(
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          cursorColor: Colors.pink,
                                          decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.only(top: 17),
                                            border: InputBorder.none,
                                            hintText: "jhone123@gmail.com",
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
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          //Divider
                          Container(
                              padding: EdgeInsets.symmetric(vertical: 15.0),
                              child: Divider(
                                height: 1,
                                color: Color(0x80C2C2C2),
                                thickness: 1,
                              )),
                          //Receiver Section
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              children: [
                                // Receiver
                                Container(
                                  padding: EdgeInsets.only(top: 5, bottom: 8),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Receiver",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontFamily: "narrowmedium",
                                    ),
                                  ),
                                ),

                                //Full Name
                                Container(
                                  height: 50,
                                  margin: EdgeInsets.symmetric(vertical: 5),
                                  child: Stack(
                                    children: <Widget>[
                                      Positioned(
                                          left: 0,
                                          top: 0,
                                          bottom: 0,
                                          child: Image.asset(
                                            "assets/Icons/ic_user.png",
                                            width: 25,
                                          )),
                                      Positioned(
                                        left: 40,
                                        top: 8,
                                        child: Container(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "Full Name",
                                            style: TextStyle(
                                              color: Color(0xFF787878),
                                              fontSize: 12,
                                              fontFamily: "narrowmedium",
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(left: 40),
                                        child: TextFormField(
                                          controller: receiverName,
                                          keyboardType: TextInputType.text,
                                          cursorColor: Colors.pink,
                                          decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.only(top: 17),
                                            border: InputBorder.none,
                                            hintText: "Jhone",
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
                                      ),
                                    ],
                                  ),
                                ),
                                //Phone Number
                                Container(
                                  height: 50,
                                  margin: EdgeInsets.symmetric(vertical: 5),
                                  child: Stack(
                                    children: <Widget>[
                                      Positioned(
                                          left: 0,
                                          top: 0,
                                          bottom: 0,
                                          child: Image.asset(
                                            "assets/Icons/ic_phone.png",
                                            width: 22,
                                          )),
                                      Positioned(
                                        left: 40,
                                        top: 7,
                                        child: Container(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "Phone number*",
                                            style: TextStyle(
                                              color: Color(0xFF787878),
                                              fontSize: 12,
                                              fontFamily: "narrowmedium",
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(left: 40),
                                        child: TextFormField(
                                          controller: receiverPhoneNo,
                                          keyboardType: TextInputType.phone,
                                          cursorColor: Colors.pink,
                                          decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.only(top: 17),
                                            border: InputBorder.none,
                                            hintText: "085156985313",
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
                                      ),
                                    ],
                                  ),
                                ),
                                //Email Address
                                Container(
                                  height: 50,
                                  margin: EdgeInsets.symmetric(vertical: 5),
                                  child: Stack(
                                    children: <Widget>[
                                      Positioned(
                                          left: 2,
                                          top: 0,
                                          bottom: 0,
                                          child: Image.asset(
                                            "assets/Icons/ic_mail.png",
                                            width: 22,
                                          )),
                                      Positioned(
                                        left: 40,
                                        top: 7,
                                        child: Container(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "Email Address",
                                            style: TextStyle(
                                              color: Color(0xFF787878),
                                              fontSize: 12,
                                              fontFamily: "narrowmedium",
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(left: 40),
                                        child: TextFormField(
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          cursorColor: Colors.pink,
                                          decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.only(top: 17),
                                            border: InputBorder.none,
                                            hintText: "jhone123@gmail.com",
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
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          //Divider
                          Container(
                              padding: EdgeInsets.symmetric(vertical: 15.0),
                              child: Divider(
                                height: 1,
                                color: Color(0x80C2C2C2),
                                thickness: 1,
                              )),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              children: [
                                // Item Details
                                Container(
                                  padding: EdgeInsets.only(top: 5, bottom: 8),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Item Details",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontFamily: "narrowmedium",
                                    ),
                                  ),
                                ),
                                //Types of goods
                                InkWell(
                                  onTap: () {
                                    _returnValueFromTypesofGoodsScreen(context);
                                  },
                                  child: Container(
                                    height: 50,
                                    child: Stack(
                                      children: <Widget>[
                                        Positioned(
                                          left: 0,
                                          top: 0,
                                          bottom: 0,
                                          child: Container(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              (value == null)
                                                  ? "Types of goods"
                                                  : "$value",
                                              style: TextStyle(
                                                color: Color(0xFF787878),
                                                fontSize: 12,
                                                fontFamily: "narrowmedium",
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          right: -19,
                                          top: 0,
                                          bottom: 0,
                                          child: Image.asset(
                                            "assets/Icons/ic_right_arrow.png",
                                            scale: 4.5,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                //Items Name
                                Container(
                                  height: 50,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 0,
                                        top: 7,
                                        child: Container(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "Items Name",
                                            style: TextStyle(
                                              color: Color(0xFF787878),
                                              fontSize: 12,
                                              fontFamily: "narrowmedium",
                                            ),
                                          ),
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          TextFormField(
                                            keyboardType: TextInputType.text,
                                            cursorColor: Colors.pink,
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.only(top: 13),
                                              border: InputBorder.none,
                                              hintText:
                                                  "Food, grocery, parcel delivery etc",
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
                                //Additional Details
                                Container(
                                  alignment: Alignment.centerLeft,
                                  margin: EdgeInsets.only(top: 12),
                                  child: Text(
                                    "Additional Details",
                                    style: TextStyle(
                                      color: Color(0xFF787878),
                                      fontSize: 12,
                                      fontFamily: "narrowmedium",
                                    ),
                                  ),
                                ),
                                //
                                Container(
                                  child: TextFormField(
                                    maxLines: 4,
                                    maxLength: 150,
                                    cursorColor: Colors.pink,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.only(top: 2),
                                      hintText:
                                          "Tell us what you are sending or share specific\n"
                                          "instructions to the courier. (Optional)",
                                      hintStyle: TextStyle(
                                        color: Color(0xFFC2C2C2),
                                        fontSize: 12,
                                        fontFamily: "narrownews",
                                      ),
                                    ),
                                    buildCounter: (BuildContext context,
                                        {int currentLength,
                                        int maxLength,
                                        bool isFocused}) {
                                      return Text(
                                        'Maximum Character: $currentLength/$maxLength ',
                                        style: new TextStyle(
                                          color: Color(0xFFC2C2C2),
                                          fontSize: 12,
                                          fontFamily: "narrownews",
                                        ),
                                      );
                                    },
                                  ),
                                ),

                                //Next Button
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 15),
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: MaterialButton(
                                          height: 48,
                                          onPressed: () async {
                                            final pref = await SharedPreferences
                                                .getInstance();
                                            pref.setString(
                                                KStrings.receiverPhoneNo,
                                                receiverPhoneNo.text);
                                            pref.setString(
                                                KStrings.receiverName,
                                                receiverName.text);
                                            pref.setString(
                                                KStrings.senderPhoneNo,
                                                senderPhoneNo.text);
                                            pref.setString(
                                                KStrings.senderName,
                                                senderName
                                                .text);
                                            FocusScope.of(context)
                                                .requestFocus(FocusNode());
                                            Navigator.of(context).push(
                                                _DeliveryDetailsScreen2Route());
                                          },
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(2)),
                                          color: Colors.pink,
                                          highlightColor: Colors.transparent,
                                          splashColor: Colors.transparent,
                                          elevation: 0,
                                          highlightElevation: 0,
                                          child: Text(
                                            "Next",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 13,
                                                fontFamily: 'narrowmedium'),
                                          ),
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
                );
              }),
            ),
          ],
        ),
      ),
    ));
  }

  void _returnValueFromTypesofGoodsScreen(BuildContext context) async {
    FocusScope.of(context).requestFocus(FocusNode());
    final result = await Navigator.of(context).push(_typeOfGoodsScreenRoute());
    setState(() {
      value = result;
    });
  }

//_typeOfGoodsScreenRoute
  Route _typeOfGoodsScreenRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          TypesOfGoodsScreen(),
      transitionDuration: Duration(milliseconds: 200),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.easeInOut;
        var tween = Tween(begin: begin, end: end).chain(
          CurveTween(curve: curve),
        );

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  //_DeliveryDetailsScreen2Route
  Route _DeliveryDetailsScreen2Route() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => ProceedScreen(),
      transitionDuration: Duration(milliseconds: 200),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.easeInOut;
        var tween = Tween(begin: begin, end: end).chain(
          CurveTween(curve: curve),
        );

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}

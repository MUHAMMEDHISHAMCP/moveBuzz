import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class AddPaymentMethod extends StatefulWidget {
  @override
  _AddPaymentMethodState createState() => _AddPaymentMethodState();
}

class _AddPaymentMethodState extends State<AddPaymentMethod> {
  DateTime _currentdate = new DateTime.now();

  Future<void> dfung(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _currentdate,
        firstDate: DateTime(2000, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != _currentdate)
      setState(() {
        _currentdate = picked;
      });
  }
  @override
  Widget build(BuildContext context) {
    String _formatdate = new DateFormat.yM().format(_currentdate);
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: ListView(
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
                    //Center Widget
                    Positioned(
                      top: 0,
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        alignment: Alignment.center,
                        child: Text("Add Payment Methods",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'narrowmedium',
                          ),),
                      ),
                    ),

                    Positioned(
                      top: 0,
                      bottom: 0,
                      right: 8.5,
                      child: InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset("assets/Icons/ic_close.png",width: 18,),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                child:
                Column(
                  children: [
                    //Card Holder
                    Container(
                      height: 60,
                      padding: EdgeInsets.symmetric(horizontal: 20),
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
                                "Card Holder",
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
                                  hintText: "Charles Thomson",
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

                    //Card  Number
                    Container(
                      height: 60,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      margin: EdgeInsets.only(bottom: 10),
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
                                "Card Number",
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
                                obscureText: false,
                                cursorColor: Colors.pink,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(top: 15),
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
                            right: 0,
                            bottom: 17,
                            child:  GestureDetector(
                              onTap: (){
                                //_toggle();
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(left:31.0),
                                child: Image.asset("assets/Icons/ic_visa.png",
                                  scale: 3.2,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    //Expiraion & Security Code
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child:  InkWell(
                              onTap: (){
                                FocusScope.of(context).requestFocus(FocusNode());
                                dfung(context);
                              },
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              child: Container(
                                height: 60,
                                padding: EdgeInsets.symmetric(horizontal: 20),
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
                                          "Expiraion",
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
                                          enabled: false,
                                          keyboardType: TextInputType.datetime,
                                          cursorColor: Colors.pink,
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.only(top: 15),
                                            border: InputBorder.none,
                                            hintText: _formatdate==null?"12/23":_formatdate,
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
                          ),
                          SizedBox(width: 25,),
                          Expanded(
                            child:  Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
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
                                // overflow: Overflow.visible,
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 10,
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Security Code",
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
                                        keyboardType: TextInputType.number,
                                        cursorColor: Colors.pink,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.only(top: 15),
                                          border: InputBorder.none,
                                          hintText: "640",
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
                                    right: -2,
                                    bottom: 15,
                                    child: GestureDetector(
                                      onTap: (){
                                        //_toggle();
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 32),
                                        child: Image.asset("assets/Icons/ic_qMark.png",
                                          scale: 4.2,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    //Add Card Button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 25),
                      child: Row(
                        children: [
                          Expanded(
                            child: MaterialButton(
                              height: 48,
                              onPressed: () {
                                //  Navigator.of(context).push(_logInRoute());
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
                                "Add Card",
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
              )
            )
          ],
        ),
      ),
    ));
  }

}


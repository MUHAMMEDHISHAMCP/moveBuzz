import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    return  SafeArea(child: Scaffold(
      // resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
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
                        child: Text("Support",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'narrowmedium',
                              fontWeight: FontWeight.w500
                          ),),
                      ),
                    ),
                    //option Menu
                    Positioned(
                      top: 0,
                      bottom: 0,
                      right: 2,
                      child:InkWell(
                        onTap: (){
                          _showPopupMenu(context);
                        },
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          child: new Image.asset("assets/Icons/ic_option.png",width: 20,),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //
            Expanded(
              child: Container(
                  height: MediaQuery.of(context).size.height*1.0-55,
                  child: LayoutBuilder(
                      builder: (BuildContext context,BoxConstraints viewportConstraints){
                        return SingleChildScrollView(
                          reverse: true,
                          child: Padding(
                            padding:  EdgeInsets.only(bottom: bottom),
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                  minHeight: viewportConstraints.maxHeight,
                                  maxHeight: viewportConstraints.maxHeight),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(horizontal: 30.0),
                                      child: ListView(
                                        children: [
                                          //resive
                                          Container(
                                            padding: EdgeInsets.symmetric(vertical: 12.0),
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.only(left: 16.0,right: 16.0,top: 10),
                                                  decoration: BoxDecoration(
                                                      color: Colors.pink,
                                                      borderRadius: BorderRadius.only(
                                                        topLeft: Radius.circular(8),
                                                        topRight: Radius.circular(8),
                                                        bottomLeft: Radius.circular(8),
                                                      )
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        width: MediaQuery.of(context).size.width*0.6-2,
                                                        child: Text("Hello I am John... I wanted to enwuire about a "
                                                            "product name Nivea Cream 3 lbs. is it available on your store.?",
                                                          softWrap: true,
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 12,
                                                            fontFamily: "narrowmedium",
                                                          ),),
                                                      ),
                                                      //
                                                      Container(
                                                        height: 40,
                                                        alignment: Alignment.centerLeft,
                                                        child: Text("Sent : Oct 12, 2015",
                                                          style: TextStyle(
                                                            color: Colors.white70,
                                                            fontSize: 12,
                                                            fontFamily: "narrowmedium",
                                                          ),),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(width: 10.0,),
                                                //dp
                                                Container(
                                                  child: CircleAvatar(
                                                    radius: 22.0,
                                                    backgroundColor: Colors.grey,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          //Send
                                          Container(
                                            padding: EdgeInsets.symmetric(vertical: 12.0),
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                //dp
                                                Container(
                                                  child: CircleAvatar(
                                                    radius: 22.0,
                                                    backgroundColor: Colors.grey,
                                                  ),
                                                ),
                                                SizedBox(width: 10.0,),
                                                Container(
                                                  padding: EdgeInsets.only(left: 16.0,right: 16.0,top: 10),
                                                  decoration: BoxDecoration(
                                                      color: Colors.grey[200],
                                                      borderRadius: BorderRadius.only(
                                                        topLeft: Radius.circular(8),
                                                        topRight: Radius.circular(8),
                                                        bottomRight: Radius.circular(8),
                                                      )
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        width: MediaQuery.of(context).size.width*0.6-2,
                                                        child: Text("Sorry it is unavailable at the moment\n\n\nCheers",
                                                          softWrap: true,
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 12,
                                                            fontFamily: "narrowmedium",
                                                          ),),
                                                      ),
                                                      //
                                                      Container(
                                                        height: 40,
                                                        alignment: Alignment.centerLeft,
                                                        child: Text("Sent : Oct 12, 2015",
                                                          style: TextStyle(
                                                            color: Color(0xFFC2C2C2),
                                                            fontSize: 12,
                                                            fontFamily: "narrowmedium",
                                                          ),),
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


                                  Container(
                                    height: 60,
                                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            top: BorderSide(
                                                width: 1,
                                                color: Color(0x80C2C2C2)
                                            )
                                        )
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                              child: TextFormField(
                                                cursorColor: Colors.pink,
                                                decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: "Write a message",
                                                    hintStyle: TextStyle(
                                                      color: Color(0xFFC2C2C2),
                                                      fontFamily: "narrowmedium",
                                                      fontSize: 14,
                                                    )
                                                ),
                                              )
                                          ),
                                        ),
                                        Container(
                                          child: Text("Send",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontFamily: "narrowmedium",
                                                color: Colors.pink
                                            ),),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      })
              ),
            )
          ],
        ),
      ),


    ));
  }
  //_showPopupMenu

  void _showPopupMenu(BuildContext context)
  {
    showMenu<String>(
        context: context,
        position: new RelativeRect.fromLTRB(120.0, 65.0, 22.0, 100.0),
        items: <PopupMenuEntry<String>>[
          PopupMenuItem<String>(
            height: 40,
            child: InkWell(
              onTap: (){
                FocusScope.of(context).requestFocus(FocusNode());
               Navigator.pop(context);
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Container(
                height: 35,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 10,),
                child: Text(Option.choices[0],
                  maxLines: 1,
                  style: TextStyle(
                      color: Color(0xFF787878),
                      fontSize: 13,
                      fontFamily: "narrowmedium"
                  ),),
              ),
            ),
          ),
        ]
    );
  }
}
class Option{
  static const String Report = "Report a Problem";
  static const List<String> choices = <String>[
    Report,
  ];
}
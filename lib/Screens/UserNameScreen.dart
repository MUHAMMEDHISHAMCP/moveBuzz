import 'package:flutter/material.dart';

import 'MapScreen.dart';
class UserNameScreen extends StatefulWidget {
  @override
  _UserNameScreenState createState() => _UserNameScreenState();
}

class _UserNameScreenState extends State<UserNameScreen> {
  @override
  Widget build(BuildContext context) {
    return
       SafeArea(child: Scaffold(
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
                         child: Text("Username",
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
                       //Add username Text Widget
                       Container(
                         alignment: Alignment.centerLeft,
                         child: Text(
                           "Add username",
                           style: TextStyle(
                             color: Colors.black,
                             fontSize: 15,
                             fontFamily: "narrowmedium",
                           ),
                         ),
                       ),
                       // Text Widget
                       Container(
                         padding: EdgeInsets.only(top: 2),
                         alignment: Alignment.centerLeft,
                         child: Text("Enter unique username.",
                           style: TextStyle(
                             color: Color(0xFFC2C2C2),
                             fontSize: 12,
                             fontFamily: 'narrowmedium',
                           ),
                         ),
                       ),
                       SizedBox(height: 15,),

                       //UserName
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
                                   "Username",
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
                                     hintText: "Alex",
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

                       //Submit Button
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
                                   "Submit",
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

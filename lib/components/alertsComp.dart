import 'dart:async';

import 'package:amazkart/screens/ordersScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/wishlist.dart';

class AlertsComp extends StatefulWidget{
  const AlertsComp({super.key});

  @override
  State<AlertsComp> createState() => _AlertsCompState();
}

class _AlertsCompState extends State<AlertsComp> {
  final _auth = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text("AmazKart", style: GoogleFonts.sairaExtraCondensed(
            fontSize: 35,
            color: Colors.white,
            fontWeight: FontWeight.w400
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: InkWell(
              splashColor: Colors.black54,
              onTap: (){
                Timer(const Duration(milliseconds: 250),
                        ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> const Wishlist()))
                );
              },
              borderRadius: BorderRadius.circular(50),
              child: Ink(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.black,
                  border: Border.all(color: Colors.white, width: 0.7),
                ),
                child: const Icon(CupertinoIcons.bag, color: Colors.white, size: 17,),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection("alerts").where("userID", isEqualTo: _auth?.uid).orderBy("createdAt").snapshots(),
            builder: (context, snapshot){
              List<Column> alertsWidget = [];
              if(snapshot.hasData){
                final alertDB = snapshot.data?.docs.reversed.toList();
                for(var q in alertDB!){
                  final alertWidget = Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 0, left: 5, right: 5),
                        child: InkWell(
                          onTap: (){
                            if(q["content"] == "Welcome to AmazKart. Hope you will find your desired smartphone in a affordable price."){
                              return;
                            }
                            else{
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> const OrdersScreen()));
                            }
                          },
                          splashColor: Colors.black87,
                          borderRadius: BorderRadius.circular(10),
                          child: Ink(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(35, 35, 34, 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Text(q["content"],
                                textAlign: TextAlign.justify,
                                style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Divider(color: Colors.black,),
                    ],
                  );
                  alertsWidget.add(alertWidget);
                }
              }
              return ListView(
                children: alertsWidget,
              );
            },
          ),
        )
      ),
    );
  }
}
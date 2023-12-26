import 'dart:async';

import 'package:amazkart/screens/phoneDetails.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AllPhones extends StatelessWidget{
  const AllPhones({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text("All Brands", style: GoogleFonts.sairaExtraCondensed(
            fontSize: 30,
            color: Colors.white,
            fontWeight: FontWeight.w400
          ),
        ),
        leading: GestureDetector(
          child: const Icon(FluentIcons.chevron_left_20_regular, color: Colors.red,),
          onTap: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 5, right: 5, left: 5, bottom: 5),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.9,
            child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection("products").snapshots(),
                builder: (context, snapshot){
                  List<Column> productsWidget = [];
                  if(snapshot.hasData){
                    final productsdb = snapshot.data?.docs.reversed.toList();
                    for(var q in productsdb!){
                      String _id = q["productID"];
                      String name = q["name"];
                      final productWidget = Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            splashColor: Colors.black38,
                            borderRadius: BorderRadius.circular(15),
                            onTap: (){
                              Timer(const Duration(milliseconds: 300), ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=> PhoneDetails(productID: _id, name: name))));
                            },
                            child: Ink(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                          flex: 2,
                                          child: Container(
                                            height: 150,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(15),
                                            ),
                                            child: Image.network(q["images"]),
                                          )
                                      ),
                                      Expanded(
                                          flex: 3,
                                          child: Padding(
                                            padding: const EdgeInsets.all(5),
                                            child: SizedBox(
                                              height: 100,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  Text(q["brand"],
                                                    style: GoogleFonts.oswald(
                                                        textStyle: const TextStyle(fontWeight: FontWeight.w500)
                                                    ),
                                                  ),
                                                  Text(q["name"],
                                                    style: GoogleFonts.oswald(
                                                      textStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 22)
                                                    ),
                                                  ),
                                                  Text("${q["price"][0]} Rs.",
                                                    style: GoogleFonts.oswald(
                                                        textStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 17)
                                                    ),
                                                  ),
                                                  const Text("Free Delivery", style: TextStyle(fontWeight: FontWeight.w500),)
                                                ],
                                              ),
                                            ),
                                          )
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Divider(color: Colors.black),
                        ],
                      );
                      productsWidget.add(productWidget);
                    }
                  }
                  return ListView(
                    children: productsWidget,
                  );
                }
            ),
          ),
        ),
      ),
    );
  }

}
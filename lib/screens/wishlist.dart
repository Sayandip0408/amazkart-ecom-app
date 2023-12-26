import 'dart:async';

import 'package:amazkart/screens/phoneDetails.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'orderSummary.dart';

class Wishlist extends StatefulWidget{
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  final _auth = FirebaseAuth.instance;
  var len = 0;
  @override
  void initState() {
    FirebaseFirestore.instance.collection("carts").where("u_ID", isEqualTo: _auth.currentUser?.uid).count().get().then((value) => getLen(value.count));
    super.initState();
  }
  void getLen(int value){
    setState(() {
      len = value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Wishlist ", style: TextStyle(color: Colors.white),),
            Icon(FluentIcons.heart_20_filled, color: Colors.red,),
          ],
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: GestureDetector(
          child: const Icon(FluentIcons.chevron_left_20_regular, color: Colors.red,),
          onTap: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: len != 0 ?
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 800,
          width: double.infinity,
          child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection("carts").where("u_ID", isEqualTo: _auth.currentUser?.uid).orderBy("createdAt").snapshots(),
              builder: (context, snapshot){
                List<Column> cartsWidget = [];
                if(snapshot.hasData){
                  final cartsdb = snapshot.data?.docs.reversed.toList();
                  for(var q in cartsdb!){
                    String _id = q["cartID"];
                    final cartWidget = Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          splashColor: Colors.black38,
                          borderRadius: BorderRadius.circular(15),
                          onTap: (){
                            Timer(const Duration(milliseconds: 300), ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=> PhoneDetails(productID: q["productID"], name: q["productName"]))));
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
                                        flex: 1,
                                        child: Container(
                                          height: 110,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(15),
                                              color: Colors.white
                                          ),
                                          child: Image.network(q["images"]),
                                        )
                                    ),
                                    Expanded(
                                        flex: 3,
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 5, right: 5),
                                          child: SizedBox(
                                            height: 110,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text(q["productName"],
                                                  style: GoogleFonts.oswald(
                                                      textStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 22)
                                                  ),
                                                ),
                                                Text(q["color"],
                                                  style: GoogleFonts.oswald(
                                                      textStyle: const TextStyle(fontWeight: FontWeight.w500,)
                                                  ),
                                                ),
                                                Text(q["storage"],
                                                  style: GoogleFonts.oswald(
                                                      textStyle: const TextStyle(fontWeight: FontWeight.w500,)
                                                  ),
                                                ),
                                                Text("\u{20B9} ${q["price"]}",
                                                  style: GoogleFonts.oswald(
                                                      textStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18)
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: InkWell(
                                        onTap: (){
                                          var col = FirebaseFirestore.instance.collection("carts");
                                          col.doc(_id).delete()
                                              .then((_) => ScaffoldMessenger.of(context).showSnackBar(
                                              const SnackBar(
                                                content: Text("Removed from wishlist", style: TextStyle(color: Colors.black),),
                                                backgroundColor: Colors.white,
                                              )
                                          ));
                                          setState(() {
                                            len = len - 1;
                                          });
                                        },
                                        splashColor: Colors.red,
                                        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(15)),
                                        child: Ink(
                                          height: 40,
                                          decoration: const BoxDecoration(
                                            // color: Colors.red,
                                            border: Border(
                                              top: BorderSide(color: Colors.black, width: 0.5),
                                              right: BorderSide(color: Colors.black, width: 0.25),
                                            ),
                                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15)),
                                          ),
                                          child: const Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Icon(FluentIcons.delete_20_filled, color: Colors.red,),
                                              Text(" Remove", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: InkWell(
                                        onTap: (){
                                          Timer(const Duration(milliseconds: 250), () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=> OrderSummary(productID: q["productID"], color: q["color"], storage: q["storage"], price: q["price"], image: q["images"], prodName: q["productName"])));
                                          });
                                        },
                                        splashColor: Colors.green,
                                        borderRadius: const BorderRadius.only(bottomRight: Radius.circular(15)),
                                        child: Ink(
                                          height: 40,
                                          decoration: const BoxDecoration(
                                            // color: Colors.green,
                                            border: Border(
                                              top: BorderSide(color: Colors.black, width: 0.5),
                                              left: BorderSide(color: Colors.black, width: 0.25),
                                            ),
                                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(15)),
                                          ),
                                          child: const Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Icon(FluentIcons.shopping_bag_20_filled, color: Colors.green,),
                                              Text(" Buy Now", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),),
                                            ],
                                          ),
                                        ),
                                      ),
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
                    cartsWidget.add(cartWidget);
                  }
                }
                return ListView(
                  children: cartsWidget,
                );
              }
          ),
        ),
      ):
      SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Wishlist Is Empty", style: TextStyle(color: Colors.white70, fontSize: 16, fontWeight: FontWeight.w500),),
            const Text(""),
            Image.asset("images/sad.webp",height: 150,),
          ],
        ),
      ),
    );
  }
}
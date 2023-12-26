import 'dart:async';

import 'package:amazkart/screens/phoneDetails.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  final _auth = FirebaseAuth.instance;
  var len = 0;
  @override
  void initState() {
    FirebaseFirestore.instance.collection("orders").where("orderedBy", isEqualTo: _auth.currentUser?.uid).count().get().then((value) => getLen(value.count));
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
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: GestureDetector(
          child: const Icon(
            FluentIcons.chevron_left_20_regular,
            color: Colors.red,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Your Orders ",
              style: TextStyle(color: Colors.white),
            ),
            Icon(
              FluentIcons.box_20_filled,
              color: Colors.blue,
            )
          ],
        ),
      ),
      body: len != 0 ?
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 800,
          width: double.infinity,
          child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("orders")
                  .where("orderedBy", isEqualTo: _auth.currentUser?.uid)
                  .orderBy("createdAt")
                  .snapshots(),
              builder: (context, snapshot) {
                List<Column> ordersWidget = [];
                if (snapshot.hasData) {
                  final ordersdb = snapshot.data?.docs.reversed.toList();
                  for (var q in ordersdb!) {
                    String _id = q["orderID"];
                    final orderWidget = Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          splashColor: Colors.black38,
                          borderRadius: BorderRadius.circular(15),
                          onTap: () {
                            Timer(
                                const Duration(milliseconds: 300),
                                    () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => PhoneDetails(
                                            productID: q["productID"],
                                            name: q["productName"]))));
                          },
                          child: Ink(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: Container(
                                          height: 110,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(15),
                                              color: Colors.white),
                                          child: Image.network(q["image"]),
                                        )),
                                    Expanded(
                                        flex: 3,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 5, right: 5),
                                          child: SizedBox(
                                            height: 110,
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  q["productName"],
                                                  style: GoogleFonts.oswald(
                                                      textStyle:
                                                      const TextStyle(
                                                          fontWeight:
                                                          FontWeight
                                                              .w500,
                                                          fontSize: 22)),
                                                ),
                                                Text(
                                                  q["color"],
                                                  style: GoogleFonts.oswald(
                                                      textStyle:
                                                      const TextStyle(
                                                        fontWeight: FontWeight.w500,
                                                      )),
                                                ),
                                                Text(
                                                  q["storage"],
                                                  style: GoogleFonts.oswald(
                                                      textStyle:
                                                      const TextStyle(
                                                        fontWeight: FontWeight.w500,
                                                      )),
                                                ),
                                                Text(
                                                  "\u{20B9} ${q["price"]}",
                                                  style: GoogleFonts.oswald(
                                                      textStyle:
                                                      const TextStyle(
                                                          fontWeight:
                                                          FontWeight
                                                              .w500,
                                                          fontSize: 18)),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 10),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: SizedBox(
                                          child: q["status"] == "Confirmed"
                                              ? const Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              Icon(
                                                FluentIcons
                                                    .circle_20_filled,
                                                color: Colors.green,
                                              ),
                                              Text(
                                                "|",
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "|",
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                              Icon(
                                                FluentIcons
                                                    .circle_20_filled,
                                                color: Colors.grey,
                                              ),
                                              Text(
                                                "|",
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "|",
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                              Icon(
                                                FluentIcons
                                                    .circle_20_filled,
                                                color: Colors.grey,
                                              ),
                                            ],
                                          )
                                              : q["status"] == "Shipped"
                                              ? const Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .center,
                                            crossAxisAlignment:
                                            CrossAxisAlignment
                                                .center,
                                            children: [
                                              Icon(
                                                FluentIcons
                                                    .circle_20_filled,
                                                color: Colors.green,
                                              ),
                                              Text(
                                                "|",
                                                style: TextStyle(
                                                    color:
                                                    Colors.green),
                                              ),
                                              Text(
                                                "|",
                                                style: TextStyle(
                                                    color:
                                                    Colors.green),
                                              ),
                                              Icon(
                                                FluentIcons
                                                    .circle_20_filled,
                                                color: Colors.green,
                                              ),
                                              Text(
                                                "|",
                                                style: TextStyle(
                                                    color:
                                                    Colors.grey),
                                              ),
                                              Text(
                                                "|",
                                                style: TextStyle(
                                                    color:
                                                    Colors.grey),
                                              ),
                                              Icon(
                                                FluentIcons
                                                    .circle_20_filled,
                                                color: Colors.grey,
                                              ),
                                            ],
                                          )
                                              : const Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .center,
                                            crossAxisAlignment:
                                            CrossAxisAlignment
                                                .center,
                                            children: [
                                              Icon(
                                                FluentIcons
                                                    .circle_20_filled,
                                                color: Colors.green,
                                              ),
                                              Text(
                                                "|",
                                                style: TextStyle(
                                                    color:
                                                    Colors.green),
                                              ),
                                              Text(
                                                "|",
                                                style: TextStyle(
                                                    color:
                                                    Colors.green),
                                              ),
                                              Icon(
                                                FluentIcons
                                                    .circle_20_filled,
                                                color: Colors.green,
                                              ),
                                              Text(
                                                "|",
                                                style: TextStyle(
                                                    color:
                                                    Colors.green),
                                              ),
                                              Text(
                                                "|",
                                                style: TextStyle(
                                                    color:
                                                    Colors.green),
                                              ),
                                              Icon(
                                                FluentIcons
                                                    .circle_20_filled,
                                                color: Colors.green,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                          flex: 5,
                                          child: SizedBox(
                                            height: 150,
                                            child: q["status"] == "Confirmed"
                                                ? Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              crossAxisAlignment:
                                              CrossAxisAlignment
                                                  .start,
                                              children: [
                                                Text(
                                                  "Order Confirmed ${q["orderedOn"]}",
                                                  style: const TextStyle(
                                                      fontWeight:
                                                      FontWeight
                                                          .w500),
                                                ),
                                                Text(
                                                  "Shipped ${q["shippingDate"]}",
                                                  style: const TextStyle(
                                                      fontWeight:
                                                      FontWeight.w500,
                                                      color:
                                                      Colors.white),
                                                ),
                                                Text(
                                                  "Delivered ${q["deliveryOn"]}",
                                                  style: const TextStyle(
                                                      fontWeight:
                                                      FontWeight.w500,
                                                      color:
                                                      Colors.white),
                                                ),
                                              ],
                                            )
                                                : q["status"] == "Shipped"
                                                ? Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              crossAxisAlignment:
                                              CrossAxisAlignment
                                                  .start,
                                              children: [
                                                Text(
                                                  "Order Confirmed ${q["orderedOn"]}",
                                                  style: const TextStyle(
                                                      fontWeight:
                                                      FontWeight
                                                          .w500),
                                                ),
                                                Text(
                                                  "Shipped ${q["shippingDate"]}",
                                                  style: const TextStyle(
                                                      fontWeight:
                                                      FontWeight
                                                          .w500),
                                                ),
                                                Text(
                                                  "Delivered ${q["deliveryOn"]}",
                                                  style: const TextStyle(
                                                      fontWeight:
                                                      FontWeight
                                                          .w500,
                                                      color: Colors
                                                          .white),
                                                ),
                                              ],
                                            )
                                                : Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              crossAxisAlignment:
                                              CrossAxisAlignment
                                                  .start,
                                              children: [
                                                Text(
                                                  "Order Confirmed ${q["orderedOn"]}",
                                                  style: const TextStyle(
                                                      fontWeight:
                                                      FontWeight
                                                          .w500),
                                                ),
                                                Text(
                                                  "Shipped ${q["shippingDate"]}",
                                                  style: const TextStyle(
                                                      fontWeight:
                                                      FontWeight
                                                          .w500),
                                                ),
                                                Text(
                                                  "Delivered ${q["deliveryOn"]}",
                                                  style: const TextStyle(
                                                      fontWeight:
                                                      FontWeight
                                                          .w500),
                                                ),
                                              ],
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Shipping Details:",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      Text(q["name"]),
                                      Text(q["address"]),
                                    ],
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Text(
                                    "Cancellation not available",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 17),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const Divider(color: Colors.black),
                      ],
                    );
                    ordersWidget.add(orderWidget);
                  }
                }
                return ListView(
                  children: ordersWidget,
                );
              }),
        ),
      ):
      SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("You Have No Orders", style: TextStyle(color: Colors.white70, fontSize: 16, fontWeight: FontWeight.w500),),
            const Text(""),
            Image.asset("images/sad.webp",height: 150,),
          ],
        ),
      ),
    );
  }
}

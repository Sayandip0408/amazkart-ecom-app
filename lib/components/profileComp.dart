import 'dart:async';

import 'package:amazkart/screens/faqs.dart';
import 'package:amazkart/screens/help.dart';
import 'package:amazkart/screens/onboardingScreen.dart';
import 'package:amazkart/screens/ordersScreen.dart';
import 'package:amazkart/screens/wishlist.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileComp extends StatefulWidget {
  const ProfileComp({super.key});

  @override
  State<ProfileComp> createState() => _ProfileCompState();
}

class _ProfileCompState extends State<ProfileComp> {
  final _auth = FirebaseAuth.instance;
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = TextEditingController();

  CollectionReference userDB =
      FirebaseFirestore.instance.collection('ecom_users');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: false,
        title: Text(
          "AmazKart",
          style: GoogleFonts.sairaExtraCondensed(
              fontSize: 35, color: Colors.white, fontWeight: FontWeight.w400),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: InkWell(
              splashColor: Colors.black54,
              onTap: () async {
                try {
                  await _auth.signOut().then((value) =>
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const OnBoardingScreen())));
                } catch (e) {
                  debugPrint(e.toString());
                }
              },
              borderRadius: BorderRadius.circular(50),
              child: Ink(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.black,
                  border: Border.all(color: Colors.red, width: 0.7),
                ),
                child: const Icon(
                  FluentIcons.sign_out_20_filled,
                  color: Colors.red,
                  size: 17,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(3),
                      child: InkWell(
                        splashColor: const Color.fromRGBO(35, 35, 34, 1),
                        onTap: () {
                          Timer(
                              const Duration(milliseconds: 250),
                              () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const OrdersScreen())));
                        },
                        borderRadius: BorderRadius.circular(5),
                        child: Ink(
                          height: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                color: const Color.fromRGBO(35, 35, 34, 1),
                                width: 1),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("  "),
                              Icon(
                                FluentIcons.box_20_regular,
                                color: Colors.blue,
                              ),
                              Text(
                                "  Orders",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(3),
                      child: InkWell(
                        splashColor: const Color.fromRGBO(35, 35, 34, 1),
                        onTap: () {
                          Timer(
                              const Duration(milliseconds: 250),
                              () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Wishlist())));
                        },
                        borderRadius: BorderRadius.circular(5),
                        child: Ink(
                          height: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                color: const Color.fromRGBO(35, 35, 34, 1),
                                width: 1),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("  "),
                              Icon(
                                CupertinoIcons.bag,
                                color: Colors.blue,
                              ),
                              Text(
                                "  Wishlist",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(3),
                      child: InkWell(
                        splashColor: const Color.fromRGBO(35, 35, 34, 1),
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: Colors.white,
                                content: Text("No Coupons available.", style: TextStyle(color: Colors.black),)
                            )
                          );
                        },
                        borderRadius: BorderRadius.circular(5),
                        child: Ink(
                          height: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                color: const Color.fromRGBO(35, 35, 34, 1),
                                width: 1),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("  "),
                              Icon(
                                FluentIcons.gift_20_regular,
                                color: Colors.blue,
                              ),
                              Text(
                                "  Coupons",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(3),
                      child: InkWell(
                        splashColor: const Color.fromRGBO(35, 35, 34, 1),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> const Help()));
                        },
                        borderRadius: BorderRadius.circular(5),
                        child: Ink(
                          height: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                color: const Color.fromRGBO(35, 35, 34, 1),
                                width: 1),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("  "),
                              Icon(
                                FluentIcons.person_support_20_regular,
                                color: Colors.blue,
                              ),
                              Text(
                                " Help Center",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(
                color: Color.fromRGBO(35, 35, 34, 1),
                thickness: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(2),
                child: Text(
                  "Try AmazKart in your language",
                  style: GoogleFonts.nunitoSans(
                    textStyle: const TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.w700,
                        fontSize: 20),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: Container(
                        height: 35,
                        width: 80,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(48, 1, 141, 253),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.blue),
                        ),
                        child: const Center(
                            child: Text(
                          "English",
                          style: TextStyle(color: Colors.blue),
                        )),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                                backgroundColor: Colors.white,
                                content: Text(
                                  "जल्द ही उपलब्ध होगा।",
                                  style: TextStyle(color: Colors.black),
                                )));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(2),
                        child: Container(
                          height: 35,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: const Color.fromRGBO(35, 35, 34, 1)),
                          ),
                          child: const Center(
                              child: Text(
                            "हिंदी",
                            style: TextStyle(color: Colors.white70),
                          )),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                                backgroundColor: Colors.white,
                                content: Text(
                                  "শীঘ্রই পাওয়া যাবে",
                                  style: TextStyle(color: Colors.black),
                                )));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(2),
                        child: Container(
                          height: 35,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: const Color.fromRGBO(35, 35, 34, 1)),
                          ),
                          child: const Center(
                              child: Text(
                            "বাংলা",
                            style: TextStyle(color: Colors.white70),
                          )),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                                backgroundColor: Colors.white,
                                content: Text(
                                  "விரைவில் கிடைக்கும்.",
                                  style: TextStyle(color: Colors.black),
                                )));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(2),
                        child: Container(
                          height: 35,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: const Color.fromRGBO(35, 35, 34, 1)),
                          ),
                          child: const Center(
                              child: Text(
                            "தமிழ்",
                            style: TextStyle(color: Colors.white70),
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                color: Color.fromRGBO(35, 35, 34, 1),
                thickness: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: InkWell(
                  splashColor: Colors.grey,
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const FAQs()));
                  },
                  borderRadius: BorderRadius.circular(10),
                  child: Ink(
                    height: 40,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromRGBO(35, 35, 34, 1),
                    ),
                    child: const Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Icon(FluentIcons.question_circle_20_regular, color: Colors.blue,)
                        ),
                        Expanded(
                            flex: 3,
                            child: Text("Browse FAQs", style: TextStyle(color: Colors.white70),)
                        ),
                        Expanded(
                            flex: 1,
                            child: Icon(FluentIcons.chevron_right_20_filled, color: Colors.blue,)
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(2),
                child: Text(
                  "Account Details",
                  style: GoogleFonts.nunitoSans(
                    textStyle: const TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.w700,
                        fontSize: 20),
                  ),
                ),
              ),
              Container(
                height: 350,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection("ecom_users")
                        .where("u_ID", isEqualTo: _auth.currentUser?.uid)
                        .snapshots(),
                    builder: (context, snapshot) {
                      List<Column> usersWidget = [];
                      if (snapshot.hasData) {
                        final usersdb = snapshot.data?.docs.reversed.toList();
                        for (var q in usersdb!) {
                          nameController.text = q["name"];
                          addressController.text = q["address"];
                          phoneController.text = q["phone"];
                          final userWidget = Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  children: [
                                    const Expanded(
                                        flex: 1,
                                        child: Text(
                                          "Name",
                                          style: TextStyle(
                                              color: Colors.white70,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        )),
                                    Expanded(
                                      flex: 3,
                                      child: TextField(
                                        controller: nameController,
                                        cursorColor: Colors.white,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16),
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.white70,
                                                width: 1),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.white, width: 1),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  children: [
                                    const Expanded(
                                        flex: 1,
                                        child: Text(
                                          "Email",
                                          style: TextStyle(
                                              color: Colors.white70,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        )),
                                    Expanded(
                                      flex: 3,
                                      child: Text(": ${q["email"]}", style: const TextStyle(fontSize: 16, color: Colors.white70),),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  children: [
                                    const Expanded(
                                        flex: 1,
                                        child: Text(
                                          "Address",
                                          style: TextStyle(
                                              color: Colors.white70,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        )),
                                    Expanded(
                                      flex: 3,
                                      child: TextField(
                                        controller: addressController,
                                        cursorColor: Colors.white,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16),
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.white70,
                                                width: 1),
                                            borderRadius:
                                            BorderRadius.circular(15),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.white, width: 1),
                                            borderRadius:
                                            BorderRadius.circular(15),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  children: [
                                    const Expanded(
                                        flex: 1,
                                        child: Text(
                                          "Phone",
                                          style: TextStyle(
                                              color: Colors.white70,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        )),
                                    Expanded(
                                      flex: 3,
                                      child: TextField(
                                        controller: phoneController,
                                        cursorColor: Colors.white,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16),
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.white70,
                                                width: 1),
                                            borderRadius:
                                            BorderRadius.circular(15),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.white, width: 1),
                                            borderRadius:
                                            BorderRadius.circular(15),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: InkWell(
                                  onTap: (){
                                    var col = FirebaseFirestore.instance.collection("ecom_users");
                                    col.doc(q["userID"]).update({
                                      "name" : nameController.text,
                                      "phone" : phoneController.text,
                                      "address" : addressController.text,
                                    })
                                        .then((_) => debugPrint("Success"))
                                        .catchError((error)=> debugPrint(error.toString()));
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        backgroundColor: Colors.white,
                                          content: Text("Profile Updated", style: TextStyle(color: Colors.black),)
                                      )
                                    );
                                  },
                                  splashColor: CupertinoColors.systemGreen,
                                  borderRadius: BorderRadius.circular(10),
                                  child: Ink(
                                    height: 40,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.green,
                                    ),
                                    child: const Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("Update Profile ", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                                        Icon(FluentIcons.edit_settings_20_filled)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                          usersWidget.add(userWidget);
                        }
                      }
                      return ListView(
                        children: usersWidget,
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

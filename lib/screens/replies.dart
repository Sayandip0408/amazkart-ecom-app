import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Replies extends StatelessWidget{
  const Replies({super.key});

  @override
  Widget build(BuildContext context) {
    final _auth = FirebaseAuth.instance.currentUser;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Replies ",
              style: TextStyle(color: Colors.white),
            ),
            Icon(
              FluentIcons.chat_20_filled,
              color: Colors.blue,
            )
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        leading: GestureDetector(
          child: const Icon(
            FluentIcons.chevron_left_20_regular,
            color: Colors.red,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection("ecom_help").where("user_id", isEqualTo: _auth?.uid).snapshots(),
              builder: (context, snapshot){
                List<Column> helpsWidget = [];
                if(snapshot.hasData){
                  final helpDB = snapshot.data?.docs.reversed.toList();
                  for(var q in helpDB!){
                    final helpWidget = Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5, bottom: 0, left: 5, right: 5),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(35, 35, 34, 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Subject : ${q["sub"]}", style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 16),),
                                  Text("Description : ${q["desc"]}", style: const TextStyle(color: Colors.white70, fontWeight: FontWeight.w500, fontSize: 15),),
                                  q["reply"] == "no reply yet" ?
                                  Text("Reply : ${q["reply"]}", style: const TextStyle(color: Colors.red, fontWeight: FontWeight.w500, fontSize: 15),):
                                  Text("Reply : ${q["reply"]}", style: const TextStyle(color: Colors.green, fontWeight: FontWeight.w500, fontSize: 15),),
                                ],
                              )
                            ),
                          ),
                        ),
                        const Divider(color: Colors.black,),
                      ],
                    );
                    helpsWidget.add(helpWidget);
                  }
                }
                return ListView(
                  children: helpsWidget,
                );
              },
            ),
          ),
        ),
      ),
    );
  }

}
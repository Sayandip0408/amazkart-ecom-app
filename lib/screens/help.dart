import 'package:amazkart/screens/replies.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class Help extends StatelessWidget {
  const Help({super.key});

  @override
  Widget build(BuildContext context) {
    final headingController = TextEditingController();
    final issueController = TextEditingController();
    final _auth = FirebaseAuth.instance;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Help Center ",
              style: TextStyle(color: Colors.white),
            ),
            Icon(
              FluentIcons.question_circle_20_filled,
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
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const Replies()));
                  },
                  splashColor: Colors.black54,
                  borderRadius: BorderRadius.circular(10),
                  child: Ink(
                    height: 45,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromRGBO(35, 35, 34, 1),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("See Responses ", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500),),
                        Icon(FluentIcons.chat_20_filled, color: Colors.green,)
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50,
                          child: TextField(
                            controller: headingController,
                            cursorColor: Colors.white70,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: const Color.fromRGBO(35, 35, 34, 1),
                              prefixIcon: const Icon(FluentIcons.document_header_20_regular, color: Colors.white70,),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(color: Colors.grey, width: 1),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(color: Colors.white, width: 1),
                              ),
                              label: const Text("Subjet", style: TextStyle(color: Colors.white70),)
                            ),
                          ),
                        ),
                        const Text(""),
                        SizedBox(
                          height: 400,
                          child: TextField(
                            controller: issueController,
                            cursorColor: Colors.white70,
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            expands: true,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              filled: true,
                                fillColor: const Color.fromRGBO(35, 35, 34, 1),
                                prefixIcon: const Icon(FluentIcons.document_20_regular, color: Colors.white70,),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(color: Colors.grey, width: 1),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(color: Colors.white, width: 1),
                                ),
                                label: const Text("Desc", style: TextStyle(color: Colors.white70),)
                            ),
                          ),
                        ),
                        const Text(""),
                        InkWell(
                          onTap: (){
                            try{
                              var col = FirebaseFirestore.instance.collection("ecom_help");
                              col.add({
                                "sub" : headingController.text,
                                "desc" : issueController.text,
                                "user_id" : _auth.currentUser?.uid,
                                "reply" : "no reply yet"
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      backgroundColor: Colors.white,
                                      content: Text("Message Sent", style: TextStyle(color: Colors.black),)
                                  )
                              );
                              headingController.text = "";
                              issueController.text = "";
                            }catch(e){

                            }
                          },
                          splashColor: Colors.grey,
                          borderRadius: BorderRadius.circular(10),
                          child: Ink(
                            height: 45,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.green
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Send Message ", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),),
                                Icon(FluentIcons.send_20_regular),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

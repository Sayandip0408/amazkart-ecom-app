import 'package:amazkart/screens/loginScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatefulWidget{
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final nameController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text("Register", style: GoogleFonts.openSans(
            textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600)
        ),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("images/register.png", height: 150,),
            Container(
              height: 300,
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Name", style: GoogleFonts.openSans(
                      fontWeight: FontWeight.w600
                  ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: TextField(
                        keyboardType: TextInputType.text,
                        controller: nameController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black38, width: 1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black, width: 1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          prefixIcon: const Icon(FluentIcons.person_20_regular, color: Colors.black,),
                        ),
                      ),
                    ),
                  ),
                  Text("Email", style: GoogleFonts.openSans(
                      fontWeight: FontWeight.w600
                  ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black38, width: 1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black, width: 1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          prefixIcon: const Icon(FluentIcons.mail_20_regular, color: Colors.black,),
                        ),
                      ),
                    ),
                  ),
                  Text("Password", style: GoogleFonts.openSans(
                      fontWeight: FontWeight.w600
                  ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: TextField(
                        keyboardType: TextInputType.text,
                        controller: passController,
                        obscureText: true,
                        obscuringCharacter: "*",
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black38, width: 1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black, width: 1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          prefixIcon: const Icon(FluentIcons.password_20_regular, color: Colors.black,),
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
                splashColor: Colors.black38,
                onTap: () async{
                  try{
                    UserCredential res = await _auth.createUserWithEmailAndPassword(email: emailController.text, password: passController.text);
                    User? user = res.user;
                    String tempID = "";
                    await FirebaseFirestore.instance.collection("ecom_users").add({
                      "name" : nameController.text,
                      "email" : emailController.text,
                      "userID" : "",
                      "u_ID" : user?.uid,
                      "address" : "",
                      "phone" : "",
                    }).then((DocumentReference doc){
                      tempID = doc.id;
                    });
                    var col = FirebaseFirestore.instance.collection("ecom_users");
                    col.doc(tempID).update({"userID" : tempID})
                        .then((_) => debugPrint("Success"))
                        .catchError((error)=> debugPrint(error.toString()));
                    var alertCol = FirebaseFirestore.instance.collection("alerts");
                    alertCol.add({
                      "content" : "Welcome to AmazKart. Hope you will find your desired smartphone in a affordable price.",
                      "userID" : res.user?.uid,
                      "createdAt" : DateTime.now().millisecondsSinceEpoch,
                    })
                        .then((_) => debugPrint("Success"))
                        .catchError((error)=> debugPrint(error.toString()));
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const LoginScreen()));
                  }catch(e){
                    debugPrint(e.toString());
                    e.toString() == "[firebase_auth/invalid-email] The email address is badly formatted." ?
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("The email address is badly formatted."))
                    ):
                    e.toString() == "[firebase_auth/email-already-in-use] The email address is already in use by another account." ?
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("The email address is already in use by another account."))
                    ):
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Unable to register"))
                    );
                  }
                },
                borderRadius: BorderRadius.circular(10),
                child: Ink(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Register  ", style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 16
                      ),
                      ),
                      Icon(FluentIcons.arrow_circle_right_16_filled, color: Colors.white,)
                    ],
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?", style: GoogleFonts.openSans(
                    fontWeight: FontWeight.w500
                ),
                ),
                TextButton(
                    onPressed: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const LoginScreen()));
                    },
                    child: Text("Login", style: GoogleFonts.openSans(
                        fontWeight: FontWeight.w700,
                        color: Colors.black
                    ),
                    )
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
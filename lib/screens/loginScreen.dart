import 'package:amazkart/screens/homeScreen.dart';
import 'package:amazkart/screens/registerScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget{
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text("Login", style: GoogleFonts.openSans(
            textStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.w600)
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
            Image.asset("images/login.png", height: 150,),
            Text("Access Account", style: GoogleFonts.openSans(
                fontWeight: FontWeight.w600,
                color: Colors.black54
              ),
            ),
            Container(
              height: 200,
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                    await _auth.signInWithEmailAndPassword(
                        email: emailController.text,
                        password: passController.text
                    );
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const HomeScreen()));
                  }catch(e){
                    final snackBar = SnackBar(
                            content: Text(e.toString()),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
                      Text("Sign In  ", style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 16
                        ),
                      ),
                      Icon(FluentIcons.chevron_circle_right_16_filled, color: Colors.white,)
                    ],
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?", style: GoogleFonts.openSans(
                    fontWeight: FontWeight.w500
                  ),
                ),
                TextButton(
                    onPressed: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const RegisterScreen()));
                    },
                    child: Text("Register", style: GoogleFonts.openSans(
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
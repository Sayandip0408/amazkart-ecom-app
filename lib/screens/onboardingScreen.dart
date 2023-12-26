import 'package:amazkart/screens/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingScreen extends StatelessWidget{
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("AmazKart",
                style: GoogleFonts.raleway(
                  textStyle: const TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                )
            ),
            InkWell(
              splashColor: const Color(0xFF2C5364),
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const LoginScreen()));
              },
              borderRadius: BorderRadius.circular(50),
              child: Ink(
                height: 30,
                width: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: Colors.white, width: 1),
                    color: Colors.black
                ),
                child: Center(
                  child: Text("NEXT",
                    style: GoogleFonts.inter(
                        textStyle: const TextStyle(fontSize: 13),
                        color: Colors.white
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset("images/splash.gif", height: 250,),
            Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text("BRING", style: GoogleFonts.martel(
                      textStyle: const TextStyle(fontSize: 45, fontWeight: FontWeight.w700, color: Colors.black),
                    )),
                    Text("All YOUR", style: GoogleFonts.zeyada(
                      textStyle: const TextStyle(fontSize: 64, fontWeight: FontWeight.w900, color: Colors.black),
                    )),
                    Text("SMARTPHONE", style: GoogleFonts.martel(
                      textStyle: const TextStyle(fontSize: 45, fontWeight: FontWeight.w700, color: Colors.black),
                    )),
                    Text("DESIRE", style: GoogleFonts.zeyada(
                      textStyle: const TextStyle(fontSize: 64, fontWeight: FontWeight.w900, color: Colors.black),
                    )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
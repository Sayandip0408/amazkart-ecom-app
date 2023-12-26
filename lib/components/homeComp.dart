import 'dart:async';

import 'package:amazkart/screens/phoneDetails.dart';
import 'package:amazkart/screens/searchResult.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/categoricalPhones.dart';
import '../screens/wishlist.dart';

class HomeComp extends StatelessWidget{
  const HomeComp({super.key});

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 5, left: 10),
                    child: SizedBox(
                      height: 55,
                      child: TextField(
                        cursorColor: Colors.white54,
                        style: const TextStyle(color: Colors.white70),
                        keyboardType: TextInputType.text,
                        textCapitalization: TextCapitalization.words,
                        controller: searchController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color.fromRGBO(35, 35, 34, 1),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black38, width: 1),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black, width: 1),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          hintText: "Search by model name only",
                          hintStyle: const TextStyle(color: Colors.white54, fontSize: 14),
                          prefixIcon: const Icon(FluentIcons.phone_20_regular, color: Colors.white70,),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: InkWell(
                    splashColor: Colors.black38,
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> SearchResult(val: searchController.text)));
                    },
                    borderRadius: BorderRadius.circular(50),
                    child: Ink(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: const Color.fromRGBO(35, 35, 34, 1),
                      ),
                      child: const Icon(FluentIcons.search_20_regular, color: Colors.white70,),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: CarouselSlider(
                  items: [
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                const CategoricalPhones(brand: "Samsung")));
                      },
                      child: Container(
                        margin: const EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: const DecorationImage(
                            image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/note-app-flutter-a31ee.appspot.com/o/productImages%2Fs23ultrabanner.webp?alt=media&token=f53336d2-64a9-402b-8617-e4b35b0df769"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                const CategoricalPhones(brand: "Xiaomi")));
                      },
                      child: Container(
                        margin: const EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: const DecorationImage(
                            image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/note-app-flutter-a31ee.appspot.com/o/productImages%2Fxiaomibanner.jpg?alt=media&token=6406a428-d458-4952-a128-aaf438439648"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                const CategoricalPhones(brand: "Google")));
                      },
                      child: Container(
                        margin: const EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: const DecorationImage(
                            image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/note-app-flutter-a31ee.appspot.com/o/productImages%2Fpixel8probanner.webp?alt=media&token=72945b67-c88c-48db-9492-a978d0c13022"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                  options: CarouselOptions(
                    height: 140.0,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: const Duration(milliseconds: 500),
                    viewportFraction: 1,
                  ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: InkWell(
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                  const PhoneDetails(productID: "gBz8AsSK6oVb5mqdYbCR", name: "MI 13 Pro",)));
                        },
                        splashColor: const Color.fromRGBO(255, 255, 255, 0.5),
                        borderRadius: BorderRadius.circular(10),
                        child: Ink(
                            height: 250,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Column(
                              children: [
                                Ink(
                                  height: 200,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/note-app-flutter-a31ee.appspot.com/o/productImages%2FMi-13-Pro-2%20(1).jpg?alt=media&token=ec0ef51e-f7a8-462a-8528-5bd53bd713b1"),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(right: 5, left: 5),
                                  child: Text("Xiaomi MI 13 Pro (Leica Camera)", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),),
                                ),
                              ],
                            )
                        )
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: InkWell(
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                  const PhoneDetails(productID: "aKQJWFIwNNIOJFTBHxG1", name: "Galaxy S21 FE 5G",)));
                        },
                        splashColor: const Color.fromRGBO(255, 255, 255, 0.5),
                        borderRadius: BorderRadius.circular(10),
                        child: Ink(
                          height: 250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              Ink(
                                height: 200,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/note-app-flutter-a31ee.appspot.com/o/productImages%2Fs21fe2.webp?alt=media&token=08d69031-f1ef-4063-af6d-428fd2cd36a3"),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(right: 5, left: 5),
                                child: Text("Samsung Galaxy S21 FE 5G", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),),
                              ),
                            ],
                          )
                        )
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Image.network("https://firebasestorage.googleapis.com/v0/b/note-app-flutter-a31ee.appspot.com/o/productImages%2Fbanner.webp?alt=media&token=4abd6912-0055-4835-91ca-b5413a8d8ca3"),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                        const CategoricalPhones(brand: "Apple")));
              },
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network("https://firebasestorage.googleapis.com/v0/b/note-app-flutter-a31ee.appspot.com/o/productImages%2Fiphonebanner.jpg?alt=media&token=cb1c9dc6-ff51-46b9-bc74-d6598e935275")
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Image.network("https://firebasestorage.googleapis.com/v0/b/note-app-flutter-a31ee.appspot.com/o/productImages%2Fbanner2.webp?alt=media&token=119c6535-ed46-4a24-9422-13098d9204e6"),
            ),
          ],
        ),
      ),
    );
  }

}
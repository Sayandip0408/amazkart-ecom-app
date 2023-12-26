import 'dart:async';

import 'package:amazkart/screens/allPhones.dart';
import 'package:amazkart/screens/categoricalPhones.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/wishlist.dart';

class CategoryComp extends StatefulWidget {
  const CategoryComp({super.key});

  @override
  State<CategoryComp> createState() => _CategoryCompState();
}

class _CategoryCompState extends State<CategoryComp> {
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
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
              onTap: () {
                Timer(
                    const Duration(milliseconds: 250),
                    () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Wishlist())));
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
                child: const Icon(
                  CupertinoIcons.bag,
                  color: Colors.white,
                  size: 17,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: CupertinoListSection.insetGrouped(
          backgroundColor: Colors.black,
          header: const Text(
            "Categories",
            style: TextStyle(color: Colors.white70),
          ),
          children: <CupertinoListTile>[
            CupertinoListTile.notched(
              backgroundColor: const Color.fromRGBO(35, 35, 34, 1),
              title: const Text(
                "All Brands",
                style: TextStyle(color: Colors.white70),
              ),
              leading: const Icon(
                FluentIcons.fire_20_regular,
                color: Colors.white,
              ),
              trailing: const CupertinoListTileChevron(),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const AllPhones()));
              },
            ),
            CupertinoListTile.notched(
              backgroundColor: const Color.fromRGBO(35, 35, 34, 1),
              title: const Text(
                "Samsung",
                style: TextStyle(color: Colors.white70),
              ),
              leading: const Icon(
                FluentIcons.phone_20_regular,
                color: Colors.white,
              ),
              trailing: const CupertinoListTileChevron(),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const CategoricalPhones(brand: "Samsung")));
              },
            ),
            CupertinoListTile.notched(
              backgroundColor: const Color.fromRGBO(35, 35, 34, 1),
              title: const Text(
                "Apple",
                style: TextStyle(color: Colors.white70),
              ),
              leading: const Icon(
                FluentIcons.phone_20_regular,
                color: Colors.white,
              ),
              trailing: const CupertinoListTileChevron(),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const CategoricalPhones(brand: "Apple")));
              },
            ),
            CupertinoListTile.notched(
              backgroundColor: const Color.fromRGBO(35, 35, 34, 1),
              title: const Text(
                "Google",
                style: TextStyle(color: Colors.white70),
              ),
              leading: const Icon(
                FluentIcons.phone_20_regular,
                color: Colors.white,
              ),
              trailing: const CupertinoListTileChevron(),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const CategoricalPhones(brand: "Google")));
              },
            ),
            CupertinoListTile.notched(
              backgroundColor: const Color.fromRGBO(35, 35, 34, 1),
              title: const Text(
                "Xiaomi",
                style: TextStyle(color: Colors.white70),
              ),
              leading: const Icon(
                FluentIcons.phone_20_regular,
                color: Colors.white,
              ),
              trailing: const CupertinoListTileChevron(),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const CategoricalPhones(brand: "Xiaomi")));
              },
            ),
            CupertinoListTile.notched(
              backgroundColor: const Color.fromRGBO(35, 35, 34, 1),
              title: const Text(
                "Oppo",
                style: TextStyle(color: Colors.white70),
              ),
              leading: const Icon(
                FluentIcons.phone_20_regular,
                color: Colors.white,
              ),
              trailing: const CupertinoListTileChevron(),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const CategoricalPhones(brand: "Oppo")));
              },
            ),
            CupertinoListTile.notched(
              backgroundColor: const Color.fromRGBO(35, 35, 34, 1),
              title: const Text(
                "Vivo",
                style: TextStyle(color: Colors.white70),
              ),
              leading: const Icon(
                FluentIcons.phone_20_regular,
                color: Colors.white,
              ),
              trailing: const CupertinoListTileChevron(),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const CategoricalPhones(brand: "Vivo")));
              },
            ),
          ],
        ),
      ),
    );
  }
}

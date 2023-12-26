import 'dart:async';

import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _url = Uri.parse('https://portfolio-adhikarysayandip-gmailcom.vercel.app/');

class FAQs extends StatelessWidget{
  const FAQs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "FAQs ",
              style: TextStyle(color: Colors.white),
            ),
            Icon(
              FluentIcons.shield_question_16_filled,
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
        actions: [
          TextButton(
              onPressed: (){
                Timer(const Duration(milliseconds: 300), () {
                  _launchUrl();
                });
              },
              child: const Icon(FluentIcons.person_accounts_20_filled, color: Colors.red,)
          )
        ],
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Accordion(
            // headerBorderColor: Colors.blueGrey,
            // headerBorderColorOpened: Colors.black54,
            // headerBorderWidth: 1,
            headerBackgroundColorOpened: const Color.fromRGBO(35, 35, 34, 1),
            headerBackgroundColor: const Color.fromRGBO(35, 35, 34, 1),
            contentBackgroundColor: Colors.white,
            contentBorderColor: const Color.fromRGBO(35, 35, 34, 1),
            contentBorderWidth: 3,
            contentHorizontalPadding: 20,
            scaleWhenAnimating: true,
            openAndCloseAnimation: true,
            headerPadding:
            const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
            sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
            sectionClosingHapticFeedback: SectionHapticFeedback.light,
            children: [
              AccordionSection(
                isOpen: true,
                contentVerticalPadding: 20,
                leftIcon:
                const Icon(FluentIcons.box_20_filled, color: Colors.red),
                header: const Text('Order limits', style: TextStyle(
                    color: Color(0xffffffff), fontSize: 18, fontWeight: FontWeight.bold)),
                content: const Text("One user can place only one (1) order at a time. However he/she can order another product after placing an order.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        color: Colors.black87, fontSize: 15, fontWeight: FontWeight.w500
                    )
                ),
              ),
              AccordionSection(
                isOpen: true,
                contentVerticalPadding: 20,
                leftIcon:
                const Icon(FluentIcons.vehicle_truck_20_filled, color: Colors.red),
                header: const Text('Delivery time', style: TextStyle(
                    color: Color(0xffffffff), fontSize: 18, fontWeight: FontWeight.bold)),
                content: const Text("It usually takes 2-3 days to deliver a product.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        color: Colors.black87, fontSize: 15, fontWeight: FontWeight.w500
                    )
                ),
              ),
              AccordionSection(
                isOpen: true,
                contentVerticalPadding: 20,
                leftIcon:
                const Icon(FluentIcons.vehicle_truck_20_filled, color: Colors.red),
                header: const Text('Terms & Conditions', style: TextStyle(
                    color: Color(0xffffffff), fontSize: 18, fontWeight: FontWeight.bold)),
                content: const Text("No Terms and Conditions for this application because this is not an actual shopping app. This app is only for showcase.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        color: Colors.black87, fontSize: 15, fontWeight: FontWeight.w500
                    )
                ),
              ),
              AccordionSection(
                isOpen: true,
                contentVerticalPadding: 20,
                leftIcon:
                const Icon(FluentIcons.code_20_filled, color: Colors.red),
                header: const Text('Who is the developer?', style: TextStyle(
                    color: Color(0xffffffff), fontSize: 18, fontWeight: FontWeight.bold)),
                content: const Text("Sayandip Adhikary is the one and only developer of AmazKart E-Commerce Application.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.black87, fontSize: 15, fontWeight: FontWeight.w500
                    )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
import 'package:amazkart/screens/orderSuccess.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen(
      {super.key,
      required this.productID,
      required this.color,
      required this.storage,
      required this.price,
      required this.image,
      required this.prodName,
      required this.name,
      required this.phone,
      required this.line1,
      required this.line2,
      required this.city,
      required this.dist,
      required this.state,
      required this.zip,
      required this.landmark,
      required this.msg});
  final productID,
      color,
      storage,
      price,
      image,
      prodName,
      name,
      phone,
      line1,
      line2,
      city,
      dist,
      state,
      zip,
      landmark,
      msg;

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String paymentOption = "";
  Icon selectedCODIcon = const Icon(
    FluentIcons.circle_20_regular,
    color: Colors.white,
  );
  Icon selectedCardIcon = const Icon(
    FluentIcons.circle_20_regular,
    color: Colors.white,
  );
  final cardNoController = TextEditingController();
  final monthController = TextEditingController();
  final yearController = TextEditingController();
  final cvvController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Payment",
          style: TextStyle(color: Colors.white),
        ),
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SizedBox(
          height: 800,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.82,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.73,
                            child: const Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Divider(
                                    color: Colors.green,
                                    thickness: 1,
                                  ),
                                ),
                                Text("  "),
                                Expanded(
                                  flex: 1,
                                  child: Divider(
                                    color: Colors.green,
                                    thickness: 1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                FluentIcons.checkmark_circle_20_filled,
                                color: Colors.green,
                                size: 24,
                              ),
                              Icon(
                                FluentIcons.checkmark_circle_20_filled,
                                color: Colors.green,
                                size: 24,
                              ),
                              Icon(
                                FluentIcons.payment_20_filled,
                                color: Colors.blue,
                                size: 24,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Summary",
                            style: TextStyle(color: Colors.white70),
                          ),
                          Text(
                            "Address",
                            style: TextStyle(
                              color: Colors.white70,
                            ),
                          ),
                          Text(
                            "Payment",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color.fromRGBO(35, 35, 34, 1),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        const Text(
                          "Choose a payment option",
                          style: TextStyle(color: Colors.white),
                        ),
                        ListTile(
                          title: const Text(
                            "Cash on Delivery",
                            style: TextStyle(color: Colors.white),
                          ),
                          onTap: () {
                            setState(() {
                              selectedCODIcon = const Icon(
                                FluentIcons.circle_20_filled,
                                color: Colors.blueAccent,
                              );
                              selectedCardIcon = const Icon(
                                FluentIcons.circle_20_regular,
                                color: Colors.white,
                              );
                              paymentOption = "cod";
                            });
                          },
                          leading: selectedCODIcon,
                        ),
                        ListTile(
                          title: const Text(
                            "Debit / Credit Card",
                            style: TextStyle(color: Colors.white),
                          ),
                          onTap: () {
                            setState(() {
                              selectedCardIcon = const Icon(
                                FluentIcons.circle_20_filled,
                                color: Colors.blueAccent,
                              );
                              selectedCODIcon = const Icon(
                                FluentIcons.circle_20_regular,
                                color: Colors.white,
                              );
                              paymentOption = "card";
                            });
                          },
                          leading: selectedCardIcon,
                        ),
                      ],
                    ),
                  ),
                ),
                paymentOption == "cod"
                    ? Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color.fromRGBO(35, 35, 34, 1),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              "You will have to pay \u{20B9}${widget.price} to the delivery person via cash.",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      )
                    : paymentOption == "card"
                        ? Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: const Color.fromRGBO(35, 35, 34, 1),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 15,
                                        bottom: 5,
                                        right: 10,
                                        left: 10),
                                    child: TextField(
                                      keyboardType: TextInputType.number,
                                      cursorColor: Colors.white70,
                                      controller: cardNoController,
                                      style:
                                          const TextStyle(color: Colors.white),
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
                                          label: const Text(
                                            "Card Number",
                                            style: TextStyle(
                                                color: Colors.white70),
                                          ),
                                          hintText: "XXXX-XXXX-XXXX-XXXX",
                                          hintStyle: const TextStyle(
                                              color: Colors.white70),
                                          prefixIcon: const Icon(
                                            FluentIcons.card_ui_20_filled,
                                            color: Colors.yellow,
                                          )),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 5, bottom: 5, right: 10, left: 10),
                                    child: TextField(
                                      keyboardType: TextInputType.number,
                                      controller: monthController,
                                      style:
                                          const TextStyle(color: Colors.white),
                                      cursorColor: Colors.white70,
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
                                          label: const Text(
                                            "Month",
                                            style: TextStyle(
                                                color: Colors.white70),
                                          ),
                                          hintText: "MM",
                                          hintStyle: const TextStyle(
                                              color: Colors.white70),
                                          prefixIcon: const Icon(
                                            FluentIcons
                                                .calendar_month_20_filled,
                                            color: Colors.yellow,
                                          )),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 5, bottom: 5, right: 10, left: 10),
                                    child: TextField(
                                      keyboardType: TextInputType.number,
                                      controller: yearController,
                                      style:
                                          const TextStyle(color: Colors.white),
                                      cursorColor: Colors.white70,
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
                                          label: const Text(
                                            "Year",
                                            style: TextStyle(
                                                color: Colors.white70),
                                          ),
                                          hintText: "YY",
                                          hintStyle: const TextStyle(
                                              color: Colors.white70),
                                          prefixIcon: const Icon(
                                            FluentIcons.calendar_day_20_filled,
                                            color: Colors.yellow,
                                          )),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 5, bottom: 5, right: 10, left: 10),
                                    child: TextField(
                                      keyboardType: TextInputType.number,
                                      controller: cvvController,
                                      style:
                                          const TextStyle(color: Colors.white),
                                      cursorColor: Colors.white70,
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
                                          label: const Text(
                                            "CVV",
                                            style: TextStyle(
                                                color: Colors.white70),
                                          ),
                                          hintText: "123",
                                          hintStyle: const TextStyle(
                                              color: Colors.white70),
                                          prefixIcon: const Icon(
                                            FluentIcons.power_20_filled,
                                            color: Colors.yellow,
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Text(
                            "None",
                            style: TextStyle(color: Colors.transparent),
                          ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        height: 60,
        child: InkWell(
          onTap: () async {
            if (paymentOption == "card") {
              int m = 0, y = 0;
              if (monthController.text != "" || yearController.text != "") {
                setState(() {
                  m = int.parse(monthController.text);
                  y = int.parse(yearController.text);
                });
                debugPrint("$m : $y");
              }
              if (cardNoController.text == "" ||
                  monthController.text == "" ||
                  yearController.text == "" ||
                  cvvController.text == "") {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: Colors.white,
                    content: Text(
                      'Please fill all the fields properly which are mandatory!',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                );
                return;
              } else if (cardNoController.text.length != 16) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: Colors.white,
                    content: Text(
                      'Card number must be 16 digits!',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                );
                return;
              } else if (m < 1 || m > 12) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: Colors.white,
                    content: Text(
                      'Enter a valid month!',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                );
                return;
              } else if (y < 24 || yearController.text.length > 2) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: Colors.white,
                    content: Text(
                      'Enter a valid year!',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                );
                return;
              } else if (cvvController.text.length != 3) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: Colors.white,
                    content: Text(
                      'Enter a valid cvv/cvc number!',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                );
                return;
              } else {
                String tempID = "";
                DateTime now = DateTime.now();
                debugPrint(
                    "at ${now.hour}:${now.minute} on ${now.day}-${now.month}-${now.year}");
                try {
                  await FirebaseFirestore.instance.collection("orders").add({
                    "productID": widget.productID,
                    "color": widget.color,
                    "storage": widget.storage,
                    "price": widget.price,
                    "image": widget.image,
                    "productName": widget.prodName,
                    "orderedBy": _auth.currentUser?.uid,
                    "orderedOn":
                        "at ${now.hour}:${now.minute} on ${now.day}-${now.month}-${now.year}",
                    "payment": "Paid",
                    "status": "Confirmed",
                    "name": widget.name,
                    "phone": widget.phone,
                    "address":
                        "${widget.line1}, ${widget.city}, ${widget.dist}, ${widget.state}, India, ${widget.zip}, ${widget.landmark}",
                    "deliveryOn": "${now.day + 2}-${now.month}-${now.year}",
                    "orderID": "",
                    "createdAt" : DateTime.now().millisecondsSinceEpoch,
                    "shippingDate" : "at ${now.hour}:${now.minute} on ${now.day + 1}-${now.month}-${now.year}",
                  }).then((DocumentReference doc) {
                    tempID = doc.id;
                  }).catchError((error) => debugPrint(error.toString()));
                  var col = FirebaseFirestore.instance.collection("orders");
                  col
                      .doc(tempID)
                      .update({"orderID": tempID})
                      .then((_) => debugPrint("Success"))
                      .catchError((error) => debugPrint(error.toString()));
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const OrderSuccess()));
                } catch (e) {
                  debugPrint(e.toString());
                }
              }
            } else {
              String tempID = "";
              DateTime now = DateTime.now();
              debugPrint(
                  "at ${now.hour}:${now.minute} on ${now.day}-${now.month}-${now.year}");
              try {
                await FirebaseFirestore.instance.collection("orders").add({
                  "productID": widget.productID,
                  "color": widget.color,
                  "storage": widget.storage,
                  "price": widget.price,
                  "image": widget.image,
                  "productName": widget.prodName,
                  "orderedBy": _auth.currentUser?.uid,
                  "orderedOn":
                      "at ${now.hour}:${now.minute} on ${now.day}-${now.month}-${now.year}",
                  "payment": "COD",
                  "status": "Confirmed",
                  "name": widget.name,
                  "phone": widget.phone,
                  "address":
                      "${widget.line1}, ${widget.city}, ${widget.dist}, ${widget.state}, India, ${widget.zip}, ${widget.landmark}",
                  "deliveryOn": "${now.day + 2}-${now.month}-${now.year}",
                  "orderID": "",
                  "createdAt" : DateTime.now().millisecondsSinceEpoch,
                  "shippingDate" : "at ${now.hour}:${now.minute} on ${now.day + 1}-${now.month}-${now.year}",
                }).then((DocumentReference doc) {
                  tempID = doc.id;
                }).catchError((error) => debugPrint(error.toString()));
                var col = FirebaseFirestore.instance.collection("orders");
                col
                    .doc(tempID)
                    .update({"orderID": tempID})
                    .then((_) => debugPrint("Success"))
                    .catchError((error) => debugPrint(error.toString()));
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> OrderSuccess()), (route) => false);
              } catch (e) {
                debugPrint(e.toString());
              }
            }
          },
          splashColor: Colors.deepOrange,
          borderRadius: BorderRadius.circular(5),
          child: Ink(
            height: 50,
            width: 150,
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Place Order  ",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                Icon(FluentIcons.arrow_right_16_regular)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

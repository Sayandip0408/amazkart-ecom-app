import 'package:amazkart/screens/addressScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderSummary extends StatefulWidget{
  const OrderSummary({super.key, required this.productID, required this.color, required this.storage, required this.price, required this.image, required this.prodName});
  final productID, color, storage, price, image, prodName;

  @override
  State<OrderSummary> createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {
  final List<int> steps = [1, 2, 3];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Order Summary", style: TextStyle(color: Colors.white),),
        centerTitle: true,
        leading: GestureDetector(
          child: const Icon(FluentIcons.chevron_left_20_regular, color: Colors.red,),
          onTap: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 800,
          width: double.infinity,
          child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection("products").where("productID", isEqualTo: widget.productID).snapshots(),
              builder: (context, snapshot){
                List<Column> ordersWidget = [];
                if(snapshot.hasData){
                  final ordersdb = snapshot.data?.docs.reversed.toList();
                  for(var q in ordersdb!){
                    String _id = q["productID"];
                    final orderWidget = Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                                            color: Color.fromRGBO(35, 35, 34, 1),
                                            thickness: 1,
                                          ),
                                        ),
                                        Text("  "),
                                        Expanded(
                                          flex: 1,
                                          child: Divider(
                                            color: Color.fromRGBO(35, 35, 34, 1),
                                            thickness: 1,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(FluentIcons.box_20_filled, color: Colors.blue, size: 24,),
                                      Icon(FluentIcons.location_20_filled, color: Colors.white70, size: 24,),
                                      Icon(FluentIcons.payment_20_filled, color: Colors.white70, size: 24,),
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
                                  Text("Summary", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),),
                                  Text("Address", style: TextStyle(color: Colors.white70),),
                                  Text("Payment", style: TextStyle(color: Colors.white70),),
                                ],
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.black38,
                          borderRadius: BorderRadius.circular(15),
                          onTap: (){},
                          child: Ink(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                        flex: 2,
                                        child: Container(
                                          height: 150,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                          ),
                                          child: Image.network(q["images"]),
                                        )
                                    ),
                                    Expanded(
                                        flex: 3,
                                        child: Padding(
                                          padding: const EdgeInsets.all(5),
                                          child: SizedBox(
                                            height: 140,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text(q["name"],
                                                  style: GoogleFonts.oswald(
                                                      textStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 22)
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Text("Color: ",
                                                      style: GoogleFonts.oswald(
                                                          textStyle: const TextStyle(fontWeight: FontWeight.w300)
                                                      ),
                                                    ),
                                                    Text(widget.color,
                                                      style: GoogleFonts.oswald(
                                                          textStyle: const TextStyle(fontWeight: FontWeight.w500)
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text("Storage: ",
                                                      style: GoogleFonts.oswald(
                                                          textStyle: const TextStyle(fontWeight: FontWeight.w300)
                                                      ),
                                                    ),
                                                    Text(widget.storage,
                                                      style: GoogleFonts.oswald(
                                                          textStyle: const TextStyle(fontWeight: FontWeight.w500)
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Text("${widget.price} Rs.",
                                                  style: GoogleFonts.oswald(
                                                      textStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20)
                                                  ),
                                                ),
                                                const Text("Free Delivery", style: TextStyle(fontWeight: FontWeight.w500),)
                                              ],
                                            ),
                                          ),
                                        )
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: const Color.fromRGBO(35, 35, 34, 1),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.only(top: 10, bottom: 10, right: 5, left: 5),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(FluentIcons.box_checkmark_20_filled, color: Colors.orange,),
                                      Text("Rest assured with Open Box Delivery",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 17
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Text("Delivery agent will open the package so you can check for correct product, damage or missing items. Share OTP to accept the delivery.",
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          color: Colors.white70,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: const Color.fromRGBO(35, 35, 34, 1),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10, bottom: 10, right: 5, left: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Text("Price Details",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text("Price (1 item)",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                          ),
                                        ),
                                        Text("\u{20B9}${widget.price}",
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Delivery Charges",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                          ),
                                        ),
                                        Text("Free Delivery",
                                          style: TextStyle(
                                            color: Colors.green,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Divider(color: Colors.grey,),
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text("Total Amount",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600
                                          ),
                                        ),
                                        Text("\u{20B9}${widget.price}",
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                    ordersWidget.add(orderWidget);
                  }
                }
                return ListView(
                  children: ordersWidget,
                );
              }
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("\u{20B9}${widget.price}", style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 20),),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> AddressScreen(productID: widget.productID.toString(), color: widget.color, storage: widget.storage, price: widget.price, image: widget.image, prodName: widget.prodName)));
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
                    Text("CONTINUE  ", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),),
                    Icon(FluentIcons.arrow_right_16_regular)
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
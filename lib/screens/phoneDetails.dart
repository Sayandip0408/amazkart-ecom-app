import 'package:amazkart/screens/orderSummary.dart';
import 'package:amazkart/screens/wishlist.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PhoneDetails extends StatefulWidget{
  const PhoneDetails({super.key, required this.productID, this.name});
  final productID, name;

  @override
  State<PhoneDetails> createState() => _PhoneDetailsState();
}

class _PhoneDetailsState extends State<PhoneDetails> {
  String storageVal = "256 GB";
  String colorVal = "Select";
  String priceVal = "0";
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(widget.name,
          style: GoogleFonts.sairaExtraCondensed(
            fontSize: 30,
            color: Colors.white,
            fontWeight: FontWeight.w400
          ),
        ),
        leading: GestureDetector(
          child: const Icon(FluentIcons.chevron_left_20_regular, color: Colors.red,),
          onTap: (){
            Navigator.pop(context);
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: InkWell(
              splashColor: Colors.black54,
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const Wishlist()));
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
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection("products").where("productID", isEqualTo: widget.productID).snapshots(),
                builder: (context, snapshot){
                  List<Column> productsWidget = [];
                  if(snapshot.hasData){
                    final productsdb = snapshot.data?.docs.reversed.toList();
                    for(var q in productsdb!){
                      String _id = q["productID"];
                      String name = q["name"];
                      List<String> storageList = <String>[q["storage"][0].toString(), q["storage"][1].toString(), q["storage"][2].toString(),];
                      List<String> colorsList = <String>[q["colors"][0].toString(), q["colors"][1].toString(), q["colors"][2].toString(), q["colors"][3].toString(), q["colors"][4].toString(),];
                      final productWidget = Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            color: Colors.white,
                              child: Image.network(q["images"])
                          ),
                          const Divider(color: Colors.black,),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text("${q["brand"]} ${q["name"]}", style: GoogleFonts.aoboshiOne(
                              textStyle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
                            )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5, bottom: 5, right: 10, left: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Select Storage", style: TextStyle(color: Colors.white70, fontSize: 17),),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: const Color.fromRGBO(35, 35, 34, 1),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 5, right: 5),
                                    child: DropdownButton<String>(
                                      style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.w700),
                                      value: storageVal,
                                        items: storageList.map<DropdownMenuItem<String>>((String val){
                                          return DropdownMenuItem<String>(
                                            value: val,
                                            child: Text(val),
                                          );
                                        }).toList(),
                                        onChanged: (String? val) {
                                          List list = q["storage"];
                                          list.asMap().forEach((key, value) {
                                            if(list[key] == val){
                                              setState(() {
                                                priceVal = q["price"][key];
                                              });
                                            }
                                          });
                                          setState(() {
                                            storageVal = val!;
                                            debugPrint("$storageVal : $priceVal");
                                          });
                                        },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5, bottom: 5, right: 10, left: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Select Color", style: TextStyle(color: Colors.white70, fontSize: 17),),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: const Color.fromRGBO(35, 35, 34, 1),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 5, right: 5),
                                    child: DropdownButton<String>(
                                      style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.w700),
                                      value: colorVal,
                                      items: colorsList.map<DropdownMenuItem<String>>((String val){
                                        return DropdownMenuItem<String>(
                                          value: val,
                                          child: Text(val),
                                        );
                                      }).toList(),
                                      onChanged: (String? val) {
                                        setState(() {
                                          colorVal = val!;
                                          debugPrint(colorVal);
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
                            child: Row(
                              children: [
                                const Expanded(
                                  flex: 1,
                                    child: Text("Brand", style: TextStyle(color: Colors.white, fontSize: 17,),)
                                ),
                                Expanded(
                                  flex: 3,
                                    child: Text(": ${q["brand"]}", style: TextStyle(color: Colors.white, fontSize: 17,),)
                                ),
                              ],
                            )
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
                            child: Row(
                              children: [
                                const Expanded(
                                    flex: 1,
                                    child: Text("Model", style: TextStyle(color: Colors.white, fontSize: 17,),)
                                ),
                                Expanded(
                                    flex: 3,
                                    child: Text(": ${q["name"]}", style: TextStyle(color: Colors.white, fontSize: 17,),)
                                ),
                              ],
                            )
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Expanded(
                                    flex: 1,
                                    child: Text("Chipset", style: TextStyle(color: Colors.white, fontSize: 17,),)
                                ),
                                Expanded(
                                    flex: 3,
                                    child: Text(":${q["chipset"]}", style: TextStyle(color: Colors.white, fontSize: 17,),)
                                ),
                              ],
                            )
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
                            child: Row(
                              children: [
                                const Expanded(
                                    flex: 1,
                                    child: Text("Camera", style: TextStyle(color: Colors.white, fontSize: 17,),)
                                ),
                                Expanded(
                                    flex: 3,
                                    child: Text(": ${q["camera"]}", style: TextStyle(color: Colors.white, fontSize: 17,),)
                                ),
                              ],
                            )
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Expanded(
                                    flex: 1,
                                    child: Text("Screen", style: TextStyle(color: Colors.white, fontSize: 17,),)
                                ),
                                Expanded(
                                    flex: 3,
                                    child: Text(": ${q["screen"]}", style: TextStyle(color: Colors.white, fontSize: 17,),)
                                ),
                              ],
                            )
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: InkWell(
                              splashColor: Colors.red,
                              onTap: ()async{
                                setState(() {
                                  if(priceVal == "0"){
                                    priceVal = q["price"][0];
                                  }
                                  if(colorVal == "Select"){
                                    colorVal = q["colors"][0];
                                  }
                                });
                                try{
                                  String tempID = "";
                                  await FirebaseFirestore.instance.collection("carts").add({
                                    "productID" : q["productID"],
                                    "u_ID" : _auth.currentUser?.uid,
                                    "productName" : q["name"],
                                    "storage" : storageVal,
                                    "color" : colorVal,
                                    "images" : q["images"],
                                    "price" : priceVal,
                                    "createdAt" : DateTime.now().millisecondsSinceEpoch,
                                  }).then((DocumentReference doc){
                                    tempID = doc.id;
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                          backgroundColor: Colors.white,
                                          content: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text('Item is added to Cart!  ', style: TextStyle(color: Colors.black),),
                                              Icon(FluentIcons.heart_20_filled, color: Colors.red,)
                                            ],
                                          ),
                                        ),
                                    );
                                  }).catchError((error)=> debugPrint(error));
                                  var col = FirebaseFirestore.instance.collection("carts");
                                  col.doc(tempID).update({"cartID" : tempID})
                                      .then((_) => debugPrint("Added to Wishlist"))
                                      .catchError((error)=> debugPrint(error.toString()));
                                }catch(e){
                                  debugPrint(e.toString());
                                }
                              },
                              borderRadius: BorderRadius.circular(10),
                              child: Ink(
                                height: 45,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color.fromRGBO(35, 35, 34, 1.0),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(FluentIcons.heart_48_filled, color: Colors.red,),
                                    Text(" Wishlist",
                                        style: GoogleFonts.nunitoSans(
                                          textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
                                        )
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: InkWell(
                              splashColor: Colors.green,
                              onTap: (){
                                setState(() {
                                  if(priceVal == "0"){
                                    priceVal = q["price"][0];
                                    colorVal = q["colors"][0];
                                  }
                                });
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> OrderSummary(productID: q["productID"], color: colorVal, storage: storageVal, price: priceVal, image: q["images"], prodName: q["name"])));
                              },
                              borderRadius: BorderRadius.circular(10),
                              child: Ink(
                                height: 45,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color.fromRGBO(35, 35, 34, 1.0),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Icon(FluentIcons.shopping_bag_20_filled, color: Colors.green,),
                                    Text(" Buy Now",
                                        style: GoogleFonts.nunitoSans(
                                          textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
                                        )
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 100,
                            width: double.infinity,
                          )
                        ],
                      );
                      productsWidget.add(productWidget);
                    }
                  }
                  return ListView(
                    children: productsWidget,
                  );
                }
            ),
          ),
        ),
    );
  }
}
import 'package:amazkart/screens/paymentScreen.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddressScreen extends StatefulWidget{
  const AddressScreen({super.key, required this.productID, required this.color, required this.storage, required this.price, required this.image, required this.prodName});
  final productID, color, storage, price, image, prodName;

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final line1Controller = TextEditingController();
  final line2Controller = TextEditingController();
  final cityController = TextEditingController();
  final distController = TextEditingController();
  final stateController = TextEditingController();
  final zipController = TextEditingController();
  final landmarkController = TextEditingController();
  final msgController = TextEditingController();
  final nameController = TextEditingController();
  final phnController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Delivery Address", style: TextStyle(color: Colors.white),),
        centerTitle: true,
        leading: GestureDetector(
          child: const Icon(FluentIcons.chevron_left_20_regular, color: Colors.red,),
          onTap: (){
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
              child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(35, 35, 34, 1),
                    borderRadius: BorderRadius.circular(15),
                  ),
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
                                        color: Colors.white10,
                                        thickness: 2,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(FluentIcons.checkmark_circle_20_filled, color: Colors.green, size: 24,),
                                  Icon(FluentIcons.location_28_filled, color: Colors.blue, size: 24,),
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
                              Text("Summary", style: TextStyle(color: Colors.white70),),
                              Text("Address", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),),
                              Text("Payment", style: TextStyle(color: Colors.white70),),
                            ],
                          ),
                        ),
                      ),
                    ),
                    TextField(
                      controller: nameController,
                      keyboardType: TextInputType.text,
                      cursorColor: Colors.white70,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        label: const Text("Name", style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w600, fontSize: 13),),
                        filled: true,
                        fillColor: const Color.fromRGBO(35, 35, 34, 1),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white70, width: 1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        prefixIcon: const Icon(FluentIcons.person_20_filled, color: Colors.blue,),
                      ),
                    ),
                    const Text(""),
                    TextField(
                      controller: phnController,
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.white70,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        label: const Text("Phone Number", style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w600, fontSize: 13),),
                        filled: true,
                        fillColor: const Color.fromRGBO(35, 35, 34, 1),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white70, width: 1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        prefixIcon: const Icon(FluentIcons.phone_20_filled, color: Colors.blue,),
                      ),
                    ),
                    const Text(""),
                    TextField(
                      controller: line1Controller,
                      keyboardType: TextInputType.text,
                      cursorColor: Colors.white70,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        label: const Text("Address Line 1", style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w600, fontSize: 13),),
                        filled: true,
                        fillColor: Color.fromRGBO(35, 35, 34, 1),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white70, width: 1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        prefixIcon: const Icon(FluentIcons.location_20_filled, color: Colors.blue,),
                      ),
                    ),
                    const Text(""),
                    TextField(
                      controller: line2Controller,
                      keyboardType: TextInputType.text,
                      cursorColor: Colors.white70,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        label: const Text("Address Line 2 (Optional)", style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w600, fontSize: 13),),
                        filled: true,
                        fillColor: const Color.fromRGBO(35, 35, 34, 1),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white70, width: 1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        prefixIcon: const Icon(FluentIcons.location_20_regular, color: Colors.blue,),
                      ),
                    ),
                    const Text(""),
                    TextField(
                      controller: cityController,
                      keyboardType: TextInputType.text,
                      cursorColor: Colors.white,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        label: const Text("City / Locality", style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w600, fontSize: 13),),
                        filled: true,
                        fillColor: const Color.fromRGBO(35, 35, 34, 1),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white70, width: 1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        prefixIcon: const Icon(FluentIcons.city_24_filled, color: Colors.blue,),
                      ),
                    ),
                    const Text(""),
                    TextField(
                      controller: distController,
                      keyboardType: TextInputType.text,
                      cursorColor: Colors.white,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        label: const Text("District", style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w600, fontSize: 13),),
                        filled: true,
                        fillColor: const Color.fromRGBO(35, 35, 34, 1),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white70, width: 1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        prefixIcon: const Icon(FluentIcons.zoom_fit_16_filled, color: Colors.blue,),
                      ),
                    ),
                    const Text(""),
                    TextField(
                      controller: stateController,
                      keyboardType: TextInputType.text,
                      cursorColor: Colors.white,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        label: const Text("State / UT", style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w600, fontSize: 13),),
                        filled: true,
                        fillColor: const Color.fromRGBO(35, 35, 34, 1),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white70, width: 1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        prefixIcon: const Icon(FluentIcons.local_language_20_filled, color: Colors.blue,),
                      ),
                    ),
                    const Text(""),
                    TextField(
                      controller: zipController,
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.white,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        label: const Text("Zip code", style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w600, fontSize: 13),),
                        filled: true,
                        fillColor: const Color.fromRGBO(35, 35, 34, 1),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white70, width: 1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        prefixIcon: const Icon(FluentIcons.pin_20_filled, color: Colors.blue,),
                      ),
                    ),
                    const Text(""),
                    TextField(
                      controller: landmarkController,
                      keyboardType: TextInputType.text,
                      cursorColor: Colors.white,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        label: const Text("Landmark (Optional)", style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w600, fontSize: 13),),
                        filled: true,
                        fillColor: const Color.fromRGBO(35, 35, 34, 1),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white70, width: 1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        prefixIcon: const Icon(FluentIcons.markdown_20_filled, color: Colors.blue,),
                      ),
                    ),
                    const Text(""),
                    TextField(
                      controller: msgController,
                      keyboardType: TextInputType.text,
                      cursorColor: Colors.white,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        label: const Text("Any message? (Optional)", style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w600, fontSize: 13),),
                        filled: true,
                        fillColor: const Color.fromRGBO(35, 35, 34, 1),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white70, width: 1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        prefixIcon: const Icon(FluentIcons.feed_20_filled, color: Colors.blue,),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        height: 60,
        child: InkWell(
          onTap: (){
            if( nameController.text == "" ||
                phnController.text == "" ||
                line1Controller.text == "" ||
                line1Controller.text == " " ||
                cityController.text == "" ||
                cityController.text == " " ||
                distController.text == "" ||
                distController.text == " " ||
                stateController.text == "" ||
                stateController.text == " " ||
                zipController.text == "" ||
                zipController.text == " "){
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: Colors.white,
                  content: Text('Please fill all the fields properly which are mandatory!', style: TextStyle(color: Colors.black),),
                ),
              );
              return;
            }
            if(phnController.text.length != 10){
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: Colors.white,
                  content: Text('Phone number must be 10 digits!', style: TextStyle(color: Colors.black),),
                ),
              );
              return;
            }
            if(zipController.text.length != 6){
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: Colors.white,
                  content: Text('Zip code must be 6 digits!', style: TextStyle(color: Colors.black),),
                ),
              );
              return;
            }
            Navigator.push(context, MaterialPageRoute(builder: (context)=> PaymentScreen(
              productID: widget.productID,
              color: widget.color,
              storage: widget.storage,
              price: widget.price,
              image: widget.image,
              prodName: widget.prodName,
              name: nameController.text,
              phone: phnController.text,
              line1: line1Controller.text,
              line2: line2Controller.text,
              city: cityController.text,
              dist: distController.text,
              state: stateController.text,
              zip: zipController.text,
              landmark: landmarkController.text,
              msg: msgController.text,
            )));
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
                Text("SAVE & CONTINUE  ", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),),
                Icon(FluentIcons.arrow_right_16_regular)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_flutter_gvm/service/customise_widget.dart';
import 'package:project_flutter_gvm/service/database.dart';
import 'package:project_flutter_gvm/service/razorpayonstant.dart';
import 'package:random_string/random_string.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class DeliveryAddress extends StatefulWidget {
  const DeliveryAddress({super.key});

  @override
  State<DeliveryAddress> createState() => _DeliveryAddressState();
}

class _DeliveryAddressState extends State<DeliveryAddress> {

  TextEditingController pickupAddress = TextEditingController();
  TextEditingController pickupUsername = TextEditingController();
  TextEditingController pickupPhone = TextEditingController();
  TextEditingController dropoffAddress = TextEditingController();
  TextEditingController dropoffUsername = TextEditingController();
  TextEditingController dropoffPhone = TextEditingController();

   String? email , id;
   
   
   
  
 

  // Map<String, dynamic>? paymentIntent;

  late Razorpay _razorpay;
  int total = 0;

  @override
  void dispose(){
    _razorpay.clear();
    super.dispose();
  }

  void openCheckOut(String amount,String email) {
    var options = {
      'key': RazorPayKey,
      'amount': amount,
      'name': 'Fast Me Delivery App',
      'description': 'Payment for your order',
      'prefill': {'email': email},
      'external':{
        'wallets': ['paytm'],
      }, 
    };

    try{
      _razorpay.open(options);
    }
    catch(e){
      debugPrint('Error: $e');
    } 
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {

    String trackingNumber = randomAlphaNumeric(10);
    String orderId = randomAlphaNumeric(10);
    String userId = id ?? 'Order';

    Map<String, dynamic> userOrderMap={
      "PickUpAddress": pickupAddress.text,
      "PickUpUsername": pickupUsername.text,
      "PickUpPhone": pickupPhone.text,
      "DropoffAddress": dropoffAddress.text,
      "DropoffUserName": dropoffUsername.text,
      "DropoffPhone": dropoffPhone.text,
      "OrderId": orderId,
      "TrackNumber": trackingNumber,
      "Tracker": -1,
      "UserId": id,

     };
    
    await DatabaseFM().addUserOrder(userOrderMap, userId, orderId);
    await  DatabaseFM().addAdminOrder(userOrderMap, orderId);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.green, content: Text('Order Placed Successfully',style: Appwidget.whitetextstyle(),),));
    
    
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text("Payment Failure: ${response.message}",style: Appwidget.whitetextstyle(),)),
    );
  }

  void _handleExternalWallet(ExternalWalletResponse response){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("External Wallet: ${response.walletName}")),
    );
  }

  @override
  void initState() {
    
     
     email = FirebaseAuth.instance.currentUser?.email;
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.initState();
  }
 







  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      backgroundColor:  Color.fromARGB(255, 40, 72, 234),
      body: Container(
        padding: EdgeInsets.only(top: 50),
        margin: EdgeInsets.only(top: 20.0),
        child: Column(
          children: [

            Center(child: Text("Add Package",style: Appwidget.whitetextstyle(),)
            ),
      
            SizedBox(height: 20,),
            Expanded (
              child: Container(
                padding: EdgeInsets.only(left: 20),
                 decoration: BoxDecoration(color: Colors.white,
                 borderRadius:BorderRadius.only(
                  topLeft:Radius.circular(30),
                 topRight: Radius.circular(30),
                 ),
                 ),
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(child: Image.asset("asset/images/van.png",height: 150,width: 150,fit: BoxFit.cover,)),

                      SizedBox(height: 20,),
                  
                      Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(right: 20.0),
                        decoration: BoxDecoration(border: Border.all(color: Colors.black,width:2.0 ),borderRadius: BorderRadius.circular(15)),
                        
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Pick Up Details",style: Appwidget.normalineTextstyle(22.0),),
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                Icon(Icons.location_on,color: Color.fromARGB(255, 40, 72, 234),size: 30.0,),
                                SizedBox(width: 10,),
                                Expanded(
                                  child: TextField(
                                    controller: pickupAddress,
                                    decoration: InputDecoration(
                                      hintText: "Enter Pickup Address",
                                      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                                    ), 
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                Icon(Icons.person,color: Color.fromARGB(255, 40, 72, 234),size: 30.0,),
                                SizedBox(width: 10,),
                                Expanded(
                                  child: TextField(
                                    controller: pickupUsername,
                                    decoration: InputDecoration(
                                      hintText: "Enter Your Name",
                                      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                                    ), 
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                Icon(Icons.phone,color: Color.fromARGB(255, 40, 72, 234),size: 30.0,),
                                SizedBox(width: 10,),
                                Expanded(
                                  child: TextField(
                                    maxLength: 10,
                                    controller: pickupPhone,
                                    decoration: InputDecoration(
                                      hintText: "Enter Your Phone Number",
                                      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                                    ), 
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20,),

                      Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(right: 20.0),
                        decoration: BoxDecoration(border: Border.all(color: Colors.black,width:2.0 ),borderRadius: BorderRadius.circular(15)),
                        
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Drop Off Details",style: Appwidget.normalineTextstyle(22.0),),
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                Icon(Icons.location_on,color: Color.fromARGB(255, 40, 72, 234),size: 30.0,),
                                SizedBox(width: 10,),
                                Expanded(
                                  child: TextField(
                                    controller: dropoffAddress,
                                    decoration: InputDecoration(
                                      hintText: "Enter Drop Off Address",
                                      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                                    ), 
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                Icon(Icons.person,color: Color.fromARGB(255, 40, 72, 234),size: 30.0,),
                                SizedBox(width: 10,),
                                Expanded(
                                  child: TextField(
                                    controller: dropoffUsername,
                                    decoration: InputDecoration(
                                      hintText: "Enter Your Name",
                                      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                                    ), 
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                Icon(Icons.phone,color: Color.fromARGB(255, 40, 72, 234),size: 30.0,),
                                SizedBox(width: 10,),
                                Expanded(
                                  child: TextField(
                                    maxLength: 10,
                                    controller: dropoffPhone,
                                    decoration: InputDecoration(
                                      hintText: "Enter Your Phone Number",
                                      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                                    ), 
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20,),

                      Container(
                        margin:EdgeInsets.only(right: 20.0) ,
                        padding: EdgeInsets.only(left: 10,top: 10.0,bottom: 10.0),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(border: Border.all(color: Colors.black,width: 2.0),borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          children: [
                            Column(
                              children: [ 
                                Text("Total Price", style: Appwidget.normalineTextstyle(18.0),),
                                Text("\u20B9500",style: Appwidget.headlineTextstyle(26.0),),
                              ],
                            ),
                            SizedBox(width: 20.0,),
                            InkWell(
                              onTap: (){


                                openCheckOut("50000" ,email!); //string cant be assigning to parame



                              },
                              child: Container(
                                height: 55,
                                width: 200,
                                decoration: BoxDecoration(color: Color.fromARGB(255, 40, 72, 234),borderRadius: BorderRadius.circular(30)),
                                child: Center(child: Text("Place Order",style: Appwidget.whitetextstyle(),)),
                              ),
                            )

                            
                          ],
                        ),

                      ),



                       SizedBox(height: 30,), 
                    ],
                  ),
                ),
              ),
            ),
             
          ],
        ),
      ),
    );
  }
}


import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:project_flutter_gvm/Pages/delivery_address.dart';
import 'package:project_flutter_gvm/Pages/home.dart';
import 'package:project_flutter_gvm/Pages/order.dart';
import 'package:project_flutter_gvm/Pages/profile.dart';
// import 'package:project_flutter_gvm/Pages/tracking.dart';

class Bottomnavbar extends StatefulWidget {
  const Bottomnavbar({super.key});

  @override
  State<Bottomnavbar> createState() => _BottomnavbarState();
}

class _BottomnavbarState extends State<Bottomnavbar> {
  late List<Widget> pages;

  late Homepage homepage;
  late DeliveryAddress deliveryAddress;
  late ProfilePage profilePages;
  late OrderPage orderPage;
  
  int currentTabIndex = 0;

  @override
  void initState() {
    homepage = Homepage();
    deliveryAddress = DeliveryAddress();
    profilePages = ProfilePage();
    orderPage = OrderPage();

    pages = [homepage, deliveryAddress, orderPage, profilePages ];
    super.initState();
  }






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 70,
        backgroundColor: Colors.white,
        color: const Color.fromARGB(255, 61, 84, 234),
        animationDuration: Duration(milliseconds: 500),
        onTap: (int index){
          setState(() {
            currentTabIndex = index;
          });
        },
        
        
        
        items: [
          Icon(Icons.home,color: Colors.white,size: 35.0,),
          Icon(Icons.post_add,color: Colors.white,size: 35.0,),
          Icon(Icons.shopping_bag,color: Colors.white,size: 35.0,),
          Icon(Icons.person,color: Colors.white,size: 35.0,),


        ]),
        body: pages[currentTabIndex],

    );
  }
}
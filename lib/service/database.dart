import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseFM {

  Future addUserDetail(Map<String,dynamic> userInfoMap,String id)async{
    return await FirebaseFirestore.instance
    .collection("users")
    .doc(id)
    .set(userInfoMap);
  }

  Future addUserOrder(Map<String,dynamic> userInfoMap,String id, String orderid)async{
    return await FirebaseFirestore.instance
    .collection("users")
    .doc(id)
    .collection("Order")
    .doc(orderid)
    .set(userInfoMap);
  }

  Future addAdminOrder(Map<String,dynamic> userInfoMap,String id)async{
    return await FirebaseFirestore.instance
    .collection("Order")
    .doc(id)
    .set(userInfoMap);
  }

  Future<Stream<QuerySnapshot>>getAdminOrders()async{
    return await FirebaseFirestore.instance.collection("Order").snapshots();
  }

  Future updateAdminTracker(String id, int updatedtracker)async{
    return await FirebaseFirestore.instance.collection("Order").doc(id).update({
      "Tracker" : updatedtracker});
  }
  Future<Stream<QuerySnapshot>>getuserdetails()async{
    return await FirebaseFirestore.instance.collection("users").snapshots();
  }












































//   Future<QuerySnapshot> getOrdersByTracker(int trackerValue) async {
//   return await FirebaseFirestore.instance
//       .collection("Order")
//       .where("Tracker", isEqualTo: trackerValue)
//       .get();
// }

  // Future updateUserTracker(
  //   String id,
  //    int updatedtracker,
  //     String orderid,
  //     )async{
  //        return await FirebaseFirestore.instance
  //        .collection("users")
  //        .doc(id)
  //        .collection("Order")
  //        .doc(orderid)
  //        .update({
  //     "Tracker" : updatedtracker});
  // }


  // Future<Stream<QuerySnapshot>>getUserOrders(String id)async{
  //   return await FirebaseFirestore.instance
  //   .collection("users")
  //   .doc(id)
  //   .collection("Order")
  //   .snapshots();
  // }

}
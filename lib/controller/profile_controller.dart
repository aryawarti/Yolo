import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yolo/model/person.dart';

class ProfileController extends GetxController
{
   final Rx<List<Person>> userProfileList= Rx<List<Person>>([]);
   List<Person> get allUserProfileList => userProfileList.value;

   @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    userProfileList.bindStream(
       FirebaseFirestore.instance
           .collection("users")
           .where("uiv",isNotEqualTo: FirebaseAuth.instance.currentUser!.uid)
           .snapshots()
           .map((QuerySnapshot queryDataSnapshot)
       {
              List<Person> profileList=[];
              for(var eachProfile in queryDataSnapshot.docs){
                  profileList.add(Person.fromDataSnapshot(eachProfile));
              }
               return profileList;
       })
    );
  }
}
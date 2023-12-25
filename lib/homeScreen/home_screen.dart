import 'package:flutter/material.dart';
import 'package:yolo/tabScreen/favorite_sent_favorite_recieved_Screen.dart';
import 'package:yolo/tabScreen/like_sent_like_received.dart';
import 'package:yolo/tabScreen/swippingScreen.dart';
import 'package:yolo/tabScreen/user_detail_Screen.dart';
import 'package:yolo/tabScreen/veiwSentveiwRecieved.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   int ScreenIndex=0;
   List tabScreenList=
   [
     SwippingScreen(),
     ViewSentViewReceivedScreen(),
     FavoriteSentFavoriteReceived(),
     LikeSentLikeReceivedScreen(),
     UserDetailScreen(),
   ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (indexNumber){
          ScreenIndex=indexNumber;
          setState(() {

          });
      },
        type: BottomNavigationBarType.fixed,
          backgroundColor:Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white12,
        currentIndex: ScreenIndex,
        items:const [
          // swipping
            BottomNavigationBarItem(
                icon: Icon(
                   Icons.home,
                  size: 30,
                ),
              label: ""
            ),
        //  veiwSent veiwReceived
          BottomNavigationBarItem(
              icon: Icon(
                Icons.remove_red_eye,
                size: 30,
              ),
              label: ""
          ),
          // favoriteSent favoriteReceived
          BottomNavigationBarItem(
              icon: Icon(
                Icons.star,
                size: 30,
              ),
              label: ""
          ),
           // likedsent like received
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                size: 30,
              ),
              label: ""
          ),
           // userDetail icon button
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 30,
              ),
              label: ""
          ),
        ],
      ),
      body: tabScreenList[ScreenIndex],
    );
  }
}

import 'package:flutter/material.dart';

class FavoriteSentFavoriteReceived extends StatefulWidget {
  const FavoriteSentFavoriteReceived({Key? key}) : super(key: key);

  @override
  State<FavoriteSentFavoriteReceived> createState() => _FavoriteSentFavoriteReceivedState();
}

class _FavoriteSentFavoriteReceivedState extends State<FavoriteSentFavoriteReceived> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Favorite Sent Favorite Received Screen',
          style: TextStyle(
            color: Colors.green,
            fontSize: 20,
          ),),
      ),
    );
  }
}


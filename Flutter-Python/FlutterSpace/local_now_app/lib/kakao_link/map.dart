import 'package:flutter/material.dart';

import '../game_test/game_page.dart';
import '../korea_map/korea.dart';
import 'kakaoapi.dart';

class KaKaos extends StatefulWidget {
  const KaKaos({super.key});

  @override
  State<KaKaos> createState() => _KaKaosState();
}

class _KaKaosState extends State<KaKaos> {
  var kakaolink = Kakaolink_api();
  late String profiletitle = 'local_now';
  // profiletitle = 우리 앱 이름
  late String userName = 'User Name';
  late String point = '100점';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("kakaotest"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                // width: 170,
                height: 70,
                child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  onPressed: () {
                    kakaolink.kakao(profiletitle, userName, point);
                    // kakao();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "images/symbol_kakao.png",
                        width: 70,
                        height: 70,
                      ),
                      const Text(
                        "     친구들과 공유하기",
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GamePage(),
                    ),
                  );
                },
                child: const Text("게임하러가기 (임시임)"),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const KoreaMap(),
                      ),
                    );
                  },
                  child: const Text("Map"))
            ],
          ),
        ),
      ),
    );
  }
}

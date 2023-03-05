import 'package:flutter/material.dart';
import 'package:local_now_app/widget/gauge.dart';
import '../custom_bottom_nav_bar.dart';
import '../korea_map/korea.dart';
import '../model/message_pred80.dart';
import '../widget/custom_app_bar.dart';
import '../widget/custom_style.dart';

class Pred80Result extends StatefulWidget {
  const Pred80Result({super.key});

  @override
  State<Pred80Result> createState() => _Pred80ResultState();
}

class _Pred80ResultState extends State<Pred80Result> {
  late Map<String, dynamic> result;

  @override
  void initState() {
    super.initState();
    result = {};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBar: AppBar(), title: '결과'),
      body: Column(
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '80년 후 ${MessagePred80.sido}의',
                      style: CustomStyle().primaryTextStyle(Colors.teal[900]),
                    ),
                    Text(
                      '지방 소멸 위험도!',
                      style: CustomStyle().primaryTextStyle(Colors.teal[900]),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(height: 350, child: Gauge()),
                  ],
                ),
              ),
              Positioned(
                top: 380,
                right: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 15, 0, 10),
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color(0xffD8D8D8),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                    ' 내가 만든 소멸 위험도: ${MessagePred80.change80.toStringAsFixed(2)}'),
                              ],
                            ),
                          )),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 440,
                right: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xffD8D8D8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                                '80년 후 소멸 위험도: ${MessagePred80.pred80.toStringAsFixed(2)}')
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Positioned(
              bottom: 100,
              child: ElevatedButton(
                style: CustomStyle().primaryButtonStyle(),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CustomBottomNavBar(),
                      ));
                },
                child: const Text('홈으로 돌아가기'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: CustomStyle().primaryButtonStyle(),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const KoreaMap(),
                    ));
              },
              child: const Text('다시 하러 가기'),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:local_now_app/survey/survey_moving_page.dart';
import 'package:lottie/lottie.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../model/message_answers.dart';
import '../widget/custom_app_bar.dart';
import '../widget/custom_style.dart';

class CompanyPage extends StatefulWidget {
  const CompanyPage({super.key});

  @override
  State<CompanyPage> createState() => _CompanyPageState();
}

class _CompanyPageState extends State<CompanyPage> {
  _CompanyPageState();

  double _value5 = MessageAnswers.sliderCompanies;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(appBar: AppBar(), title: '나만의 지역의 신생 회사 숫자는?'),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              // const Text('나만의 지역의 신생 회사 숫자는?'),
              Lottie.asset('images/building.json'),
              //LottieImageAsset(width: 0, height: 0, i

              SfSlider(
                min: 0,
                max: 8,
                value: _value5,
                showDividers: true,
                interval: 1,
                showLabels: true,
                showTicks: true,
                stepSize: 1,
                onChangeStart: (dynamic startValue) {
                  print('Interaction started');
                },
                onChanged: (dynamic newValue) {
                  _value5 = newValue;
                  setState(() {});
                },
                // onChangeEnd: (dynamic endValue) {
                //   MessageSido.sliderPop = endValue;
                // },
              ),
              const Text('(단위 : 8,000개)'),
              ElevatedButton(
                style: CustomStyle().primaryButtonStyle(),
                onPressed: () {
                  // 값 저장하고 결과 페이지로
                  // MessageAnswers.sliderCompanies = _value5;
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      //생성자로 값을 넣어주는 부분! *******************
                      //메모리에 안 올라감 -> 보안이 굿
                      //but 페이지 옮길 때 또 써줘야 해서 보안에 관련된 것만 생성자로 넘겨주기
                      return const MovingPage();
                    },
                  ));
                },
                child: const Text('다음 질문!'),
              ),
            ],
          ),
        ));
  }
}

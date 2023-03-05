import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../model/message_pred80.dart';

class Gauge extends StatefulWidget {
  const Gauge({super.key});

  @override
  State<Gauge> createState() => _GaugeState();
}

class _GaugeState extends State<Gauge> {
  double width = 30;
  late Map<String, dynamic> result;

  @override
  void initState() {
    super.initState();
    // get80Value();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SfRadialGauge(axes: <RadialAxis>[
            RadialAxis(
              minimum: -0.5,
              maximum: 1.5,
              startAngle: 180,
              endAngle: 0,
              tickOffset: 25,
              pointers: <GaugePointer>[
                // MarkerPointer(
                //     value: MessagePred80.pred80,
                //     markerType: MarkerType.image,
                //     markerHeight: 30,
                //     markerWidth: 20,
                //     imageUrl: 'images/marker2.png'),
                NeedlePointer(
                  value: MessagePred80.change80,
                ),
                // 80년 뒤 소멸 위험도
                MarkerPointer(
                  value: MessagePred80.pred80,
                  markerHeight: 20,
                  markerWidth: 20,
                  elevation: 4,
                  color: Colors.black,
                )
              ],
              ranges: <GaugeRange>[
                GaugeRange(
                  startValue: -0.5,
                  endValue: 0.33,
                  color: Colors.green,
                  startWidth: width,
                  endWidth: width,
                ),
                GaugeRange(
                  startValue: 0.33,
                  endValue: 0.67,
                  color: Colors.orange,
                  startWidth: width,
                  endWidth: width,
                ),
                GaugeRange(
                  startValue: 0.67,
                  endValue: 1.5,
                  color: Colors.red,
                  startWidth: width,
                  endWidth: width,
                )
              ],
            )
          ])
        ],
      ),
    );
  }
}

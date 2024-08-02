import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class TemparatureGauge extends StatelessWidget {
  final double gaugeval = 20;
  const TemparatureGauge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      width: 400,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              offset: const Offset(0, 2),
              blurRadius: 15)
        ],
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 150,
            width: 150,
            child: SfRadialGauge(
              axes: <RadialAxis>[
                RadialAxis(
                  minimum: -5,
                  maximum: 40,
                  interval: 50,
                  startAngle: 180,
                  endAngle: 360,
                  showLastLabel: true,
                  showTicks: false,
                  canScaleToFit: true,
                  pointers: <NeedlePointer>[
                    NeedlePointer(
                      needleLength: 0.9,
                      needleEndWidth: 10,
                      value: gaugeval,
                    ),
                  ],
                  ranges: <GaugeRange>[
                    GaugeRange(
                      startValue: -5,
                      endValue: gaugeval,
                      color: Colors.amber,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Text(
            '26.27',
            style: TextStyle(fontSize: 22),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            'Water Temperature',
            style: TextStyle(
              fontSize: 22,
              color: Colors.blue,
            ),
          )
        ],
      ),
    );
  }
}

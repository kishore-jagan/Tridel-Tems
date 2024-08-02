import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:temskishore/model/Statistics/linechart_model.dart';
import 'package:temskishore/view/Statistics/widgets/chart_widget.dart';
import 'package:temskishore/view/Statistics/widgets/emptydata.dart';
import 'package:temskishore/view/Statistics/widgets/sampledata.dart';

class LineChartView extends StatefulWidget {
  const LineChartView({super.key});

  @override
  State<LineChartView> createState() => _LineChartViewState();
}

class _LineChartViewState extends State<LineChartView> {
  final ChartWidget _chartWidget = Get.put(ChartWidget());
  final EmptyData _emptyData = Get.put(EmptyData());
  final SampleData _sampleData = Get.put(SampleData());

  bool isDataEmpty = false;

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      zoomPanBehavior: _chartWidget.zoom,
      tooltipBehavior: _chartWidget.toolTip,
      primaryXAxis: _chartWidget.x,
      primaryYAxis: _chartWidget.y,
      title: _chartWidget.title,
      legend: Legend(isVisible: true),
      series: <CartesianSeries>[
        ScatterSeries<ChartDataModel, int>(
            legendItemText: 'C',
            dataSource:
                isDataEmpty ? _emptyData.emptyChart1 : _sampleData.chartData1,
            xValueMapper: (ChartDataModel data, _) => data.x,
            yValueMapper: (ChartDataModel data, _) => data.y),
        ScatterSeries<ChartDataModel, int>(
            dataSource:
                isDataEmpty ? _emptyData.emptyChart1 : _sampleData.chartData2,
            xValueMapper: (ChartDataModel data, _) => data.x,
            yValueMapper: (ChartDataModel data, _) => data.y),
      ],
    );
  }
}

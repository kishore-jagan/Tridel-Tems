import 'package:get/get.dart';

import 'package:syncfusion_flutter_charts/charts.dart';

class ChartWidget extends GetxController {
  final toolTip =
      TooltipBehavior(enable: true, activationMode: ActivationMode.singleTap);
  final title = const ChartTitle(text: 'Water Temperature');
  final x = const NumericAxis(
    interval: 1,
    labelRotation: -47,
    enableAutoIntervalOnZooming: true,
  );
  final y = const NumericAxis(interval: 1);
  final zoom = ZoomPanBehavior(
      enableMouseWheelZooming: true,
      enableDoubleTapZooming: true,
      enablePanning: true,
      enablePinching: true,
      enableSelectionZooming: true);
}

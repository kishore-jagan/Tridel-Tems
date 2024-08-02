import 'package:flutter/material.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

import '../../../model/Api_models/getAllStations_model.dart';

class StationDropDown extends StatelessWidget {
  final MultiSelectController controller;
  final List<Station> stations; // List of stations
  final Function(List<ValueItem>) onOptionSelected;

  StationDropDown({
    required this.controller,
    required this.stations,
    required this.onOptionSelected,
  });

  @override
  Widget build(BuildContext context) {
    List<ValueItem> items = stations
        .map((station) => ValueItem(
            label: station.stationName, value: station.stationId.toString()))
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        const Padding(
          padding: EdgeInsets.only(top: 8.0, bottom: 4.0),
          child: Text(
            'Station*',
            style: TextStyle(fontSize: 16.0),
          ),
        ),
        MultiSelectDropDown(
          backgroundColor: Colors.white10,
          showClearIcon: false,
          controller: controller,
          onOptionSelected: onOptionSelected,
          options: items,
          selectionType: SelectionType.multi,
          chipConfig: const ChipConfig(wrapType: WrapType.wrap),
          dropdownHeight: 300,
          optionTextStyle: const TextStyle(fontSize: 16),
          showChipInSingleSelectMode: true,
          selectedOptionTextColor: Colors.lightBlue,
        ),
      ],
    );
  }
}

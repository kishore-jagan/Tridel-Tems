import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:temskishore/Widgets/Right_drawer/Widget/drawer_tick.dart';

class DataUploadDrawer extends StatefulWidget {
  const DataUploadDrawer({super.key});

  @override
  State<DataUploadDrawer> createState() => _DataUploadDrawerState();
}

class _DataUploadDrawerState extends State<DataUploadDrawer> {
  final MultiSelectController _controller = MultiSelectController();

  List<ValueItem> items = [
    const ValueItem(label: 'WQ 1', value: '1'),
    const ValueItem(label: 'WQ 2', value: '2'),
  ];

  File? _image;
  String? _imageName;

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        // On iOS, you can directly use the temporary file URL
        _imageName = pickedFile.name.toString();
      } else {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 16.0, left: 16.0, right: 16.0, bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('File Upload'),
                  IconButton(
                      onPressed: () => Get.back(),
                      icon: const Icon(Icons.close)),
                ],
              ),
            ),
            const Divider(
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
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
                    controller: _controller,
                    onOptionSelected: (options) {
                      debugPrint(options.toString());
                    },
                    options: items,
                    selectionType: SelectionType.multi,
                    chipConfig: const ChipConfig(wrapType: WrapType.wrap),
                    dropdownHeight: 300,
                    optionTextStyle: const TextStyle(fontSize: 16),
                    showChipInSingleSelectMode: true,
                    selectedOptionTextColor: Colors.lightBlue,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0, bottom: 4.0),
                    child: Text(
                      'Select file*',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        border:
                            Border.all(color: Colors.grey.withOpacity(0.3))),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: _getImage,
                          child: Container(
                            width: 100,
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.3),
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10))),
                            child: const Center(
                              child: Text('Choose file'),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        SizedBox(
                          width: 150,
                          child: Center(
                            child: Text(
                              _image != null
                                  ? _imageName.toString()
                                  : 'No file chosen',
                              softWrap: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  _image != null
                      ? SizedBox(
                          height: 400,
                          width: 100,
                          child: Image.file(
                            _image!,
                            fit: BoxFit.cover,
                            height: 100,
                            width: 100,
                          ),
                        )
                      : const SizedBox(
                          height: 0,
                        ),
                  const SizedBox(
                    height: 20,
                  ),
                  DrawerTick(val: 'OverWrite existing entries')
                ],
              ),
            ),
            const Spacer(),
            const Divider(
              color: Colors.grey,
            ),
            const SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border: Border.all(
                        color: Colors.lightBlue,
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Cancel',
                        style: TextStyle(color: Colors.lightBlue),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 40,
                    width: 100,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        // border: Border.all(color: Colors.blue, strokeAlign: 1),
                        color: Colors.lightBlue),
                    child: const Center(
                      child: Text(
                        'Upload',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 25.0,
            ),
          ],
        ),
      ),
    );
  }
}

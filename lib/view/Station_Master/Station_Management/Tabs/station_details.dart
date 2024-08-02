import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../controller/map_style/map_controller.dart';
import '../../../../model/Map/latlng_model.dart';
import '../Widgets/stationmanagement_text.dart';

class StationDetails extends StatefulWidget {
  const StationDetails({super.key});

  @override
  State<StationDetails> createState() => _StationDetailsState();
}

class _StationDetailsState extends State<StationDetails> {
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

  final MapStyle controller = Get.put(MapStyle());

  final TextEditingController _name = TextEditingController();
  final TextEditingController _code = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25.0),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 2),
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Edit Station',
                style: TextStyle(fontSize: 20.0),
              ),
              const SizedBox(
                height: 5.0,
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8.0, bottom: 4.0),
                child: Text(
                  'Station Name*',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              const StationManagementText(),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8.0, bottom: 4.0),
                child: Text(
                  'Station Code*',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              const StationManagementText(),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8.0, bottom: 4.0),
                child: Text(
                  'LAT*',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              const StationManagementText(),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8.0, bottom: 4.0),
                child: Text(
                  'LON*',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              const StationManagementText(),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8.0, bottom: 4.0),
                child: Text(
                  'Station Image*',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: Colors.grey)),
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
                      width: 250,
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
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8.0, bottom: 4.0),
                child: Text(
                  'Location Details*',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              const StationManagementText(),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                height: 300,
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: FlutterMap(
                    options: MapOptions(
                      center: RoutePoints().routepoints[0],
                      zoom: 9,
                    ),
                    children: [
                      TileLayer(
                        urlTemplate: controller.mapStyle,
                        subdomains: const ['a', 'b', 'c'],
                      ),
                      MarkerLayer(
                        markers: [
                          Marker(
                            point: RoutePoints().routepoints[0],
                            builder: (ctx) => InkWell(
                              onTap: () => setState(() {
                                _name.text = 'WQ 1';
                                _code.text = '`working';
                              }),
                              child: Image.asset(
                                isActive[0]
                                    ? 'assets/image/onlinebuoy.png'
                                    : 'assets/image/offlinebuoy.png',
                                width: 40,
                                height: 40,
                              ),
                            ),
                          ),
                          Marker(
                            point: RoutePoints().routepoints[1],
                            builder: (ctx) => InkWell(
                              onTap: () => setState(() {
                                _name.text = 'WQ 1';
                                _code.text = '`working';
                              }),
                              child: Image.asset(
                                isActive[1]
                                    ? 'assets/image/onlinebuoy.png'
                                    : 'assets/image/offlinebuoy.png',
                                width: 40,
                                height: 40,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

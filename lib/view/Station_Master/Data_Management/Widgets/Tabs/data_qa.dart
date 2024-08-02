import 'package:flutter/material.dart';

import '../dataman_drop.dart';
import '../dataman_table.dart';

// ignore: must_be_immutable
class DataQA extends StatefulWidget {
  Function(String) ontap;
  DataQA({super.key, required this.ontap});

  @override
  State<DataQA> createState() => _DataQAState();
}

class _DataQAState extends State<DataQA> {
  final TextEditingController _searchController = TextEditingController();

  final String _itemsSelected = '10 Items';
  final List<String> _items = ['5 Items', '10 Items', '20 Items'];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                height: 40,
                width: 150,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: Colors.lightBlue)),
                child: TextButton.icon(
                  onPressed: () {
                    widget.ontap('qauploadfilter');
                  },
                  icon: const Icon(
                    Icons.file_upload_outlined,
                    color: Colors.lightBlue,
                  ),
                  label: const Text(
                    'Upload',
                    style: TextStyle(color: Colors.lightBlue, fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Container(
                height: 40,
                width: 150,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: Colors.lightBlue)),
                child: TextButton.icon(
                  onPressed: () {
                    widget.ontap('qafilter');
                  },
                  icon: const Icon(
                    Icons.add,
                    color: Colors.lightBlue,
                  ),
                  label: const Text(
                    'Filter',
                    style: TextStyle(color: Colors.lightBlue, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
        const Text(
          'Water Quality',
          style: TextStyle(
            fontSize: 20,
            color: Colors.lightBlue,
          ),
        ),
        const Divider(),
        Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 50,
                child: TextField(
                  controller: _searchController,
                  decoration: const InputDecoration(
                    labelText: 'Search',
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: Colors.lightBlue)),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.lightBlue,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: Colors.lightBlue)),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: Colors.lightBlue)),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.file_download_outlined,
                        color: Colors.lightBlue,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Flexible(
                      child:
                          DatamanageDrop(val: _itemsSelected, items: _items)),
                  const SizedBox(
                    width: 5.0,
                  ),
                ],
              ),
            ),
          ],
        ),
        const DataManageTable()
      ],
    );
  }
}

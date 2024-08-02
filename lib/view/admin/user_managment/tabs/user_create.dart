// // ignore_for_file: non_constant_identifier_names

// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:multi_dropdown/multiselect_dropdown.dart';

// import 'package:http/http.dart' as http;
// import 'package:temsmobile/Api%20Services/Api_Config/apiData.dart';
// import 'package:temsmobile/Api%20Services/Api_Config/api_config.dart';
// import '../widget.dart';

// class UserCreation extends StatefulWidget {
//   const UserCreation({super.key});

//   @override
//   State<UserCreation> createState() => _UserCreationState();
// }

// class _UserCreationState extends State<UserCreation> {
//   final TextEditingController _userName = TextEditingController();
//   final TextEditingController _Name = TextEditingController();
//   final TextEditingController _Designation = TextEditingController();
//   final TextEditingController _Password = TextEditingController();
//   final TextEditingController _Email = TextEditingController();
//   final TextEditingController _ConfirmPassword = TextEditingController();
//   final MultiSelectController _controller = MultiSelectController();

//   String? selectedRole;
//   bool isUpdate = false;
//   bool IsShow = true;
//   bool isChecked = false;
//   bool isLoading = false;
//   // List<ValueItem> items = ApiData.drawerListStationName
//   //     .map((e) => ValueItem(label: e.label, value: e.value))
//   //     .toList();

//   int? id;
//   List<dynamic> Roles = ApiData.roles;
//   List<String> email = [];
//   List<Map<String, dynamic>> table = [];

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     isLoading = true;
//     print('roles${Roles}');
//     // // _roleController.getRoles();
//     // isLoading = false;
//     getUsers();
//   }

//   Future<void> DeleteUser(int uid) async {
//     print(uid);
//     setState(() {
//       table.clear();
//       isLoading = true;
//     });

//     final String baseUrl = ApiConfig.baseUrl;

//     // Define your API key
//     final String apiKey = ApiConfig.apiKey;
//     final String bearer = ApiConfig.bearerToken;

//     // Define your request headers
//     Map<String, String> headers = {
//       'Content-Type': 'application/json',
//       'Authorization': bearer,
//       'apiKey': apiKey,
//     };

//     var response = await http.delete(
//         Uri.parse('${ApiConfig.baseUrl}/api/auth/delete-user/$uid'),
//         headers: headers);
//     print(response.statusCode);
//     print(response.body);
//     if (response.statusCode == 200) {
//       getUsers();
//     }
//   }

//   Future<void> getUsers() async {
//     table.clear();
//     var response = await http
//         .get(Uri.parse('${ApiConfig.baseUrl}${ApiConfig.userlist}'), headers: {
//       'Content-Type': 'application/json',
//       'Authorization': ApiConfig.bearerToken,
//       'apiKey': ApiConfig.apiKey
//     });
//     print(response.statusCode);
//     if (response.statusCode == 200) {
//       var data = jsonDecode(response.body);
//       List<dynamic> users = data['users'];
//       // print(users);
//       for (var user in users) {
//         int uId = user['userId'];
//         String email = user['userEmail'];
//         String name = user['name'];
//         String uName = user['userName'];
//         String designation = user['designation'];
//         Map<String, dynamic> roles = user['role'];
//         String roleName = roles['roleName'];
//         int roleId = roles['roleId'];

//         // print('Role: $roleName'); // for(var role in roles)

//         table.add({
//           'id': uId,
//           'uName': uName,
//           'name': name,
//           'email': email,
//           'role': roleName,
//           'designation': designation,
//           'roleId': roleId
//         });
//         // print(role);

//         // print(uId);

//         print(table);
//         setState(() {
//           isLoading = false;
//         });
//       }
//     }
//   }

//   Future<void> addUser() async {
//     // Define your base URL
//     final String baseUrl = ApiConfig.baseUrl;

//     // Define your API key
//     final String apiKey = ApiConfig.apiKey;
//     final String bearer = ApiConfig.bearerToken;

//     // Define your request headers
//     Map<String, String> headers = {
//       'Content-Type': 'application/json',
//       'Authorization': bearer,
//       'apiKey': apiKey,
//     };

//     // Define your request body
//     Map<String, dynamic> body = {
//       "username": _userName.text,
//       "email": _Email.text,
//       "name": _Name.text,
//       "password": _Password.text,
//       "designation": _Designation.text,
//       "roleId": selectedRole
//     };

//     // Encode the request body to JSON
//     String requestBody = json.encode(body);

//     try {
//       // Make the POST request
//       http.Response response = await http.post(
//         Uri.parse('$baseUrl/api/auth/add-user'),
//         headers: headers,
//         body: requestBody,
//       );

//       // Check if the request was successful (status code 2xx)
//       if (response.statusCode >= 200 && response.statusCode < 300) {
//         print("User added successfully!");
//         clearFields();
//       } else {
//         // Print error message if request fails
//         print("Failed to add user: ${response.statusCode}");
//         print("Response: ${response.body}");
//       }
//     } catch (e) {
//       // Print any exceptions that occur during the request
//       print("Error adding user: $e");
//     }
//   }

//   Future<void> updateUser(int id) async {
//     setState(() {
//       isLoading = true;
//     });
//     // Define your API key
//     final String apiKey = ApiConfig.apiKey;
//     final String bearer = ApiConfig.bearerToken;
//     Map<String, String> headers = {
//       'Content-Type': 'application/json',
//       'Authorization': bearer,
//       'apiKey': apiKey,
//     };
//     Map<String, dynamic> body = {
//       "username": _userName.text,
//       "name": _Name.text,
//       "designation": _Designation.text,
//       "roleId": selectedRole
//     };
//     var response = await http.put(
//       Uri.parse('${ApiConfig.baseUrl}/api/auth/update-user/$id'),
//       headers: headers,
//       body: jsonEncode(body),
//     );
//     print(response.statusCode);
//     print(response.body);

//     getUsers();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: isLoading
//           ? Center(
//               child: CircularProgressIndicator(),
//             )
//           : Container(
//               decoration: BoxDecoration(
//                   color: Colors.white,
//                   boxShadow: [
//                     BoxShadow(
//                         color: Colors.grey.withOpacity(0.2),
//                         offset: const Offset(0, 2),
//                         blurRadius: 6.0)
//                   ],
//                   borderRadius: const BorderRadius.all(Radius.circular(10))),
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: ListView(
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: Text(
//                         isUpdate ? 'Update User' : 'Add New User',
//                         style: GoogleFonts.ubuntu(fontSize: 20),
//                       ),
//                     ),
//                     const Divider(),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     CustomeField(
//                       read: false,
//                       Controller: _userName,
//                       Title: 'User Name*',
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     CustomeField(
//                         read: false, Controller: _Name, Title: 'Name*'),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     CustomeField(
//                         read: false,
//                         Controller: _Designation,
//                         Title: 'Designation*'),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Drop(selectedRole, Roles, 'User Role*', (value) {
//                       setState(() {
//                         selectedRole = value;
//                         print(selectedRole);
//                       });
//                     }),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     CustomeField(
//                         read: isUpdate, Controller: _Email, Title: 'Email*'),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     isUpdate
//                         ? SizedBox(
//                             height: 2,
//                           )
//                         : passwordfield(
//                             Controller: _Password,
//                             show: IsShow,
//                             Title: 'Password',
//                           ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     isUpdate
//                         ? SizedBox(
//                             height: 2,
//                           )
//                         : passwordfield(
//                             Controller: _ConfirmPassword,
//                             show: IsShow,
//                             Title: 'Confirm Password',
//                           ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     isUpdate
//                         ? SizedBox(
//                             height: 2,
//                           )
//                         : CheckBox(),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     isUpdate
//                         ? SizedBox(
//                             height: 2,
//                           )
//                         : MultiSelectDropDown(
//                             showClearIcon: true,
//                             controller: _controller,
//                             onOptionSelected: (options) {
//                               debugPrint(options.toString());
//                             },
//                             options: ApiData.drawerListStationName,
//                             selectionType: SelectionType.multi,
//                             chipConfig:
//                                 const ChipConfig(wrapType: WrapType.wrap),
//                             dropdownHeight: 300,
//                             // optionGoogleFonts.ubuntu: const GoogleFonts.ubuntu(fontSize: 16),
//                             showChipInSingleSelectMode: true,
//                             selectedOptions: isChecked
//                                 ? ApiData.drawerListStationName
//                                 : ApiData.drawerSelectedStationName,
//                             selectedOptionIcon: const Icon(Icons.check_circle),
//                           ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Row(
//                       children: [
//                         isUpdate
//                             ? InkWell(
//                                 onTap: () async {
//                                   if (_userName.text.isNotEmpty &&
//                                       _Name.text.isNotEmpty &&
//                                       _Designation.text.isNotEmpty &&
//                                       selectedRole != null) {
//                                     await updateUser(id!);
//                                   } else {
//                                     Toaster().showsToast(
//                                         'Please fill all the fields',
//                                         Colors.red,
//                                         Colors.white);
//                                   }
//                                   // await CreateUser();
//                                   //   Users.add(_userName.text);
//                                   //   Names.add(_Name.text);
//                                   //   Roles.add(selectedRole);
//                                   //   email.add(_Email.text);
//                                   // });
//                                 },
//                                 child: Container(
//                                   height: 40,
//                                   width: 80,
//                                   decoration: const BoxDecoration(
//                                       color: Colors.lightBlue,
//                                       borderRadius: BorderRadius.all(
//                                           Radius.circular(10))),
//                                   child: Center(
//                                     child: Text(
//                                       'update',
//                                       style: GoogleFonts.ubuntu(
//                                           color: Colors.white),
//                                     ),
//                                   ),
//                                 ),
//                               )
//                             : InkWell(
//                                 onTap: () async {
//                                   if (_ConfirmPassword.text != _Password.text) {
//                                     Toaster().showsToast('password not match',
//                                         Colors.red, Colors.white);
//                                   } else {
//                                     if (_userName.text.isNotEmpty &&
//                                         _Name.text.isNotEmpty &&
//                                         _Email.text.isNotEmpty &&
//                                         _Designation.text.isNotEmpty &&
//                                         selectedRole != null &&
//                                         _Password.text.isNotEmpty) {
//                                       await addUser();
//                                     } else {
//                                       Toaster().showsToast(
//                                           'Please fill all the fields',
//                                           Colors.red,
//                                           Colors.white);
//                                     }
//                                   }
//                                   // await CreateUser();
//                                   //   Users.add(_userName.text);
//                                   //   Names.add(_Name.text);
//                                   //   Roles.add(selectedRole);
//                                   //   email.add(_Email.text);
//                                   // });
//                                 },
//                                 child: Container(
//                                   height: 40,
//                                   width: 80,
//                                   decoration: const BoxDecoration(
//                                       color: Colors.lightBlue,
//                                       borderRadius: BorderRadius.all(
//                                           Radius.circular(10))),
//                                   child: Center(
//                                     child: Text(
//                                       'Add',
//                                       style: GoogleFonts.ubuntu(
//                                           color: Colors.white),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                         const SizedBox(
//                           width: 8,
//                         ),
//                         InkWell(
//                           onTap: () {
//                             clearFields();
//                           },
//                           child: Container(
//                             height: 40,
//                             width: 80,
//                             decoration: BoxDecoration(
//                                 color: Colors.lightBlueAccent.withOpacity(0.8),
//                                 borderRadius: const BorderRadius.all(
//                                     Radius.circular(10))),
//                             child: Center(
//                               child: Text(
//                                 'Clear',
//                                 style: GoogleFonts.ubuntu(color: Colors.white),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       child: SingleChildScrollView(
//                         scrollDirection: Axis.horizontal,
//                         child: isLoading
//                             ? Center(
//                                 child: CircularProgressIndicator(),
//                               )
//                             : DataTable(
//                                 columnSpacing: 10,
//                                 columns: const [
//                                   DataColumn(
//                                       label: SizedBox(
//                                           width: 60,
//                                           child: Text(
//                                             'User',
//                                             softWrap: true,
//                                           ))),
//                                   DataColumn(
//                                       label: SizedBox(
//                                           width: 70,
//                                           child: Text(
//                                             'Name',
//                                             softWrap: true,
//                                           ))),
//                                   DataColumn(
//                                       label: SizedBox(
//                                           width: 75,
//                                           child: Text(
//                                             'Role',
//                                             softWrap: true,
//                                           ))),
//                                   DataColumn(label: Text('Email')),
//                                   DataColumn(label: Text('action')),
//                                 ],
//                                 rows: List.generate(table.length, (index) {
//                                   return DataRow(cells: [
//                                     // DataCell(Text(name ?? "")),
//                                     DataCell(Text(table[index]['uName'])),
//                                     DataCell(Center(
//                                         child: Text(table[index]['name']))),
//                                     DataCell(Center(
//                                         child: Text(table[index]['role']))),
//                                     DataCell(Center(
//                                         child: Text(table[index]['email']))),

//                                     DataCell(Row(
//                                       children: [
//                                         IconButton(
//                                           onPressed: () {
//                                             setState(() {
//                                               isUpdate = true;
//                                             });
//                                             editRow(table[index]);
//                                           },
//                                           icon: const Icon(
//                                             Icons.edit,
//                                             color: Colors.lightBlue,
//                                           ),
//                                         ),
//                                         IconButton(
//                                           onPressed: () {
//                                             DeleteUser(table[index]['id']);
//                                           },
//                                           icon: const Icon(
//                                             Icons.delete,
//                                             color: Colors.red,
//                                           ),
//                                         ),
//                                       ],
//                                     )),
//                                   ]);
//                                 })),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//     );
//   }

//   void editRow(Map<String, dynamic> index) {
//     setState(() {
//       id = index['id'];
//       // Update controllers and selected values with the values of the selected row
//       _userName.text = index['uName'];
//       _Name.text = index['name'];
//       _Designation.text = index['designation'];
//       _Email.text = index['email'];
//       selectedRole = index['roleId'];
//       // _Name.text = Names[index];
//       // selectedRole = roles[index];
//       // // _selectedDateTime = DateTime.parse(calidate[index]);
//       // _Email.text = email[index];
//     });
//   }

//   Widget CheckBox() {
//     return Row(
//       // mainAxisAlignment: MainAxisAlignment.center,
//       // crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const SizedBox(
//           width: 15,
//         ),
//         InkWell(
//           onTap: () {
//             setState(() {
//               isChecked = !isChecked;
//             });
//           },
//           child: Container(
//             height: 25,
//             width: 25,
//             decoration: BoxDecoration(
//                 borderRadius: const BorderRadius.all(Radius.circular(15)),
//                 border: Border.all(
//                     color: isChecked ? Colors.lightBlue : Colors.grey)),
//             child: Center(
//                 child: isChecked ? const Icon(Icons.check) : const SizedBox()),
//           ),
//         ),
//         const SizedBox(
//           width: 5,
//         ),
//         const Text('All Stations')
//       ],
//     );
//   }

//   void clearFields() {
//     setState(() {
//       _userName.clear();
//       _Name.clear();
//       // selectedRole = 'PMANAGER';
//       _Designation.clear();
//       _Email.clear();
//       _Password.clear();
//       _ConfirmPassword.clear();
//       // Clear other relevant state variables and controllers here
//     });
//   }

//   Widget Drop(
//     String? selectedValue,
//     List<dynamic> list,
//     String title,
//     void Function(String?)? onChanged,
//   ) {
//     return SizedBox(
//       height: 70,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(title),
//           Container(
//             height: 40,
//             decoration: BoxDecoration(
//               border: Border.all(color: Colors.grey.withOpacity(0.3)),
//               borderRadius: const BorderRadius.all(Radius.circular(15)),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.only(left: 8.0),
//               child: DropdownButtonFormField<String>(
//                 value: selectedValue,
//                 items: list.map((dynamic value) {
//                   return DropdownMenuItem<String>(
//                     value: value['id'].toString(),
//                     child: Text(value['name']),
//                   );
//                 }).toList(),
//                 onChanged: onChanged,
//                 decoration: const InputDecoration(
//                     hintText: '--Choose Role--',
//                     contentPadding: EdgeInsets.symmetric(vertical: 10),
//                     // enabledBorder: OutlineInputBorder(),
//                     border: InputBorder.none
//                     // OutlineInputBorder(
//                     //   borderRadius: BorderRadius.all(Radius.circular(10)),
//                     // ),
//                     ),
//                 // borderRadius: const BorderRadius.all(Radius.circular(10)),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

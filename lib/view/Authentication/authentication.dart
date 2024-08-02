import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Api Services/getStationSensors_Ids_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/image/back.jpg'),
                    fit: BoxFit.cover)),
            child: Center(
                child: Padding(
              padding: const EdgeInsets.all(22.0),
              child: Container(
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: 80,
                                width: 80,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/image/logo-1.png'),
                                        fit: BoxFit.fill)),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 80,
                                width: 80,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/image/logo-2.png'),
                                        fit: BoxFit.contain)),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 80,
                                width: 80,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/image/India_logo.png'),
                                        fit: BoxFit.fill)),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'Welcome to \nEnvironmental Data \nStudio',
                            style: TextStyle(
                                color: Colors.lightBlue, fontSize: 24),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            'Please use your credentials to login.',
                            style: TextStyle(fontSize: 15),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Flexible(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  color: Colors.grey.withOpacity(0.3)),
                              child: TextField(
                                controller: _usernameController,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.person_2_outlined),
                                  label: Text('Username'),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Flexible(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  color: Colors.grey.withOpacity(0.3)),
                              child: TextField(
                                controller: _passwordController,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.lock_open),
                                  label: Text('Password'),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          InkWell(
                            onTap: () async {
                              // LoginService().login(_usernameController.text,
                              //     _passwordController.text);
                              await GetSensorsByStationIdsService()
                                  .getAllSensorsByStation();
                              Get.toNamed('/home');
                            },
                            child: Container(
                              height: 50,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.lightBlue,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7)),
                              ),
                              child: Center(
                                  child: Text(
                                'Log In',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              )),
                            ),
                          )
                        ]),
                  ),
                ),
              ),
            )),
          ),
        ),
      ),
    );
  }
}

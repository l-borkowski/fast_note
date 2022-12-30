import 'dart:ui';

import 'package:flutter/material.dart';

String name = "";
DateTime dateAccount = DateTime(2022, 12, 30);

TextEditingController nameController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  static Route<AccountPage> route() {
    return MaterialPageRoute(
      builder: (context) => const AccountPage(),
    );
  }

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  void changeName() {
    setState(() {
      name = nameController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: const Icon(Icons.arrow_back_ios_new),
          ),
          title: const Text(
            'Ustawienia konta',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 24,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Row(
                children: [
                  const Text(
                    'Dane osobowe',
                    style: TextStyle(fontWeight: FontWeight.w100, fontSize: 32),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Text(
                    'Imię',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Expanded(child: SizedBox()),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => Dialog(
                          alignment: Alignment.bottomCenter,
                          child: Stack(
                            children: [
                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                                height: 220,
                                child: Column(
                                  children: [
                                    Text(
                                      "Zmien imię",
                                      textAlign: TextAlign.center,
                                      style:
                                          TextStyle(fontSize: 18, height: 1.5),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 10, 10, 10),
                                    ),
                                    SizedBox(
                                      width: double.infinity,
                                      height: 50,
                                      child: TextField(
                                        controller: nameController,
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Color.fromARGB(
                                              255, 250, 250, 250),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          hintText: 'Podaj imię',
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 120,
                                          child: ElevatedButton(
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            child: Text(
                                              "Anuluj",
                                              textAlign: TextAlign.left,
                                            ),
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Color.fromARGB(
                                                    255, 250, 250, 250),
                                                foregroundColor: Colors.black,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                )),
                                          ),
                                        ),
                                        Expanded(child: SizedBox()),
                                        SizedBox(
                                          width: 120,
                                          child: ElevatedButton(
                                            onPressed: () => {
                                              Navigator.pop(context),
                                              changeName()
                                            },
                                            child: Text(
                                              "Ok",
                                              textAlign: TextAlign.left,
                                            ),
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    Colors.lightBlue,
                                                foregroundColor: Colors.white,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                )),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    child: Text(
                      name,
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                    size: 18,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Text(
                    'Nazwisko',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(child: SizedBox()),
                  const Text(
                    'NazwiskoPrawo',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                    size: 18,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Divider(color: Colors.black),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Text(
                    'Email',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Expanded(child: SizedBox()),
                  const Text(
                    'EmailPrawo',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                    size: 18,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Text(
                    'Data',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Expanded(child: SizedBox()),
                  GestureDetector(
                    onTap: () async {
                      DateTime? newDate = await showDatePicker(
                        context: context,
                        initialDate: dateAccount,
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2023),
                      );
                      if (newDate == null) return;
                      setState(() {
                        dateAccount = newDate;
                      });
                    },
                    child: Text(
                      '${dateAccount.year}.${dateAccount.month}.${dateAccount.day}',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                    size: 18,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Divider(color: Colors.black),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Text(
                    'Zmień hasło',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Expanded(child: SizedBox()),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => Dialog(
                          alignment: Alignment.bottomCenter,
                          child: Stack(
                            children: [
                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                                height: 280,
                                child: Column(
                                  children: [
                                    Text(
                                      "Zmien imię",
                                      textAlign: TextAlign.center,
                                      style:
                                          TextStyle(fontSize: 18, height: 1.5),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 10, 10, 10),
                                    ),
                                    SizedBox(
                                      width: double.infinity,
                                      height: 50,
                                      child: TextField(
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Color.fromARGB(
                                              255, 250, 250, 250),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          hintText: 'Podaj stare hasło',
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    SizedBox(
                                      width: double.infinity,
                                      height: 50,
                                      child: TextField(
                                        controller: passwordController,
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Color.fromARGB(
                                              255, 250, 250, 250),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          hintText: 'Podaj nowe hasło',
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 120,
                                          child: ElevatedButton(
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            child: Text(
                                              "Anuluj",
                                              textAlign: TextAlign.left,
                                            ),
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Color.fromARGB(
                                                    255, 250, 250, 250),
                                                foregroundColor: Colors.black,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                )),
                                          ),
                                        ),
                                        Expanded(child: SizedBox()),
                                        SizedBox(
                                          width: 120,
                                          child: ElevatedButton(
                                            onPressed: () => {
                                              Navigator.pop(context),
                                              changeName()
                                            },
                                            child: Text(
                                              "Ok",
                                              textAlign: TextAlign.left,
                                            ),
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    Colors.lightBlue,
                                                foregroundColor: Colors.white,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                )),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                      size: 18,
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}

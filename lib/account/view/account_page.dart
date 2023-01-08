import 'package:flutter/material.dart';

String name = '';
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
              children: const [
                Text(
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
                const Expanded(child: SizedBox()),
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
                              padding:
                                  const EdgeInsets.fromLTRB(20, 20, 20, 20),
                              height: 220,
                              child: Column(
                                children: [
                                  const Text(
                                    'Zmien imię',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 18, height: 1.5),
                                  ),
                                  const Padding(
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
                                        fillColor: const Color.fromARGB(
                                          255,
                                          250,
                                          250,
                                          250,
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
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
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color.fromARGB(
                                              255,
                                              250,
                                              250,
                                              250,
                                            ),
                                            foregroundColor: Colors.black,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                          ),
                                          child: const Text(
                                            'Anuluj',
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                      ),
                                      const Expanded(child: SizedBox()),
                                      SizedBox(
                                        width: 120,
                                        child: ElevatedButton(
                                          onPressed: () => {
                                            Navigator.pop(context),
                                            changeName()
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.lightBlue,
                                            foregroundColor: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                          ),
                                          child: const Text(
                                            'Ok',
                                            textAlign: TextAlign.left,
                                          ),
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
                    style: const TextStyle(
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
              children: const [
                Text(
                  'Nazwisko',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(child: SizedBox()),
                Text(
                  'NazwiskoPrawo',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey,
                  size: 18,
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(color: Colors.black),
            const SizedBox(height: 10),
            Row(
              children: const [
                Text(
                  'Email',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Expanded(child: SizedBox()),
                Text(
                  'EmailPrawo',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                Icon(
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
                const Expanded(child: SizedBox()),
                GestureDetector(
                  onTap: () async {
                    final newDate = await showDatePicker(
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
                    style: const TextStyle(
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
            const Divider(color: Colors.black),
            const SizedBox(height: 10),
            Row(
              children: [
                const Text(
                  'Zmień hasło',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Expanded(child: SizedBox()),
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
                              padding:
                                  const EdgeInsets.fromLTRB(20, 20, 20, 20),
                              height: 360,
                              child: Column(
                                children: [
                                  const Text(
                                    'Zmien hasło',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 18, height: 1.5),
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    height: 50,
                                    child: TextField(
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: const Color.fromARGB(
                                          255,
                                          250,
                                          250,
                                          250,
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
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
                                      obscureText: true,
                                      controller: passwordController,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: const Color.fromARGB(
                                          255,
                                          250,
                                          250,
                                          250,
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        hintText: 'Podaj nowe hasło',
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  SizedBox(
                                    width: double.infinity,
                                    height: 50,
                                    child: TextField(
                                      obscureText: true,
                                      controller: passwordController,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: const Color.fromARGB(
                                          255,
                                          250,
                                          250,
                                          250,
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        hintText: 'Powtórz nowe hasło',
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
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color.fromARGB(
                                              255,
                                              250,
                                              250,
                                              250,
                                            ),
                                            foregroundColor: Colors.black,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                          ),
                                          child: const Text(
                                            'Anuluj',
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                      ),
                                      const Expanded(child: SizedBox()),
                                      SizedBox(
                                        width: 120,
                                        child: ElevatedButton(
                                          onPressed: () => {
                                            Navigator.pop(context),
                                            changeName()
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.lightBlue,
                                            foregroundColor: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                          ),
                                          child: const Text(
                                            'Ok',
                                            textAlign: TextAlign.left,
                                          ),
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
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                    size: 18,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

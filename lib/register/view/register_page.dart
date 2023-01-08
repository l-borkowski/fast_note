import 'package:flutter/material.dart';

TextEditingController name = TextEditingController();
TextEditingController lastName = TextEditingController();
TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();
TextEditingController password2 = TextEditingController();

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  static Route<RegisterPage> route() {
    return MaterialPageRoute(
      builder: (context) => const RegisterPage(),
    );
  }

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(Icons.arrow_back_ios_new),
        ),
        centerTitle: true,
        title: new Text(
          "Zarejestruj się",
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
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Email",
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 18,
                  height: 1.5,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(255, 250, 250, 250),
                hintText: 'Podaj email',
              ),
              controller: email,
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Column(
                  children: [
                    const SizedBox(
                      width: 150,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Imię",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 18,
                            height: 1.5,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(255, 250, 250, 250),
                          hintText: 'Podaj imię',
                        ),
                        controller: name,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 20),
                Column(
                  children: [
                    const SizedBox(
                      width: 150,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Nazwisko",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 18,
                            height: 1.5,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(255, 250, 250, 250),
                          hintText: 'Podaj nazwisko',
                        ),
                        controller: lastName,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Hasło",
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 18,
                  height: 1.5,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(255, 250, 250, 250),
                hintText: 'Podaj hasło',
              ),
              controller: password,
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Powtórz hasło",
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 18,
                  height: 1.5,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(255, 250, 250, 250),
                hintText: 'Powtórz hasło',
              ),
              controller: password2,
            ),
            const SizedBox(height: 40),
            SizedBox(
                width: 280,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Zarejestruj się",
                    style: TextStyle(
                      fontSize: 18,
                      height: 1.5,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff00658E),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                )),
            Expanded(child: SizedBox()),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 160,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color(0xffD3E7F7),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              children: [
                                Text(
                                  'Masz już konto?',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  'Zaloguj sie,  aby  tworzyć notatki i wysyłać je do chmury',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                SizedBox(
                                  width: 280,
                                  height: 40,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Zaloguj się teraz",
                                      style: TextStyle(
                                        fontSize: 16,
                                        height: 1.5,
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(0xffD3E7F7),
                                        foregroundColor: Colors.black,
                                        side: BorderSide(
                                            color: Color(0xff00658E)),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:my_app/account/cubit/account_cubit.dart';
import 'package:my_app/main/cubit/main_page_cubit.dart';
import 'package:repository/repository.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  static Route<AccountPage> route() {
    return MaterialPageRoute(
      builder: (context) => const AccountPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          AccountCubit(context.read<Repository>())..getAccountDetails(),
      child: const AccountView(),
    );
  }
}

class AccountView extends HookWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AccountCubit>().state;

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();

            context.read<MainPageCubit>().getNotes();
          },
          child: const Icon(Icons.arrow_back_ios_new),
        ),
        title: const Text(
          'Dane osobowe',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 24,
          ),
        ),
      ),
      body: state.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  AccountField(
                    title: 'Imię',
                    value: state.user!.firstName,
                  ),
                  const SizedBox(height: 20),
                  AccountField(
                    title: 'Nazwisko',
                    value: state.user!.lastName,
                  ),
                  const SizedBox(height: 10),
                  const Divider(color: Colors.black),
                  const SizedBox(height: 10),
                  AccountField(
                    title: 'Email',
                    value: state.user!.firstName,
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
                            initialDate: DateTime.now(), //dateAccount,
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2023),
                          );
                          if (newDate == null) return;
                          /* setState(() {
                      dateAccount = newDate;
                    }); */
                        },
                        child: Text(
                          '${state.user!.dateOfBirth.year}.${state.user!.dateOfBirth..month}.${state.user!.dateOfBirth.day}',
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
                        onTap: () {},
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

class AccountField extends HookWidget {
  const AccountField({
    required this.title,
    required this.value,
    super.key,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();
    return GestureDetector(
      onTap: () {},
      child: ColoredBox(
        color: Colors.transparent,
        child: Row(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            const Spacer(),
            Text(
              value,
              style: TextStyle(
                color: Colors.black.withOpacity(0.4),
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.grey,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }

  void _showDialog(BuildContext context, TextEditingController controller) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        alignment: Alignment.bottomCenter,
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
              height: 220,
              child: Column(
                children: [
                  const Text(
                    'Zmien imię',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, height: 1.5),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: TextField(
                      controller: controller,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromARGB(
                          255,
                          250,
                          250,
                          250,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
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
                          onPressed: () => Navigator.pop(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(
                              255,
                              250,
                              250,
                              250,
                            ),
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
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
                            /* changeName() */
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightBlue,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
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
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:my_app/account/cubit/account_cubit.dart';
import 'package:my_app/login/cubit/login_cubit.dart';
import 'package:my_app/main/cubit/main_page_cubit.dart';
import 'package:my_app/register/view/register_page.dart';
import 'package:repository/repository.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static Route<LoginPage> route() {
    return MaterialPageRoute(
      builder: (context) => const LoginPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(context.read<Repository>()),
      child: const LoginView(),
    );
  }
}

class LoginView extends HookWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();

            context.read<MainPageCubit>().getNotes();
          },
          child: const Icon(Icons.arrow_back_ios_new),
        ),
        centerTitle: true,
        title: const Text(
          'Zaloguj się',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 24,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          LoginForm(),
          SizedBox(height: 250),
          RegisterModal(),
        ],
      ),
    );
  }
}

class LoginForm extends HookWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final loginController = useTextEditingController();
    final passwordController = useTextEditingController();

    final cubit = context.read<LoginCubit>();
    final state = context.watch<LoginCubit>().state;
    final accountcubit = context.read<AccountCubit>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        const Text(
          'Email',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        TextField(
          decoration: const InputDecoration(
            filled: true,
            fillColor: Color.fromARGB(255, 250, 250, 250),
            hintText: 'Podaj email',
          ),
          controller: loginController,
          onChanged: cubit.emailChanged,
        ),
        const SizedBox(height: 20),
        const Text(
          'Hasło',
          textAlign: TextAlign.right,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        TextField(
          obscureText: true,
          decoration: const InputDecoration(
            filled: true,
            fillColor: Color.fromARGB(255, 250, 250, 250),
            hintText: 'Podaj hasło',
          ),
          controller: passwordController,
          onChanged: cubit.passwordChanged,
        ),
        const SizedBox(height: 40),
        Center(
          child: SizedBox(
            width: 280,
            height: 50,
            child: ElevatedButton(
              onPressed: () async {
                final success = await cubit.login();
                accountcubit.loggedIn = success;
                if (success) {
                  context.read<MainPageCubit>().getNotes();
                  Navigator.of(context).pop();
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff00658E),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: state.isLoading
                  ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : const Text(
                      'Zaloguj się',
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),
            ),
          ),
        ),
      ],
    );
  }
}

class RegisterModal extends StatelessWidget {
  const RegisterModal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(bottom: 30),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xffD3E7F7),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Nie masz jeszcze konta?',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Text(
            'Zarejestruj sie,  aby  tworzyć notatki i wysyłać je do chmury',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 40,
            child: ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                RegisterPage.route(),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffD3E7F7),
                foregroundColor: Colors.black,
                side: const BorderSide(
                  color: Color(0xff00658E),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Zarejestruj się teraz',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

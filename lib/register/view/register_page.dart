import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:my_app/register/cubit/register_cubit.dart';
import 'package:repository/repository.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  static Route<RegisterPage> route() {
    return MaterialPageRoute(
      builder: (context) => const RegisterPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(context.read<Repository>()),
      child: const RegisterView(),
    );
  }
}

class RegisterView extends HookWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(Icons.arrow_back_ios_new),
        ),
        centerTitle: true,
        title: const Text(
          'Zarejestruj się',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 24,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: const [
            RegisterForm(),
            Spacer(),
            LoginModal(),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class RegisterForm extends HookWidget {
  const RegisterForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RegisterCubit>();
    final state = context.watch<RegisterCubit>().state;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        AppField(
          'Email',
          hint: 'Podaj email',
          onChanged: cubit.emailChanged,
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 6,
              child: AppField(
                'Imię',
                hint: 'Podaj imię',
                onChanged: cubit.firstNameChanged,
              ),
            ),
            const Spacer(),
            Flexible(
              flex: 8,
              child: AppField(
                'Nazwisko',
                hint: 'Podaj nazwisko',
                onChanged: cubit.lastNameChanged,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        AppField(
          'Hasło',
          hint: 'Podaj hasło',
          onChanged: cubit.passwordChanged,
          secret: true,
        ),
        const SizedBox(height: 20),
        AppField(
          'Powtórz hasło',
          hint: 'Powtórz hasło',
          onChanged: cubit.password2Changed,
          secret: true,
        ),
        const SizedBox(height: 40),
        Center(
          child: SizedBox(
            width: 280,
            height: 50,
            child: ElevatedButton(
              onPressed: () async {
                final result = await cubit.register();
                if (result) {
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
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text(
                      'Zarejestruj się',
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

class AppField extends HookWidget {
  const AppField(
    this.title, {
    required this.hint,
    required this.onChanged,
    this.secret = false,
    super.key,
  });

  final String title;
  final String hint;
  final void Function(String) onChanged;
  final bool secret;

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color.fromARGB(255, 250, 250, 250),
            hintText: hint,
          ),
          controller: controller,
          onChanged: onChanged,
          obscureText: secret,
        ),
      ],
    );
  }
}

class LoginModal extends StatelessWidget {
  const LoginModal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
        color: Color(0xffD3E7F7),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Masz już konto?',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
          const Text(
            'Zaloguj sie,  aby  tworzyć notatki i wysyłać je do chmury',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: 280,
            height: 40,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffD3E7F7),
                foregroundColor: Colors.black,
                side: const BorderSide(color: Color(0xff00658E)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Zaloguj się teraz',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

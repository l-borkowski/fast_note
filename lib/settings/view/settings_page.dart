import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/account/view/account_page.dart';
import 'package:my_app/l10n/l10n.dart';
import 'package:my_app/settings/cubit/settings_cubit.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  static Route<SettingsPage> route() {
    return MaterialPageRoute(
      builder: (context) => const SettingsPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SettingsCubit(),
      child: const SettingsView(),
    );
  }
}

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsCubit = context.read<SettingsCubit>();
    final settingsState = context.watch<SettingsCubit>().state;

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(Icons.arrow_back_ios_new),
        ),
        title: const Text(
          'Ustawienia',
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
            SettingItem(
              icon: Icons.account_circle_rounded,
              text: 'Konto',
              onTap: () => Navigator.of(context).push(
                AccountPage.route(),
              ),
              actions: Row(
                children: [
                  Text(
                    'placeholder',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(0.4),
                    ),
                  ),
                  const Icon(Icons.arrow_forward_ios_rounded)
                ],
              ),
            ),
            const SizedBox(height: 20),
            SettingItem(
              icon: Icons.dark_mode,
              text: 'Ciemny motyw',
              onTap: () {},
              actions: Switch(
                value: settingsState.darkMode,
                onChanged: settingsCubit.changeTheme,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingItem extends StatelessWidget {
  const SettingItem({
    required this.icon,
    required this.text,
    required this.onTap,
    required this.actions,
    super.key,
  });

  final IconData icon;
  final String text;
  final VoidCallback onTap;
  final Widget actions;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ColoredBox(
        color: Colors.transparent,
        child: Row(
          children: [
            Icon(
              icon,
              size: 26,
            ),
            const SizedBox(width: 15),
            Text(
              text,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            actions
          ],
        ),
      ),
    );
  }
}

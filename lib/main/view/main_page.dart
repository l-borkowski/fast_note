// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:my_app/l10n/l10n.dart';
import 'package:my_app/main/main.dart';
import 'package:my_app/settings/view/settings_page.dart';
import 'package:my_app/account/view/account_page.dart';
import 'package:my_app/utils/extensions/datetime_x.dart';
import 'package:repository/repository.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MainPageCubit(context.read<Repository>()),
      child: const MainView(),
    );
  }
}

class MainView extends HookWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    final pageCubit = context.read<MainPageCubit>();
    final pageState = context.watch<MainPageCubit>().state;
    useMemoized(() {
      pageCubit.init();
    });

    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.of(context).push(
            SettingsPage.route(),
          ),
          child: const ColoredBox(
            color: Colors.transparent,
            child: Icon(Icons.settings),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () => Navigator.of(context).push(
              AccountPage.route(),
            ),
            child: const ColoredBox(
              color: Colors.transparent,
              child: Icon(Icons.account_circle_outlined),
            ),
          ),
          const SizedBox(width: 20),
        ],
        title: const Center(
          child: Text(
            'FastNote',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 24,
            ),
          ),
        ),
      ),
      body: pageState.isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: pageState.notes?.length ?? 0,
                itemBuilder: (context, index) {
                  final note = pageState.notes!.elementAt(index);
                  return NoteTile(
                    title: note.title,
                    desc: note.body,
                    date: note.date,
                  );
                },
              ),
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xffD3E7F7),
        onPressed: () => () {},
        child: const Icon(
          Icons.add,
          size: 48,
          color: Color(0xff00658e),
        ),
      ),
    );
  }
}

class NoteTile extends StatelessWidget {
  const NoteTile({
    required this.title,
    required this.desc,
    required this.date,
    this.color,
    super.key,
  });

  final String title;
  final String desc;
  final DateTime date;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 7.5),
      width: double.infinity,
      constraints: const BoxConstraints(
        minHeight: 110,
        maxHeight: 135,
      ),
      decoration: BoxDecoration(
        color: color ?? const Color(0xffD3E7F7),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: Color(0xff1A1C1E),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              desc,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Color(0xff1A1C1E),
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 10),
            Text(
              date.toNoteDate,
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 10,
                color: const Color(0xff1A1C1E).withOpacity(0.6),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

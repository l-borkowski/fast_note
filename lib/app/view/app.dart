// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:api/api.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/account/cubit/account_cubit.dart';
import 'package:my_app/l10n/l10n.dart';
import 'package:my_app/main/main.dart';
import 'package:provider/provider.dart';
import 'package:repository/repository.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://note-api-app.azurewebsites.net/api/',
      ),
    );

    final dataSource = DataSource(dio);
    final repository = Repository(dataSource);

    final textTheme = Theme.of(context).textTheme;
    return RepositoryProvider(
      create: (context) => repository,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AccountCubit>(
            create: (context) => AccountCubit(repository),
          ),
          BlocProvider<MainPageCubit>(
            create: (context) => MainPageCubit(repository),
          ),
        ],
        child: MaterialApp(
          theme: ThemeData(
            useMaterial3: true,
            textTheme: GoogleFonts.poppinsTextTheme(textTheme),
          ),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: const MainPage(),
        ),
      ),
    );
  }
}

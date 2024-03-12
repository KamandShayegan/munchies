import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:munch/cubit/app_cubit_states.dart';
import 'package:munch/cubit/app_cubits.dart';
import 'package:munch/pages/detail_page.dart';
import 'package:munch/pages/navbar_pages/main_page.dart';
import 'package:munch/pages/welcome_page.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({Key? key}) : super(key: key);

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubit, CubitState>(
        builder: (context, state) {
          if (state is WelcomeState) {
            return const WelcomePage();
          } else if (state is MainPageState) {
            return const MainPage();
          } else if (state is DetailPageState) {
            return const DetailPage();
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

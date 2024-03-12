import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:munch/cubit/app_cubit_logics.dart';
import 'package:munch/cubit/app_cubits.dart';
import 'package:munch/pages/detail_page.dart';
import 'package:munch/pages/navbar_pages/main_page.dart';
import 'package:munch/pages/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (_) => AppCubit(),
        child: const AppCubitLogics(),
      ),
    );
  }
}

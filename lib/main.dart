import 'package:flutter/material.dart';
import 'package:flutter_application_5/screens/counter.dart';
import 'package:flutter_application_5/cubit/counter_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // SIXTH: PROVIDE CUBIT TO ALL WIDGETS
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>CounterCubit(),
      child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const CounterApp()),
    );
  }
}

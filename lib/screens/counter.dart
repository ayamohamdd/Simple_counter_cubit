import 'package:flutter/material.dart';
import 'package:flutter_application_5/cubit/counter_cubit.dart';
import 'package:flutter_application_5/cubit/counter_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterApp extends StatefulWidget {
  const CounterApp({super.key});

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  int count = 0;
  @override
  // SECOND: BUILDING UI
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var width = size.width;
    var height = size.height;
    // SEVENTH: BLOC CONSUMER
    return BlocConsumer<CounterCubit, CounterStates>(
      listener: (context, state) {
        if (state is CounterIncrementState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Incremented!")));
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Decremented!")));
        }
      },
      builder: (context, state) {
        count = BlocProvider.of<CounterCubit>(context).count;
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              "Counter App",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: EdgeInsets.only(top: 0.15 * height),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 0.7 * width,
                    height: 0.3 * height,
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(colors: [
                          Color.fromARGB(255, 224, 105, 8),
                          Color.fromARGB(216, 255, 193, 7),
                        ]),
                        color: const Color.fromARGB(216, 255, 193, 7),
                        borderRadius: BorderRadius.circular(30.0)),
                    child: Center(
                      child: Text(
                        '$count',
                        style:
                            const TextStyle(fontSize: 80, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: .23 * width,
                        height: .066 * height,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 46, 46, 46),
                            borderRadius: BorderRadius.circular(20)),
                        child: IconButton(
                          iconSize: 30,
                          icon: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            BlocProvider.of<CounterCubit>(context)
                                .incrementCounter();
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: .23 * width,
                        height: .066 * height,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 46, 46, 46),
                            borderRadius: BorderRadius.circular(20)),
                        child: IconButton(
                          iconSize: 30,
                          icon: const Icon(
                            Icons.remove,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            BlocProvider.of<CounterCubit>(context)
                                .decrementCounter();
                          },
                        ),
                      ),
                    ],
                  ),
                ]),
          ),
        );
      },
    );
  }
}

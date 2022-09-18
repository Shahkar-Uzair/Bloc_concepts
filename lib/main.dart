import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_concepts/cubit/counter_cubit_cubit.dart';
import 'package:equatable/equatable.dart';

void main() {
  final CounterCubitState counterCubitState1 =
      CounterCubitState(counterValue: 1, wasIncremented: false);
  final CounterCubitState counterCubitState2 =
      CounterCubitState(counterValue: 1, wasIncremented: false);

  //should return true
  print(counterCubitState1 == counterCubitState2);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //This is how we use BlocProvider
    return BlocProvider(
      create: (context) => CounterCubitCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              // This how we use BlocConsumer where we implement the builder
              // functionality of blocbuilder and listner functionality of
              //bloclistner
              BlocConsumer<CounterCubitCubit, CounterCubitState>(
                listener: (context, state) {
                  if (state.wasIncremented == true) {
                    Scaffold.of(context).showBottomSheet(
                      (context) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'Incremented!',
                              style: TextStyle(
                                fontSize: 24.0,
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  } else if (state.wasIncremented == false) {
                    Scaffold.of(context).showBottomSheet(
                      (context) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'Decremented!',
                              style: TextStyle(
                                fontSize: 24.0,
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                builder: (context, state) {
                  //to access countervalue you have to use state keyword
                  if (state.counterValue < 0) {
                    return Text(
                      'Negative ${state.counterValue}',
                      style: Theme.of(context).textTheme.headline4,
                    );
                  } else {
                    return Text(
                      'Positive ${state.counterValue}',
                      style: Theme.of(context).textTheme.headline4,
                    );
                  }
                },
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      //syntax to call decrement method of CounterCubitCubit class
                      BlocProvider.of<CounterCubitCubit>(context).decrement();
                    },
                    tooltip: 'Decrement',
                    child: const Icon(Icons.remove),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      BlocProvider.of<CounterCubitCubit>(context).increment();
                    },
                    tooltip: 'Increment',
                    child: const Icon(Icons.add),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

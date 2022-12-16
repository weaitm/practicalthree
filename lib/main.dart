import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson3/cubit/click_cubit.dart';
import 'package:lesson3/cubit/setting_cubit.dart';

import 'cubit/list_view_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SettingCubit()),
        BlocProvider(
          create: (context) => ClickCubit(),
        ),
        BlocProvider(create: (context) => ListViewCubit()),
      ],
      child: BlocBuilder<SettingCubit, ThemeData>(builder: (context, state) {
        return MaterialApp(
          theme: state,
          home: const MyHomePage(),
        );
      }),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BlocBuilder<ClickCubit, ClickState>(
                builder: (context, state) {
                  if (state is ClickError) {
                    return Text(state.message);
                  }

                  if (state is Click) {
                    return Text(state.count.toString());
                  }

                  return const Text('Нажмите на кнопку');
                },
              ),
              BlocBuilder<ListViewCubit, List<String>>(
                builder: (context, state) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Text(
                            state[index],
                          ),
                        );
                      },
                    ),
                  );
                },
              )
            ],
          ),
        ),
        floatingActionButton: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(69, 0, 0, 0),
              child: FloatingActionButton(
                onPressed: () {
                  context
                      .read<ClickCubit>()
                      .Increment(Theme.of(context).brightness);
                  context
                      .read<ListViewCubit>()
                      .add(context.read<ClickCubit>().data.toString());
                },
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
            ),
            Container(
              child: FloatingActionButton(
                onPressed: () {
                  context
                      .read<ClickCubit>()
                      .Decrement(Theme.of(context).brightness);
                  context
                      .read<ListViewCubit>()
                      .add(context.read<ClickCubit>().data.toString());
                },
                tooltip: 'Decrement',
                child: const Icon(Icons.remove),
              ),
            ),
            Container(
              margin: EdgeInsets.all(5),
              child: FloatingActionButton(
                onPressed: () {
                  context.read<SettingCubit>().toggleTheme();
                },
                tooltip: 'Switch theme',
                child: const Icon(Icons.brightness_medium),
              ),
            ),
          ],
        ));
  }
}

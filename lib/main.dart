import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_infinite_scroll/pages/photo_list_page.dart';
import 'package:redux_infinite_scroll/redux/reducers.dart';
import 'package:redux_infinite_scroll/resources/text.dart';
import 'package:redux_thunk/redux_thunk.dart';

import 'redux/state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final store = Store(appReducer,
      initialState: AppState.initialState(), middleware: [thunkMiddleware]);

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: title,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: PhotoListPage(),
      ),
    );
  }
}

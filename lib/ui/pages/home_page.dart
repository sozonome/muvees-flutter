import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:muvees/core/config/routes/routes.dart';

class MyHomePageParams {
  const MyHomePageParams({
    this.title = '',
    this.isDeepLink = false,
  });

  final String title;
  final bool isDeepLink;
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    required this.params,
    Key? key,
  }) : super(key: key);

  final MyHomePageParams params;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    _navigate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.params.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _navigate() {
    context.go(
      AppRoute.home,
      extra: const MyHomePageParams(isDeepLink: false, title: 'Hello'),
    );
  }
}

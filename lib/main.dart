import 'package:flutter/material.dart';

void main() {
  print('Running main');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('MyApp build()');
    return MaterialApp(
      debugShowMaterialGrid: true,
      title: 'Flutter Demo Lifecycle App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Lifecycle App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() {
    print('MyHomePage createState()');
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  int _counter = 0;
  bool showButton = false;

  void _incrementCounter() {
    setState(() {
      print('_MyHomePageState _incrementCounter() setState()');
      _counter++;
    });
  }

  @override
  void setState(VoidCallback fn) {
    print('_MyHomePageState setState()');
    super.setState(fn);
  }

  @override
  void initState() {
    print('_MyHomePageState initState()');
    super.initState();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('_MyHomePageState didChangeDependencies()');
  }

  @override
  void activate() {
    super.activate();
    print('_MyHomePageState activate()');
  }

  @override
  void didUpdateWidget(MyHomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('_MyHomePageState didUpdateWidget()');
  }

  @override
  void deactivate() {
    print('_MyHomePageState deactivate()');
    super.deactivate();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void reassemble() {
    super.reassemble();
    print('_MyHomePageState reassemble()');
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print(state);
    switch (state) {
      case AppLifecycleState.paused:
        print('_MyHomePageState paused');
        break;
      case AppLifecycleState.resumed:
        print('_MyHomePageState resumed');
        break;
      case AppLifecycleState.detached:
        print('_MyHomePageState detached');
        break;
      case AppLifecycleState.inactive:
        print('_MyHomePageState inactive');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    print('_MyHomePageState build()');
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      showButton = !showButton;
                    });
                  },
                  child: const Text('Show/Hide Button'),
                ),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                    onPressed: _incrementCounter,
                    child: const Text('Increment counter')),
              ],
            ),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            if (showButton) const MyDeactivatingWidget()
          ],
        ),
      ),
    );
  }
}

class MyDeactivatingWidget extends StatefulWidget {
  const MyDeactivatingWidget({Key? key}) : super(key: key);

  @override
  State<MyDeactivatingWidget> createState() => _MyDeactivatingWidgetState();
}

class _MyDeactivatingWidgetState extends State<MyDeactivatingWidget>
    with WidgetsBindingObserver {
  @override
  void setState(VoidCallback fn) {
    print('_MyDeactivatingWidgetState setState()');
    super.setState(fn);
  }

  @override
  void initState() {
    print('_MyDeactivatingWidgetState initState()');
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('_MyDeactivatingWidgetState didChangeDependencies()');
  }

  @override
  void activate() {
    super.activate();
    print('_MyDeactivatingWidgetState activate()');
  }

  @override
  void didUpdateWidget(MyDeactivatingWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('_MyDeactivatingWidgetState didUpdateWidget()');
  }

  @override
  void deactivate() {
    print('_MyDeactivatingWidgetState deactivate()');
    super.deactivate();
  }

  @override
  void dispose() {
    print('_MyDeactivatingWidgetState dispose()');
    super.dispose();
  }

  @override
  void reassemble() {
    super.reassemble();
    print('_MyDeactivatingWidgetState reassemble()');
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print(state);
    switch (state) {
      case AppLifecycleState.paused:
        print('_MyDeactivatingWidgetState paused');
        break;
      case AppLifecycleState.resumed:
        print('_MyDeactivatingWidgetState resumed');
        break;
      case AppLifecycleState.detached:
        print('_MyDeactivatingWidgetState detached');
        break;
      case AppLifecycleState.inactive:
        print('_MyDeactivatingWidgetState inactive');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    print('_MyDeactivatingWidgetState build()');
    return ElevatedButton(
      onPressed: () {},
      child: const Text('Deactivating widget'),
    );
  }
}

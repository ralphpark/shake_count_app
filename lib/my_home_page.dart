
import 'package:flutter/material.dart';
import 'package:shake/shake.dart';
import 'package:velocity_x/velocity_x.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>  { // 위젯바인딩옵저버를 mixin으로 넣어줘야 한다.
  int _counter = 0;

  @override
  void initState() {
    ShakeDetector.autoStart(onPhoneShake: () { // detector가 필요없을때 지워주면 된다.
      setState(() {
        _counter++;
      });
    },
    shakeThresholdGravity: 1.1,
    );
    super.initState();
  }
// 디텍터가 없지만 dispose를 사용해야 할때 호출을 해줘야 한다.

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            '흔들어서 카운트를 올려보세요'
                .text
                .size(20)
                .color(Colors.cyan)
                .bold
                .white
                .black
                .isIntrinsic
                .makeCentered()
                .box
                .withRounded(value: 30)
                .color(Colors.lightGreen)
                .height(150)
                .make()
                .pOnly(top: 50, bottom: 20, left: 20, right: 20),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.displayLarge,
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
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {

  }
}

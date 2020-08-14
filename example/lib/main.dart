import 'package:flutter/material.dart';
import 'package:stylex/stylex.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StyleX',
      home: StyleStore(
        style: StyleX({'theme': 'light', 'app-primary-color': '#F25ADA'}),
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final style = context.style;
    final color = style.get<Color>('app-primary-color');

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(width: 64, height: 64, color: color),
            RaisedButton(onPressed: () {
              setState(() {
                context.style = StyleX({'app-primary-color': Colors.red});
              });
            })
          ],
        ),
      ),
    );
  }
}

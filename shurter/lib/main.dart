import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shurter/providers/MainProvider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var timer=CounterTimer();
  var table=AnimContainer();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text("舒尔特方格"),
       ),
       body: MultiProvider(
         providers: [ChangeNotifierProvider(
           builder: (context)=>MainProvider(),
         )],
         child: Column(
             children: <Widget>[
               SizedBox(height: 5,),
               SizedBox(height: 450,child: table,),
               timer,
             ],
           ),
       ),
       );
  }
}

//return sizebox.child.
class AnimContainer extends StatefulWidget {
  @override
  _AnimContainerState createState() => _AnimContainerState();
}

class _AnimContainerState extends State<AnimContainer> 
with TickerProviderStateMixin{
  List<AnimationController>controllers;
  List<Animation<Color>>animations;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controllers=List<AnimationController>();
    animations=List<Animation<Color>>();
  }
  @override
  Widget build(BuildContext context) {
    MainProvider provider=Provider.of<MainProvider>(context);
    int count =provider.totalCell;
    
    List.generate(count, (index)=>{
      controllers.add(AnimationController(
        duration: Duration(milliseconds: 100),
        vsync: this,
      )),
      animations.add(
        ColorTween(begin: Colors.white,end: Colors.red).
        animate(controllers[index])
        ..addListener((){setState(() {});}))
    });


    provider.animations=animations;
    provider.controllers=controllers;
    return GridView.count(
      crossAxisCount: sqrt(count).round(),
      children: List.generate(provider.totalCell, (index)=>
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: provider.animations[index].value,
            border: Border.all(width: 1),
            ),
          child: Container(
            child: FlatButton(
              padding: EdgeInsets.all(count==25?10:20),
              child: Text("${provider.data[index]}",
                          style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal),
                          ),
              onPressed: (){
                

              },
            ),
            
          ),
          )
      ),
    );
  }
}






//return sizebox;
class CounterTimer extends StatefulWidget {
  @override
  _CounterTimerState createState() => _CounterTimerState();
}

class _CounterTimerState extends State<CounterTimer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 100,child: Text("7777"),);
  }
}
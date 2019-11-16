import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyHome();
  }
}
class MyHome extends StatefulWidget {
  MyHome({Key key}) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> 
                with TickerProviderStateMixin{
  TabController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller=TabController(length: 3,vsync: this,initialIndex: 1);
  }
  @override
  Widget build(BuildContext context) {
    TextStyle bigText=TextStyle(fontSize: 20,color: Colors.redAccent);
    TextStyle smallText=TextStyle(fontSize: 10,color: Colors.greenAccent);
    return MaterialApp(
      title: "Demo",
      home: Scaffold(
        appBar:AppBar(
          //leading: Icon(Icons.arrow_back),
          bottom: TabBar(tabs: <Widget>[

              Tab(child: Text("Name"),),
              Tab(child: Text("Show"),),
              Tab(child: Text("Pict"),),
            ],
            labelStyle: bigText,
            labelColor: Colors.redAccent,
            unselectedLabelStyle: smallText,
            unselectedLabelColor: Colors.black,
            controller: _controller,
            indicatorWeight: 2,
            indicatorPadding: EdgeInsets.symmetric(horizontal: 30),
            ),
          title:Container(
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(15)),
            padding: EdgeInsets.only(left: 15),
            child:TextField(
              decoration: InputDecoration(
                hintText: "Input Search",
                border: InputBorder.none,
                icon:Icon(Icons.search,
                color: Colors.white)
                )
              ),
            ),
            actions: <Widget>[
              IconButton(icon: Icon(Icons.airplay), onPressed: () {},)
            ],
          ),
          body:TabBarView(children: <Widget>[
          Center(
            child:Container(child: Text("1",style: TextStyle(fontSize: 90),),),
            ),
          Center(
            child:Container(
              child:genContentList(),)

            ),
          Center(
            child:Container(child: Text("3",style: TextStyle(fontSize: 40),),),
            ),
        ],
        controller: _controller,
        ) 
      ,),
    );
  }
}

class Content {
  String title;
  String subTitle;
  String avatrUrl;
  String userName;
  String userDesc;
  Content(){
    title="title";
    subTitle="subTile";
    avatrUrl="https://upload.jianshu.io/users/upload_avatars/9192236/589ca546-0537-4f40-b64f-7b7f398d7fe0?imageMogr2/auto-orient/strip|imageView2/1/w/240/h/240";
    userName="Name";
    userDesc="Desc";
  }
}

genContentList(){
  Content content =Content();
  List<Content>list =List<Content>();
  List.generate(20, (index){
    list.add(content);
  });
  return ListView.builder(
    itemCount: list.length,
    itemBuilder: (BuildContext context,int index){
      return Container(
        padding: EdgeInsets.all(10),
        child: ListTile
        (
          title: Text(content.title),
          subtitle: Row(
            children: <Widget>[
              Container(
                width: 25,
                height: 25,
                child: CircleAvatar(backgroundImage: NetworkImage(content.avatrUrl),),
              ),
              Text(
                content.userName,
                style:TextStyle(
                  color: Colors.yellow,fontWeight: FontWeight.bold,fontSize: 20
                ) ,
              ),
              Text(content.userDesc),
              
            ],
          ),
        ),
      );
    },
  );
}
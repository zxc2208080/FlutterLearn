import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainProvider extends ChangeNotifier {
  //时间有关参数
  Timer timer;
  double totalTime;
  bool ifStarted;

  //方格有关参数
  int totalCell=0;
  int count=25;

  //格子颜色控制
  List<Color> conColor=List<Color>();   //初始颜色
  List<int> data=List<int>();
  List<int> curSel=List<int>();
  //方格动画
  List<Animation<Color>>animations;
  List<AnimationController>controllers;
  
  MainProvider(){
    //定义方格数量与颜色
    totalCell=count;
    List.generate(totalCell, (index){
      data.add(index+1);
      conColor.add((Colors.white));
    });
    data.shuffle();
    //curSel=List<int>();
    //定义时间
    //totalTime=0.0;
    //timer.cancel();
    //ifStarted=false;
    // animations=List<Animation<Color>>();
    // List.generate(totalCell, (index){
    //   animations.add(ColorTween(begin: Colors.white,end: Colors.red).animate(controllers[index]));
    // });
    }
    

}
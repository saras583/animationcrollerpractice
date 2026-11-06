import 'package:flutter/material.dart';

class Animationsecondscreen extends StatefulWidget {
  const Animationsecondscreen({super.key});

  @override
  State<Animationsecondscreen> createState() => _AnimationsecondscreenState();
}

class _AnimationsecondscreenState extends State<Animationsecondscreen> with SingleTickerProviderStateMixin{

  late final AnimationController controller;
  late final Animation<double> animation;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = AnimationController(vsync: this,duration: Duration(milliseconds: 200));

    animation = Tween<double>(begin: 0,end: 200).animate(controller);

  }

  @override
  void dispose() {
controller.dispose();
    super.dispose();
  }
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),
      body: Column(
        children: [
          AnimatedBuilder(animation: animation, builder: (context,child){
            return Align(
              alignment: Alignment.centerLeft,
              child: Transform.translate(offset: Offset(animation.value, 0),child: child,),
            );
          },child: Icon(Icons.directions_bike),),

          Wrap(children: [
            ElevatedButton(onPressed: ()=> controller.forward(), child: Text(''))
          ],)
        ],
      ),
    );
  }
}
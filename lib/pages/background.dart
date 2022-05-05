import 'package:flutter/material.dart';

class Background extends StatefulWidget {
  const Background({ Key? key }) : super(key: key);

  @override
  State<Background> createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('img/t.png'),
          fit: BoxFit.fill,
          colorFilter: ColorFilter.mode(Color.fromARGB(255, 255, 255, 255).withOpacity(0.3),BlendMode.dstATop)
        )
      ),
      
    );
  }
}
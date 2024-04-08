import 'package:flutter/material.dart';


class EmptyTaskScreen extends StatelessWidget{
  const EmptyTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Image(image: AssetImage(
            'assets/images/gambar.jpg'
            ),
            height: 200,
            ),
        ],),
    );
  }
}
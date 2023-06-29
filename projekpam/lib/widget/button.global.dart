import 'package:flutter/material.dart';
import 'package:projekpam/utils/global.colors.dart';

class ButtonGlobal extends StatelessWidget {
  const ButtonGlobal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        print('Login');
      },
      child: Container(
        alignment: Alignment.center,
        height: 55,
        decoration: BoxDecoration(
          color: GlobalColors.mainColor,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(color:Colors.black.withOpacity(0.1),
              blurRadius:10,
              ),
            ],//boxShadow
          ),//boxDecoration
          child:Text(
            'Sign In',
            style:TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),//TextStyle
          ),//text
      ),//Container
    );//center
  }
}

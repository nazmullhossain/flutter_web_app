import 'package:flutter/material.dart';
import 'package:flutterweb/data/header_items.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key,required this.itemScrollController});
  final ItemScrollController itemScrollController;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView.separated(itemBuilder: (context,index){
      return ListTile(
        onTap: (){
      itemScrollController.scrollTo(index: headerItems[index].index,
          duration: Duration(seconds: 1));
      Navigator.pop(context);
        },
        title: Text(headerItems[index].title,
        style: TextStyle(color: Colors.white,),),

      );
        },
            separatorBuilder: (context,index)=>SizedBox(height: 12,),
            itemCount: headerItems.length),
      ),
    );
  }
}
//note apd to knwno aoubt also to know about to know also to know into know aobut to know also to knw abou to kow otkna bout ot knwo ato kn
//ASLO TO KNWO AOBUT TO KNOW IN THIS WORLD TO KNOW AOBUT TO LEARN TO KNWO AOUBT O OKNWO SIN<INCLUDE>

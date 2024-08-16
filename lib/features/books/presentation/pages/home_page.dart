import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final List<String> _items = ['1','2','3','4','5','6','7','8','9'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body:
         AnimatedList(
           initialItemCount: 10,
           scrollDirection: Axis.horizontal,
           itemBuilder: (context, index, animation){
             return _book(index,_items[index],animation);
           },
          ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Hero(
        tag: 'addButton',
        child: IconButton(
          onPressed: (){},
          icon:  const Icon(Icons.add,size: 36,),
          ),
      ),
    );


  }
  Widget _book(int index,String group,Animation<double>animation){
    return Row(
      children: [
        SizeTransition(
          sizeFactor: animation,
          child: GestureDetector(
            onTap: (){},
            child: Container(
              height: 160,
              width: 98,
              color: Colors.black,
              margin: const EdgeInsets.all(17),
              child: Text(_items[index]),
            )
          ),
        )

      ],

    );
  }
  AppBar _buildAppBar() {
    return AppBar(
      title: const Text('Booker'),
      leading:  GestureDetector(
        onTap: (){},
        child: Container(
          width: 24,
          child: const Icon(Icons.exit_to_app_outlined, size:  24,),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: (){},
          child: Container(
            margin: const EdgeInsets.all(14),
            width: 24,
            child: const Hero(
              tag: 'editIcon',
              child: Icon(Icons.edit, size: 24,),
            ),
          )
        )
      ],
    );
  }

}

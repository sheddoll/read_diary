import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DeleteBook extends StatelessWidget {
  const DeleteBook({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: _buildAppBar(),

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
              child: Icon(Icons.close, size: 24,),
            ),
          )
        )
      ],
    );
  }
}



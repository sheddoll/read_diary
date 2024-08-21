import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:read_diary/features/books/presentation/widgets/widgets.dart';

class GetBookPage extends StatelessWidget {
  GetBookPage({super.key});
  final bool getBook = true;
  final List _items = [1,3,4,5,6,7,1];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: _buildAppBar(),
      body: buildBody(context, _items, false ,getBook ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Hero(
        tag: 'addButton',
        child: IconButton(
          style: const ButtonStyle(
            backgroundColor:WidgetStatePropertyAll( Color.fromRGBO(30, 0, 93, 1),) ,
          ),
          onPressed: (){},
          icon:  const Icon(Icons.close,size: 36, color: Color.fromRGBO(179, 38, 30, 1),),
        ),
      ),

    );
  }


  AppBar _buildAppBar() {
    return AppBar(
      title: const TextField(

      ),
    );
  }
}



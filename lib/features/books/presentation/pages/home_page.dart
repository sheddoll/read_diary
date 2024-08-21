import 'package:flutter/material.dart';
import 'package:read_diary/features/books/presentation/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final List<String> _items = ['1','2','3','4','5','6','7','8','1','1','1','1','1','1','1','1'];
  bool deleteBook = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(deleteBook),

      body: buildBody(context, _items, deleteBook),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Hero(
        tag: 'addButton',
        child: IconButton(
          onPressed: (){ },
          icon:  const Icon(Icons.add,size: 36,),
          ),
      ),
    );
  }
}



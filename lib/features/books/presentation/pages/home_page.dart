import 'package:flutter/material.dart';

import 'package:read_diary/features/books/presentation/widgets/books_widgets.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final List<String> _items = ['1','2','3','4','5','6','7','8','1','1','1','1','1','1','1','1'];
  bool deleteBook = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(deleteBook),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisExtent: MediaQuery.of(context).size.height/5,
          crossAxisSpacing: 30,
          mainAxisSpacing: 40,
        ),
        padding: const EdgeInsets.symmetric(vertical: 40,horizontal: 20),
        itemCount: _items.length,
        itemBuilder: (BuildContext context, int index){
          return book(context,index, deleteBook);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Hero(
        tag: 'addButton',
        child: IconButton(
          onPressed: (){Navigator.pushReplacementNamed(context,'/getBookPage'); },
          icon:  const Icon(Icons.add,size: 36,),
          ),
      ),
    );
  }
}



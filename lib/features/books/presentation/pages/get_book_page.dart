import 'package:flutter/material.dart';
import 'package:read_diary/features/books/presentation/widgets/books_widgets.dart';

class GetBookPage extends StatelessWidget {
  GetBookPage({super.key});
  final List _items = [1,3,4,5,6,7,1];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: _buildAppBar(context),
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
          return  foundedBook(context, index);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Hero(
        tag: 'addButton',
        child: IconButton(
          style: const ButtonStyle(
            backgroundColor:WidgetStatePropertyAll( Color.fromRGBO(30, 0, 93, 1),) ,
          ),
          onPressed: (){Navigator.pushReplacementNamed(context,'/homePage');},
          icon:  const Icon(Icons.close,size: 36, color: Color.fromRGBO(179, 38, 30, 1),),
        ),
      ),

    );
  }


  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: TextField(
        decoration: const InputDecoration(
          hintText: 'Введите название',
          hintStyle: TextStyle(color: Colors.grey),
          filled: true,
          fillColor: Color(0xFFEAE6EF),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),// Закругление углов
            borderSide: BorderSide.none,
            ),
          enabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
            borderSide: BorderSide(color: Color.fromRGBO(29, 27, 32, 1),
            )
          ),
          focusedBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
            borderSide: BorderSide.none),
          ),
        style: const TextStyle(fontSize: 18.0, decoration: TextDecoration.none),
        onEditingComplete: (){},
      )
    );
  }
}



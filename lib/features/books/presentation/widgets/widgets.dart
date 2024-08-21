import 'package:flutter/material.dart';

GridView buildBody(BuildContext context, List items, bool deleteBook, bool getBook) {
  return GridView.builder(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      mainAxisExtent: MediaQuery.of(context).size.height/5,
      crossAxisSpacing: 30,
      mainAxisSpacing: 40,
    ),
    padding: const EdgeInsets.symmetric(vertical: 40,horizontal: 20),
    itemCount: items.length,
    itemBuilder: (BuildContext context, int index){
      return getBook == true ? _foundedBook(index)  : _book(index, deleteBook);
    },
  );
}


Widget _foundedBook(int index){
  return GestureDetector(
  onTap: (){},
  child: Container(
    decoration: const BoxDecoration(
    color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(20)),
      image: DecorationImage(image: AssetImage('asd')),
      boxShadow:[
        BoxShadow(
          color: Colors.black,
          blurRadius: 4,
          offset: Offset(0, 4),
        )
      ]
    ),
  ),
  );
}



Widget _book(int index, bool deleteBook){

  return  GestureDetector(
    onTapCancel: (){},
    child: Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          image: DecorationImage(image: AssetImage('asd')),
          boxShadow:[
            BoxShadow(
              color: Colors.black,
              blurRadius: 4,
              offset: Offset(0, 4),
            )
          ]
      ),
      child: Center(
        child: !deleteBook ?

           const SizedBox.shrink()

          : const AnimatedOpacity(
            opacity: 1,
            duration: Duration(seconds: 1),
            child: Icon(Icons.close, color: Colors.red, size: 90,),
        ),
      )
    ),
  );
}


AppBar buildAppBar(bool deleteBook) {
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
            child: Hero(
              tag: 'editIcon',
              child: !deleteBook ? const Icon(Icons.edit, size: 24,) : const Icon(Icons.close, size: 24,),
            ),
          )
      )
    ],
  );
}
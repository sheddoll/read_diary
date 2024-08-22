import 'package:flutter/material.dart';


Widget foundedBook(BuildContext context, int index){
  return GestureDetector(
  onTap: (){Navigator.pushReplacementNamed(context,'/bookInfoPage');},
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



Widget book(BuildContext context,int index, bool deleteBook){

  return  GestureDetector(
    onTap: (){Navigator.pushReplacementNamed(context,'/bookInfoPage');},
    child: Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          image: DecorationImage(image: AssetImage('assetName')),
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
    automaticallyImplyLeading: false,
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
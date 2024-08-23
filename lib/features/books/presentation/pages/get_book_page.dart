import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:read_diary/features/books/presentation/bloc/get_books/remote_books_bloc.dart';
import 'package:read_diary/features/books/presentation/bloc/get_books/remote_books_state.dart';
import 'package:read_diary/features/books/presentation/widgets/books_widgets.dart';

class GetBookPage extends StatelessWidget {
  GetBookPage({super.key});
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: _buildAppBar(context),
      body: BlocBuilder<RemoteBooksBloc,RemoteBooksState>(
        builder: (_,state){
          if(state is RemoteBooksLoading){
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          }
          if(state is RemoteBooksError){
            return  Center(
              child: AnimatedOpacity(
                duration: const Duration(seconds: 1),
                opacity: 0.5,
                child: Container(
                  color: const Color.fromRGBO(101, 85, 143, 1),
                  height: MediaQuery.of(context).size.height/4,
                  width: MediaQuery.of(context).size.width/1.5,
                  child: const Column(
                    children: [
                      Text('Книги не найдены'),
                      Icon(Icons.refresh),
                    ],
                  ),
                ),
              ),
            );
          }
          if(state is RemoteBooksDone){
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisExtent: MediaQuery.of(context).size.height/5,
                crossAxisSpacing: 30,
                mainAxisSpacing: 40,
              ),
              padding: const EdgeInsets.symmetric(vertical: 40,horizontal: 20),
              itemCount: state.books?.length,
              itemBuilder: (BuildContext context, int index){
                return  FoundedBookWidget(booksEntity: state.books![index]).foundedBook(context, index);
              },
            );
          }
          return const SizedBox.shrink();
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



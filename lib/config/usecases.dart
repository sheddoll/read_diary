abstract class UseCase<Type,Params> {
  Future<Type> call({required String bookName,Params params});
}
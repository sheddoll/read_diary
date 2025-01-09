abstract class UseCase<Type,Params> {
  Future<Type> call({dynamic params});
}

class Either<T , Y> {
  final T? _left;
  final Y? _right;

  const Either(T left, Y right):_left = left,_right= right;


  fold({required void Function(T value) leftAction, required void Function(Y value) rightAction}){
    if(_left!= null){
      leftAction(_left as T);
    }else{
      rightAction(_right as Y);
    }
  }

}
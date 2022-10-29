/// An extension of a List<String>
extension AList on List<String> {
  /// adds an item to List<String> if List<String> is empty.
  List<String> addIfEmpty(String item) {
    return isEmpty ? <String>[item] : this;
  }

  /// removes the last empty value/s of a List<String>
  List<String> removeLastEmpty() {
    final List<String> list_ = List.from(this);
    while (isNotEmpty && list_.last.isEmpty) {
      list_.removeLast();
    }
    return list_;
  }
}


/// Adds functionality to iterable
extension Loop<T> on Iterable<T> {
  /// map an iterable with the iterable given to you in the transformer
  Iterable<Y> map3<Y>(
      Y Function(T value, int index, Iterable<T> list) transformer) {
    var index = 0;
    return map((item) {
      return transformer(item, index++, take(length));
    });
  }

  /// normal map function with the current index given to you in the transformer
  Iterable<Y> map2<Y>(Y Function(T value, int index) transformer) {
    var index = 0;
    return map((item) {
      return transformer(item, index++);
    });
  }

  /// foreach with the iterable being looped given to you in the transformer
  void forEach3<Y>(
      void Function(T value, int index, Iterable<T> list) transformer) {
    var index = 0;
    forEach((item) {
      transformer(item, index, take(length));
      index = index + 1;
    });
  }

  /// normal forEach  with the current index given to you in the transformer
  void forEach2<Y>(void Function(T value, int index) transformer) {
    var index = 0;
    forEach((item) {
      transformer(item, index);
      index = index + 1;
    });
  }
}

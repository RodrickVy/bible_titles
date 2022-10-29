import 'package:collection/collection.dart';

///Pair is used to combine together two values that may be of different data types.
///Pair provides a way to store two heterogeneous objects as a single unit.
///
/// eg.
/// ```
/// const Vendor vendor1 = Vendor();
/// const Customer customer1 = Customer();
///
/// const Pair<Vendor,Customer> participants = Pair(vendor1,customer2);
/// ```
///
class Pair<T, S> {
  const Pair([T? first, S? second])
      : _first = first,
        _second = second;

  final T? _first;
  final S? _second;

  T get first => _first!;

  S get second => _second!;

  bool get isEmpty {
    return _second == null && _first == null;
  }

  bool get isNotEmpty {
    return !isEmpty;
  }

  @override
  String toString() => 'Pair[$first, $second]';

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Pair &&
            runtimeType == other.runtimeType &&
            const DeepCollectionEquality()
                .equals([first, second], [other.first, other.second]);
  }

  @override
  int get hashCode => _first.hashCode ^ _second.hashCode;
}

/// Merges two paired lists into a single list of [M] where [M] is the return
/// of the provided [merger].
///
/// eg. ```

/// List<UserProfile> _userProfiles = Pair(List<Users>[...],List<RandomAvatar>[...])
/// .parallelMerge((User user,RandomAvatar avatar){
///      return UserProfile(
///      name:user.name,
///      avatarUrl:avatar.url,
///      ...
///    );
/// })
///
/// ```
///
extension Merger<T, S> on Pair<List<T>, List<S>> {
  List<M> parallelMerge<M>(M Function(T first, S second) merger) {
    if (first.length != second.length) {
      throw Exception(
          "2 Lists should be of the same length to parallel merge.");
    }
    return List.generate(first.length, (index) {
      return merger(first[index], second[index]);
    });
  }
}

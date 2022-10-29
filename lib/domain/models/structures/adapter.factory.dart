
/// A generic factor for use in adapter for simple serialization
/// and converting of model objects to other forms of implementation
/// that are just implementation detail.
mixin AdapterFactory<T extends Object> {
  Future<Map<String, dynamic>> toMap(final T object);

  Future<T> fromMap(final Map<String, dynamic> map);
}

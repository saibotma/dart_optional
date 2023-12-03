class Optional<T> {
  final T value;

  const Optional(this.value);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Optional &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;
}

extension ToOptionalExtension<T> on T {
  Optional<T> toOptional() {
    return Optional<T>(this);
  }
}

extension OptionalExtension<T> on Optional<T>? {
  T fallbackTo(T fallback) {
    if (this == null) return fallback;
    return this!.value;
  }

  Optional<O>? map<O>(O Function(T source) doMap) {
    if (this != null) {
      return doMap(this!.value).toOptional();
    }
    return null;
  }
}

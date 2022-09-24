class DomainError implements Exception {
  String cause;

  DomainError(this.cause);

  @override
  String toString() {
    return cause;
  }
}

class APIStatusHandler {
  bool screenReady = false;
  bool hasError = false;
  Map<String,dynamic> payload = {};

  APIStatusHandler({bool? isLoading, bool? errorStatus , Map<String,dynamic>? attachedPayload}) {
    screenReady = isLoading ?? false;
    hasError = errorStatus ?? false;
    payload = attachedPayload ?? {};
  }

  @override
  String toString() {
    return "=========================***=========================\n"
        "Screen Ready: $screenReady,\nHas Error: $hasError\n"
        "Payload: $payload\n"
        "=========================***=========================";
  }
}

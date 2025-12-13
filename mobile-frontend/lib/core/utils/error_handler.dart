class ErrorHandler {
  bool hasError = false;
  String message = '';

  void set(String msg) {
    hasError = true;
    message = msg;
  }

  void clear() {
    hasError = false;
    message = '';
  }
}
void main() {
  var message = 'Hello';  // Lexical scope

  void sayHello() {
    print(message);  // Closure: mengakses 'message' dari outer scope
  }

  sayHello();  // Output: Hello
}

Function makeAdder(int addBy) {
  return (int i) => addBy + i;  // Closure: mengakses 'addBy'
}

void testClosure() {
  var add2 = makeAdder(2);
  print(add2(3));  // Output: 5
}
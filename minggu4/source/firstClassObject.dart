void main() {
  // Menyimpan function dalam variabel
  var sayHello = (String name) => print('Hello, $name!');
  sayHello('Wan');  // Output: Hello, Bob!

  // Melewatkan function sebagai argumen
  ['apple', 'banana', 'cherry'].forEach(print);

  // Mengembalikan function dari function lain
  Function multiplyBy(int n) {
    return (int x) => x * n;
  }
  var multiplyByTwo = multiplyBy(2);
  print(multiplyByTwo(5));  // Output: 10
}
void main() {
  var numbers = [1, 2, 3, 4, 5];
  
  // Anonymous function sebagai argumen
  var squared = numbers.map((number) => number * number);
  print(squared);  // Output: (1, 4, 9, 16, 25)
}
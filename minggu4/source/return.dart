//menggunakan list
List<int> calculate(int a, int b) {
  int sum = a + b;
  int difference = a - b;
  return [sum, difference];
}

void main() {
  var result = calculate(10, 5);
  print("Sum: ${result[0]}, Difference: ${result[1]}");  // Output: Sum: 15, Difference: 5
}

//menggunakan map
// Map<String, int> calculate(int a, int b) {
//   return {'sum': a + b, 'difference': a - b};
// }

// void main() {
//   var result = calculate(10, 5);
//   print("Sum: ${result['sum']}, Difference: ${result['difference']}");  // Output: Sum: 15, Difference: 5
// }

// Custom class untuk menyimpan hasil penjumlahan dan pengurangan
// class CalculationResult {
//   final int sum;
//   final int difference;

//   // Constructor
//   CalculationResult(this.sum, this.difference);
// }

// // Fungsi calculate menggunakan custom class
// CalculationResult calculate(int a, int b) {
//   int sum = a + b;
//   int difference = a - b;

//   // Mengembalikan object dari CalculationResult
//   return CalculationResult(sum, difference);
// }

// void main() {
//   // Menggunakan fungsi calculate
//   var result = calculate(10, 5);

//   // Mengakses hasil penjumlahan dan pengurangan melalui object
//   print(
//       "Sum: ${result.sum}, Difference: ${result.difference}"); // Output: Sum: 15, Difference: 5
// }

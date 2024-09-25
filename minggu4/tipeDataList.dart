void main(){
//   var list = [1, 2, 3];
// assert(list.length == 3);
// assert(list[1] == 2);
// print(list.length);
// print(list[1]);

// list[1] = 1;
// assert(list[1] == 1);
// print(list[1]);

  final List<String?> list = List.filled(5, null);
  
  // Mengisi nama dan NIM pada index ke-1 dan ke-2

  list[0] = "ikhwandi";
  list[1] = "2241720028";
  
  // Mencetak isi list
  print(list);
  
  // Mencetak panjang list
  // print("Panjang list: ${list.length}");
  
  // Mencetak elemen pada index ke-1 dan ke-2
  print("Nama: ${list[1]}");
  print("Nim: ${list[2]}");
  
}
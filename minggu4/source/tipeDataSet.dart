void main(){
  var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
print(halogens);

  // Membuat dua Set
  var names1 = <String>{};
  Set<String> names2 = {};

  // Menggunakan .add() untuk menambahkan nama dan NIM ke names1
  names1.add('Nama: [ikhwandi]');
  names1.add('NIM: [2241720028]');

  // Menggunakan .addAll() untuk menambahkan nama dan NIM ke names2
  names2.addAll({'Nama: [ikhwandi]', 'NIM: [2241720028]'});

  // Menampilkan isi dari kedua Set
  print("Names1: $names1");
  print("Names2: $names2");

}
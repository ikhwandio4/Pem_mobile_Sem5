void main() {
  // Map gifts dengan tipe String sebagai key dan dynamic sebagai value
  var gifts = <String, dynamic>{
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 1,
  };

  // Map nobleGases dengan tipe int sebagai key dan dynamic sebagai value
  var nobleGases = <int, dynamic>{
    2: 'helium',
    10: 'neon',
    18: 2,
  };

  // Update gifts (key 'fifth' sebelumnya berisi int, sekarang menjadi String)
  gifts['fifth'] = 'golden rings';

  // Update nobleGases (key 18 sebelumnya berisi int, sekarang menjadi String)
  nobleGases[18] = 'argon';

  // Menambahkan elemen nama dan NIM Anda pada gifts dan nobleGases
  gifts['name'] = 'Nama: [Ikhwandi]';
  gifts['NIM'] = 'NIM: [2241720028]';
  nobleGases[99] = 'Nama: [ikhwandi]';
  nobleGases[100] = 'NIM: [2241720028]';

  // Membuat mhs1 dengan tipe String, String
  var mhs1 = Map<String, String>();
  mhs1['name'] = 'Nama: [ikhwandi]';
  mhs1['NIM'] = 'NIM: [2241720028]';

  // Membuat mhs2 dengan tipe int, String
  var mhs2 = Map<int, String>();
  mhs2[1] = 'Nama: [ikhwandi]';
  mhs2[2] = 'NIM: [2241720028';

  // Mencetak semua map
  print("gifts: $gifts");
  print("nobleGases: $nobleGases");
  print("mhs1: $mhs1");
  print("mhs2: $mhs2");
}

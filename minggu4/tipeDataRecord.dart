void main() {
  // Record dengan positional dan named fields
  var record = ('first', a: 2, b: true, 'last');
  print(record);

  // Fungsi tukar untuk menukar dua nilai dalam record
  (int, int) tukar((int, int) record) {
    var (a, b) = record;
    return (b, a);
  }

  // Record type annotation in a variable declaration
  (String, int) mahasiswa;

  // Inisialisasi record dengan nama dan NIM
  mahasiswa = ("Ikhwandi", 2241720028);
  print("Record mahasiswa: $mahasiswa");
  print("Nama: ${mahasiswa.$1}"); // Mengakses elemen pertama
  print("NIM: ${mahasiswa.$2}"); // Mengakses elemen kedua

  // Contoh penggunaan record dengan named fields
  ({String nama, int nim}) mahasiswa2 = (nama: "Ikhwandi", nim: 2241720028);
  print("\nRecord mahasiswa2: $mahasiswa2");
  print("Nama: ${mahasiswa2.nama}"); // Mengakses field 'nama'
  print("NIM: ${mahasiswa2.nim}"); // Mengakses field 'nim'

  // Contoh penggunaan record dengan positional dan named fields
  var mahasiswa3 = ('first', a: 2, b: true, 'last');
  print("\nRecord mahasiswa3: $mahasiswa3");
  print(mahasiswa3.$1); // Mengakses elemen pertama (positional field)
  print(mahasiswa3.a); // Mengakses named field 'a'
  print(mahasiswa3.b); // Mengakses named field 'b'
  print(mahasiswa3.$1); // Mengakses elemen keempat (positional field)
}

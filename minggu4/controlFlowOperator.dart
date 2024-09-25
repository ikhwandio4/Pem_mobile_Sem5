void main() {
  var list1 = [1, 2, 3];
  var list2 = [0, ...list1];
  print("list1: $list1");
  print("list2: $list2");
  print("Panjang list2: ${list2.length}");

  var list = [1, 2, null];
  print("list1: $list1");
  var list3 = [0, ...?list1];
  print("list3: $list3");
  print("Panjang list3: ${list3.length}");

  // Tambahkan NIM Anda di sini (ganti dengan NIM Anda sendiri)
  var nimList = [2, 2, 4, 1, 7, 2, 0, 0, 2, 8];
  var combinedList = [...list3, ...nimList];
  print("Combined list dengan NIM: $combinedList");
  print("Panjang combined list: ${combinedList.length}");
  // Menambahkan definisi variabel yang hilang
  bool promoActive = true;
  var nav = ['Home', 'Furniture', 'Plants', if (promoActive) 'Outlet'];
  print("nav: $nav");

  // Menambahkan definisi variabel yang hilang
  String login = 'Manager';
  var nav2 = ['Home', 'Furniture', 'Plants', if (login case 'Manager') 'Inventory'];
  print("nav2: $nav2");

  var listOfInts = [1, 2, 3];
  var listOfStrings = ['#0', for (var i in listOfInts) '#$i'];
  assert(listOfStrings[1] == '#1');
  print("listOfStrings: $listOfStrings");
}
void main() {
  var list1 = [1, 2, null];
  print("list1: $list1");
  
  var list3 = [0, ...?list1];
  print("list3: $list3");
  print("Panjang list3: ${list3.length}");

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
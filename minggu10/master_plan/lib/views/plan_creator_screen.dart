import 'package:flutter/material.dart';
import 'plan_screen.dart'; // import PlanScreen jika diperlukan untuk navigasi
import '../provider/plan_provider.dart'; // import PlanProvider untuk mengelola state
import '../models/data_layer.dart'; // import model Plan

class PlanCreatorScreen extends StatefulWidget {
  const PlanCreatorScreen({super.key});

  @override
  _PlanCreatorScreenState createState() => _PlanCreatorScreenState();
}

class _PlanCreatorScreenState extends State<PlanCreatorScreen> {
  // Controller untuk mengelola teks input
  final textController = TextEditingController();

  // Dispose controller ketika widget dihapus
  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  // Method untuk membuat layout halaman
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Master Plans Ikhwandi')), 
      body: Column(
        children: [
          _buildListCreator(), // Field untuk menambahkan plan baru
          Expanded(child: _buildMasterPlans()), // Daftar semua plan
        ],
      ),
    );
  }

  // Widget untuk input teks dan tombol "Add Plan"
  Widget _buildListCreator() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Material(
        color: Theme.of(context).cardColor,
        elevation: 10,
        child: TextField(
          controller: textController,
          decoration: const InputDecoration(
            labelText: 'Add a plan',
            contentPadding: EdgeInsets.all(20),
          ),
          onEditingComplete: addPlan, // Menambahkan plan ketika user selesai mengisi teks
        ),
      ),
    );
  }

  // Fungsi untuk menambahkan plan baru ke dalam daftar
  void addPlan() {
    final text = textController.text;
    if (text.isEmpty) {
      return;
    }
    // Membuat objek Plan baru
    final plan = Plan(name: text, tasks: []);
    ValueNotifier<List<Plan>> planNotifier = PlanProvider.of(context);
    planNotifier.value = List<Plan>.from(planNotifier.value)..add(plan);

    // Reset input dan update state
    textController.clear();
    FocusScope.of(context).requestFocus(FocusNode());
    setState(() {});
  }

  // Widget untuk menampilkan daftar plan yang sudah ditambahkan
  Widget _buildMasterPlans() {
    ValueNotifier<List<Plan>> planNotifier = PlanProvider.of(context);
    List<Plan> plans = planNotifier.value;

    // Jika daftar kosong, tampilkan pesan kosong
    if (plans.isEmpty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Icon(Icons.note, size: 100, color: Colors.grey),
          Text(
            'Anda belum memiliki rencana apapun.',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ],
      );
    }

    // Tampilkan daftar plan dengan ListView
    return ListView.builder(
      itemCount: plans.length,
      itemBuilder: (context, index) {
        final plan = plans[index];
        return ListTile(
          title: Text(plan.name),
          subtitle: Text(plan.completenessMessage),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => PlanScreen(plan: plan)),
            );
          },
        );
      },
    );
  }
}

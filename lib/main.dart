import 'package:flutter/material.dart';

void main() {
  runApp(const MiniWidgetsApp());
}

class MiniWidgetsApp extends StatelessWidget {
  const MiniWidgetsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HOMEWORK',
      theme: ThemeData(colorSchemeSeed: Colors.lightGreen, useMaterial3: true),
      home: const WidgetsPage(),
    );
  }
}

class WidgetsPage extends StatefulWidget {
  const WidgetsPage({super.key});

  @override
  State<WidgetsPage> createState() => _WidgetsPageState();
}

class _WidgetsPageState extends State<WidgetsPage> {
  bool isChecked = false;
  bool isSwitched = true;
  final TextEditingController nameController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Widgets'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          // 1. Text
          const Text(
            '1. Text Widget',
            style: TextStyle(
              fontSize: 20,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          const Text('Hello Flutter!', style: TextStyle(fontSize: 15)),
          const SizedBox(height: 20),

          // 2. Icon
          const Text(
            '2. Icon Widget',
            style: TextStyle(
              fontSize: 20,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.home, color: Colors.deepOrange, size: 30),
              Icon(Icons.smartphone, color: Colors.blue, size: 30),
              Icon(Icons.rocket_launch, color: Colors.yellow, size: 30),
              Icon(Icons.sports_bar, color: Colors.blueGrey, size: 30),
              Icon(Icons.catching_pokemon, color: Colors.green, size: 30),
            ],
          ),
          const SizedBox(height: 20),
          // 3. Image
          const Text(
            '3. Image Widget',
            style: TextStyle(
              fontSize: 20,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Image.network(
            'https://images.unsplash.com/photo-1568605114967-8130f3a36994?auto=format&fit=crop&w=300&q=80',
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return const Text('Image unavailable');
            },
          ),
          const SizedBox(height: 20),

          // 4. Container
          const Text(
            '4. Container Widget',
            style: TextStyle(
              fontSize: 20,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            height: 35,
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.pinkAccent,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'Pick it up.',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          const SizedBox(height: 20),

          // 5. Row
          const Text(
            '5. Row Widget',
            style: TextStyle(
              fontSize: 20,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.car_crash, size: 30, color: Colors.deepPurpleAccent),
              Icon(Icons.local_hospital, size: 30, color: Colors.green),
              Icon(Icons.person, size: 30, color: Colors.orange),
            ],
          ),
          const SizedBox(height: 20),
          // 6. Column
          const Text(
            '6. Column Widget',
            style: TextStyle(
              fontSize: 20,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'First ',
                    style: TextStyle(color: Colors.red, fontSize: 20),
                  ),
                  Icon(Icons.star, color: Colors.red),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Second ',
                    style: TextStyle(color: Colors.pinkAccent, fontSize: 20),
                  ),
                  Icon(Icons.favorite, color: Colors.pinkAccent),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Third ',
                    style: TextStyle(color: Colors.lightGreen, fontSize: 20),
                  ),
                  Icon(Icons.eco, color: Colors.lightGreen),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),

          // 7. ElevatedButton
          const Text(
            '7. ElevatedButton Widget',
            style: TextStyle(
              fontSize: 20,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.pinkAccent,
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Button clicked!'),
                  backgroundColor: Colors.pinkAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                ),
              );
            },
            child: const Text('Click Me'),
          ),
          const SizedBox(height: 20),

          // 8. TextField
          const Text(
            '8. TextField Widget',
            style: TextStyle(
              fontSize: 20,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextField(
            controller: nameController,
            decoration: const InputDecoration(
              labelText: 'Enter your name',
              hintText: 'Your name here',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.person),
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
            onPressed: () {
              final name = nameController.text.trim();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    name.isEmpty ? 'Please enter your name' : 'Hello, $name!',
                  ),
                  backgroundColor: Colors.pinkAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                ),
              );
            },
            child: const Text(
              'Submit Name',
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(height: 20),

          // 9. Checkbox
          const Text(
            '9. Checkbox Widget',
            style: TextStyle(
              fontSize: 20,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
          CheckboxListTile(
            title: const Text('Agree with it.'),
            value: isChecked,
            onChanged: (value) {
              setState(() {
                isChecked = value ?? false;
              });
            },
          ),
          const SizedBox(height: 20),

          // 10. Switch
          const Text(
            '10. Switch Widget',
            style: TextStyle(
              fontSize: 20,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
          SwitchListTile(
            title: const Text('Enable notifications'),
            value: isSwitched,
            onChanged: (value) {
              setState(() {
                isSwitched = value;
              });
            },
          ),
          const SizedBox(height: 20),

          const Center(
            child: Text(
              'End of Widgets!',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}

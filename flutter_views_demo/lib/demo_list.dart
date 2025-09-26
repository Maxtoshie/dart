import 'package:flutter/material.dart';

class DemoList extends StatefulWidget {
  const DemoList({super.key});

  @override
  _DemoListState createState() => _DemoListState();
}

class _DemoListState extends State<DemoList> {
  int _counter = 0;
  final TextEditingController _controller = TextEditingController();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        Card(
          child: ListTile(
            leading: const Icon(Icons.star),
            title: const Text('List Item 1'),
            subtitle: const Text('With icon and subtitle'),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {}, // Add delete logic if needed
            ),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.all(8.0),
          color: Colors.grey[200],
          child: Column(
            children: [
              const Text('Enter Text:', style: TextStyle(fontSize: 18)),
              TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Type something...',
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Image.asset('assets/images/image1.jpg'), // Replace with your image
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: _incrementCounter,
              child: const Text('Increment'),
            ),
            Text('Counter: $_counter', style: const TextStyle(fontSize: 20)),
          ],
        ),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SecondScreen()),
            );
          },
          child: const Text(
            'Tap to Navigate to Grid Screen',
            style: TextStyle(
              color: Colors.blue,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

// Bonus: A second screen for navigation
class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Second Screen')),
      body: const Center(child: Text('Navigated Here!')),
    );
  }
}
